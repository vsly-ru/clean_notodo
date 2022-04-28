import 'package:dartz/dartz_streaming.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';
import 'package:notodo/core/state/app_state_manager.dart';
import 'package:notodo/core/widgets/default_screen.dart';
import 'package:notodo/core/widgets/failed_widget.dart';
import 'package:notodo/core/widgets/placeholder.dart';
import 'package:notodo/core/widgets/progress_widget.dart';
import 'package:notodo/core/widgets/widget_fadein.dart';
import 'package:notodo/features/todos/domain/repositories/todo_repository.dart';
import 'package:notodo/features/todos/domain/usecases/get_todo_list.dart';
import 'package:notodo/features/todos/presentation/cubit/todo_list_cubit.dart';
import 'package:notodo/features/todos/presentation/widgets/todo_list_scaffold.dart';
import 'package:notodo/features/todos/presentation/widgets/todo_list_screen.dart';

class PageTodoList extends HookWidget {
  final TodoListCubit cubit;

  const PageTodoList({required this.cubit, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      // on build
      cubit.loadAll();
      return null; // returns callback to run on dispose
    });

    return BlocBuilder<TodoListCubit, TodoListState>(
        bloc: cubit,
        builder: (context, state) {
          if (state.errMessage != null) {
            return TodoListScaffold(cubit,
                body: FadeIn(
                  offset: const Offset(0, 0),
                  duration: 200,
                  child: FailedWidget(
                      message: state.errMessage,
                      retry: cubit.loadAll,
                      retryText: 'Попробовать снова'),
                ));
          }
          return TodoListScaffold(cubit,
              body: state.items != null
                  ? TodoListScreen(cubit, items: state.items!)
                  : Center(
                      child: FadeIn(
                        child: ProgressWidget.loadingList(context),
                        offset: const Offset(0, 0),
                        opacity: 0.3,
                        scale: 0.3,
                        duration: 1280, // fadeIn duration
                      ),
                    ));
        });
  }
}
