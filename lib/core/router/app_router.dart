import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:notodo/core/actions/delegated_actions.dart';
import 'package:notodo/di.dart';
import 'package:notodo/features/auth/presentation/pages/signin_page.dart';
import 'package:notodo/features/todos/domain/entities/todo.dart';
import 'package:notodo/features/todos/presentation/cubit/todo_list_cubit.dart';
import 'package:notodo/features/todos/presentation/pages/page_add_edit_todo.dart';
import 'package:notodo/features/todos/presentation/pages/page_todo_list.dart';
import '../state/app_state_manager.dart';

import 'page_routes.dart';

const _initialRoute = PageRoutes.home;

@injectable
class AppRouter extends GoRouter {
  final AppStateManager _appStateManager;
  final IDelegatedActions _delegatedActions;
  late final List<StreamSubscription> _delegated;

  AppRouter(this._appStateManager, this._delegatedActions)
      : super(
            refreshListenable: Listenable.merge([
              // AppRouter will listen to app state changes and react accordingly (with redirect logic)
              _appStateManager
            ]),
            redirect: (routerState) {
              // this redirection logic runs on every state update
              if (routerState.subloc == PageRoutes.signin &&
                  _appStateManager.state.authenticated == true) {
                //  if login was a success, redirecting to a page we came [from]
                final from = routerState.queryParams['from'];
                return from ?? PageRoutes.home;
              }
              if (routerState.subloc == PageRoutes.signin &&
                  _appStateManager.state.offlineMode == true) {
                //  if offline mode was selected, redirecting to home page (for farther redirection logic => see below)
                return PageRoutes.home;
              }
              // do not redirect by default
              return null;
            },
            routes: [
              GoRoute(
                  // 🏠 initial route (redirects to an actual starting page)
                  path: PageRoutes.home,
                  redirect: ((state) {
                    if (_appStateManager.state.authenticated == true) {
                      // open todo lists page in a normal online mode
                      return PageRoutes.todoList;
                    }
                    if (_appStateManager.state.offlineMode == true) {
                      // renders todo lists page in an offline (dev) mode
                      return PageRoutes.todoList;
                    }
                    // otherwise showing sign in page
                    return PageRoutes.signin;
                  })),
              GoRoute(
                  path: PageRoutes.signin,
                  pageBuilder: (context, state) {
                    return MaterialPage(
                      key: state.pageKey,
                      child: SigninPage(
                          appStateManager: _appStateManager,
                          repository: getIt()),
                    );
                  },
                  redirect: ((state) {
                    if (_appStateManager.state.authenticated == true) {
                      return PageRoutes.todoList;
                    }
                  })),
              GoRoute(
                  path: PageRoutes.todoList,
                  pageBuilder: (context, state) {
                    return MaterialPage(
                      key: state.pageKey,
                      child: PageTodoList(cubit: getIt<TodoListCubit>()),
                    );
                  }),
              GoRoute(
                  // add, view one item details, edit
                  path: PageRoutes.todo,
                  pageBuilder: (context, state) {
                    final ToDo? todo = state.extra as ToDo?;
                    final String? id = state.queryParams['id'] ?? todo?.id;
                    final isAdding = todo == null && id == null;
                    return MaterialPage(
                      key: state.pageKey,
                      child: PageAddEditViewTodo(
                        adding: isAdding,
                        id: id,
                        extraTodo: todo,
                        appStateManager: _appStateManager,
                        repository: getIt(),
                        key: id != null ? Key(id) : null,
                      ),
                    );
                  }),
            ]) {
    _subscribeDelegatedEvents();
  }

  void _subscribeDelegatedEvents() {
    _delegated = [
      _delegatedActions.addTodo.listen((void _) {
        go(PageRoutes.todo);
      }),
      _delegatedActions.openTodo.listen((todo) {
        final encodedId = Uri.encodeComponent(todo.id);
        go('${PageRoutes.todo}?id=$encodedId', extra: todo);
      })
    ];
  }

  @override
  void dispose() {
    for (final subscription in _delegated) {
      subscription.cancel();
    }

    super.dispose();
  }
}
