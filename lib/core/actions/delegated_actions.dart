// Delegation pattern actions

import 'package:notodo/features/todos/domain/entities/todo.dart';
import 'package:rxdart/rxdart.dart';

abstract class DelegatedActions {
  final openTodo = PublishSubject<ToDo>();
  final openAddEditPage = PublishSubject<ToDo?>();
}
