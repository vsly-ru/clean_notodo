import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:notodo/core/widgets/edit.dart';
import 'package:notodo/features/todos/presentation/cubit/todo_add_edit_cubit.dart';

class TodoAddEditScreen extends HookWidget {
  final TodoAddEditCubit cubit;
  final List<TextEditingController> textControllers;
  const TodoAddEditScreen(
      {required this.cubit, required this.textControllers, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = cubit.state;
    return ListView(
      primary: true,
      children: [
        Edit(
          controller: textControllers[0],
          caption: 'Задача',
        ),
        Edit(
          controller: textControllers[1],
          caption: 'Краткое описание',
        ),
        Edit(
          controller: textControllers[2],
          caption: 'Полное описание',
        ),
      ],
    );
  }
}
