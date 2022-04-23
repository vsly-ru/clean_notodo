import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notodo/core/enums.dart';
import 'package:notodo/core/errors/failure.dart';
import 'package:notodo/features/todos/domain/entities/todo.dart';
import 'package:notodo/features/todos/domain/repositories/todo_repository.dart';

part 'todo_list_state.dart';
part 'todo_list_cubit.freezed.dart';

class TodoListCubit extends Cubit<TodoListState> {
  final ITodoRepository _repository;
  TodoListCubit(this._repository) : super(TodoListState.initial());

  @override
  void onChange(Change<TodoListState> change) {
    super.onChange(change);

    log('state changed: $change');
  }

  Future<void> loadAll() async {
    try {
      // emit(const TodoListState.loading());
      final result = await _repository.getList(null);
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

  // _

  void _failed(Failure failure) {
    emit(TodoListState(errMessage: '[${failure.code}] error.message'));
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
