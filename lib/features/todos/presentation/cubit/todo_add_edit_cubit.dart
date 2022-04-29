import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:notodo/features/todos/domain/entities/todo.dart';
import 'package:notodo/features/todos/domain/repositories/todo_repository.dart';
import 'package:notodo/features/todos/domain/usecases/save_todo.dart';

part 'todo_add_edit_state.dart';
part 'todo_add_edit_cubit.freezed.dart';

@injectable
class TodoAddEditCubit extends Cubit<TodoAddEditState> {
  final SaveTodoUC _saveTodoUC;
  TodoAddEditCubit(this._saveTodoUC) : super(TodoAddEditState.initial());

  void initAdding() {
    emit(TodoAddEditState.adding());
  }

  void initViewing(ToDo todo) {
    emit(TodoAddEditState.viewing(todo));
  }
}
