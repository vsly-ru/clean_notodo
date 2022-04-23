import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:notodo/core/enums.dart';
import 'package:notodo/features/todos/domain/entities/todo.dart';
import 'package:notodo/features/todos/presentation/cubit/todo_list_cubit.dart';

const _sectionRadius = 8.0;

class TodoSectionWidget extends HookWidget {
  final TodoListCubit cubit;
  final double outerHeight;
  final String title;
  final List<ToDo> list;

  const TodoSectionWidget(this.cubit,
      {required this.title,
      required this.list,
      required this.outerHeight,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: outerHeight,
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
      child: Container(
        decoration: BoxDecoration(
            // border: Border.all(width: 0.75, color: Colors.grey.withOpacity(0.5)),
            // borderRadius: BorderRadius.circular(_sectionRadius),
            // color: theme.cardColor,
            ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 28.0,
              // color: theme.primaryColor,
              padding: EdgeInsets.symmetric(vertical: 3.5, horizontal: 8.0),
              child: Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
