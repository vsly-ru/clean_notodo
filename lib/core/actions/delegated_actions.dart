// Delegation pattern actions

import 'package:notodo/features/todos/domain/entities/todo.dart';
import 'package:rxdart/rxdart.dart';

abstract class IDelegatedActions {
  /// open adding page
  final addTodo = PublishSubject<void>();

  /// open view/editing page
  final openTodo = PublishSubject<ToDo>();
}
