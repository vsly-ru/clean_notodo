import 'package:dartz/dartz_streaming.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';
import 'package:notodo/core/widgets/default_screen.dart';
import 'package:notodo/core/widgets/failed_widget.dart';
import 'package:notodo/core/widgets/placeholder.dart';
import 'package:notodo/core/widgets/progress_widget.dart';
import 'package:notodo/core/widgets/widget_fadein.dart';
import 'package:notodo/features/todos/domain/repositories/todo_repository.dart';
import 'package:notodo/features/todos/presentation/cubit/todo_list_cubit.dart';
import 'package:notodo/features/todos/presentation/widgets/todo_list_scaffold.dart';
import 'package:notodo/features/todos/presentation/widgets/todo_list_screen.dart';

class PageTodoList extends HookWidget {
  final ITodoRepository _repository;

  const PageTodoList(this._repository, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _listCubit = useMemoized(() => TodoListCubit(_repository));
    useEffect(() {
      // on build
      _listCubit.loadAll();
      return null; // returns callback to run on dispose
    });

    const Key loadingKey = Key('todo_loading_widget');

    return BlocBuilder<TodoListCubit, TodoListState>(
        bloc: _listCubit,
        builder: (context, state) {
          if (state.errMessage != null) {
            return TodoListScaffold(_listCubit,
                body: FadeIn(
                  offset: const Offset(0, 0),
                  child: FailedWidget(
                      message: state.errMessage,
                      retry: _listCubit.loadAll,
                      retryText: 'Попробовать снова'),
                ));
          }
          if (state.isLoading) {
            return TodoListScaffold(_listCubit,
                body: Center(
                  child: FadeIn(
                    key: loadingKey,
                    child: ProgressWidget.loadingList(context),
                    offset: const Offset(0, 0),
                    opacity: 0.25,
                    duration: 3280, // fadeIn duration
                  ),
                ));
          }
          // the items has been loaded
          if (state.items != null) {
            return TodoListScaffold(_listCubit,
                body: FadeIn(
                    offset: const Offset(0, 0),
                    child: TodoListScreen(_listCubit, items: state.items!)));
          }
          // failstate (not implemented state)
          return const DefaultScreenScaffold(body: PlaceholderWidget());
        });
  }
}
