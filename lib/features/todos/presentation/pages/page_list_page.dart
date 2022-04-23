import 'package:dartz/dartz_streaming.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';
import 'package:notodo/core/widgets/failed_widget.dart';
import 'package:notodo/core/widgets/placeholder.dart';
import 'package:notodo/core/widgets/progress_widget.dart';
import 'package:notodo/core/widgets/widget_fadein.dart';
import 'package:notodo/features/todos/domain/repositories/todo_repository.dart';
import 'package:notodo/features/todos/presentation/cubit/todo_list_cubit.dart';

class PageTodoList extends HookWidget {
  final ITodoRepository _repository;

  const PageTodoList(this._repository) : super();

  @override
  Widget build(BuildContext context) {
    final _listCubit = useMemoized(() => TodoListCubit(_repository));
    return SafeArea(child: Scaffold(
      body:
          BlocBuilder<TodoListCubit, TodoListState>(builder: (context, state) {
        if (state.errMessage != null) {
          return FadeIn(
            child: FailedWidget(
                message: state.errMessage,
                retry: _listCubit.loadAll,
                retryText: 'Обновить'),
          );
        }
        if (state.isLoading) {
          return FadeIn(child: ProgressWidget.loadingList(context));
        }
        // failstate
        return PlaceholderWidget();
      }),
    ));
  }
}
