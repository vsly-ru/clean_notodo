import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:notodo/di.dart';
import 'package:notodo/features/auth/presentation/pages/signin_page.dart';
import 'package:notodo/features/todos/presentation/pages/page_todo_list.dart';
import '../state/app_state_manager.dart';

import 'page_routes.dart';

const _initialRoute = PageRoutes.home;

@injectable
class AppRouter extends GoRouter {
  final AppStateManager _appStateManager;
  late final List<StreamSubscription> _deligated;

  AppRouter(this._appStateManager)
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
                //  if offline mode was selected, redirecting to home page (for a farther redirection logic => see below)
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
                      // renders todo lists page in an offline mode
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
                      child: SigninPage(_appStateManager),
                    );
                  },
                  redirect: ((state) {
                    if (_appStateManager.state.authenticated == true)
                      return PageRoutes.todoList;
                  })),
              GoRoute(
                  path: PageRoutes.todoList,
                  pageBuilder: (context, state) {
                    return MaterialPage(
                      key: state.pageKey,
                      child: PageTodoList(getIt()),
                    );
                  }),
            ]) {
    _subscribeDeligatedEvents();
  }

  void _subscribeDeligatedEvents() {
    // TODO: subscribe to deligated events
    _deligated = [];
  }

  @override
  void dispose() {
    for (final deligatedSubscription in _deligated) {
      deligatedSubscription.cancel();
    }

    super.dispose();
  }
}
