import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:notodo/core/state/app_state_manager.dart';
import 'package:notodo/features/todos/domain/entities/todo.dart';
import 'package:notodo/features/todos/domain/repositories/todo_repository.dart';
import 'package:notodo/features/todos/presentation/cubit/todo_add_edit_cubit.dart';

class PageAddEditViewTodo extends HookWidget {
  final AppStateManager appStateManager;
  final ITodoRepository repository;

  /// adding mode
  final bool adding;

  /// todo id
  final String? id;

  /// optional todo when opened via delegated action (TODO: otherwise will be loaded using id)
  final ToDo? extraTodo;

  const PageAddEditViewTodo(
      {required this.repository,
      required this.appStateManager,
      required this.adding,
      this.id,
      this.extraTodo,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TodoAddEditCubit cubit =
        useMemoized(() => TodoAddEditCubit(repository));
    return BlocBuilder(
        bloc: cubit,
        builder: (context, state) {
          return Scaffold();
        });
  }
}
