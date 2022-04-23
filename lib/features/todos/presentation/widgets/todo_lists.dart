import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:notodo/core/enums.dart';
import 'package:notodo/features/todos/domain/entities/todo.dart';

class TodoListsWidget extends HookWidget {
  final Map<TodoStatus, List<ToDo>> items;
  const TodoListsWidget(this.items, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
