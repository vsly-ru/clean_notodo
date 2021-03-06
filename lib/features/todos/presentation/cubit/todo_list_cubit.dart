import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:notodo/core/enums.dart';
import 'package:notodo/core/errors/failure.dart';
import 'package:notodo/features/todos/domain/entities/todo.dart';
import 'package:notodo/features/todos/domain/repositories/todo_repository.dart';
import 'package:notodo/features/todos/domain/usecases/get_todo_list.dart';
import 'package:notodo/features/todos/presentation/actions/open_add_page%20copy.dart';
import 'package:notodo/features/todos/presentation/actions/open_view_edit_page.dart';

part 'todo_list_state.dart';
part 'todo_list_cubit.freezed.dart';

@injectable
class TodoListCubit extends Cubit<TodoListState> {
  final GetTodoListUC _getTodoListUC;
  final OpenAddPageAction _openAddPageAction;
  final OpenViewEditPageAction _openViewEditPageAction;

  TodoListCubit(this._getTodoListUC, this._openAddPageAction,
      this._openViewEditPageAction)
      : super(TodoListState.initial());

  // debug
  // @override
  // void onChange(Change<TodoListState> change) {
  //   super.onChange(change);
  //   log('state changed: $change', name: 'TodoListCubit');
  // }

  void openAddPage() {
    _openAddPageAction(null);
  }

  void openViewEditPage(ToDo todo) {
    _openViewEditPageAction(todo);
  }

  Future<void> loadAll() async {
    try {
      final copyData = state.items;
      emit(TodoListState(isLoading: true, items: copyData));
      final result = await _getTodoListUC.execute(false);
      result.fold(
          (l) => _failed(l), (r) => emit(TodoListState(items: _mapList(r))));
    } catch (err) {
      if (err is Failure) {
        return _failed(err);
      } else {
        emit(TodoListState(errMessage: err.toString()));
      }
    }
  }

  // _ _ _ _ _ _ _ _

  void _failed(Failure failure) {
    emit(TodoListState(errMessage: '[${failure.code}] ${failure.message}'));
  }

  Map<TodoStatus, List<ToDo>> _mapList(List<ToDo> list) {
    Map<TodoStatus, List<ToDo>> re = {
      TodoStatus.statusNew: [],
      TodoStatus.statusInWork: [],
      TodoStatus.statusComplited: []
    };
    for (var todo in list) {
      if (todo.isComplited) {
        re[TodoStatus.statusComplited]!.add(todo);
        continue;
      }
      if (todo.isInWork) {
        re[TodoStatus.statusInWork]!.add(todo);
        continue;
      }
      // not complited & not inWork => new
      re[TodoStatus.statusNew]!.add(todo);
    }
    return re;
  }
}
