import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:line_icons/line_icon.dart';
import 'package:notodo/core/widgets/tap_container.dart';
import 'package:notodo/features/todos/domain/entities/todo.dart';
import 'package:notodo/features/todos/presentation/cubit/todo_list_cubit.dart';
import 'package:notodo/features/todos/presentation/widgets/todo_widget.dart';

const _titleTextStatus = TextStyle(fontSize: 16.0, fontWeight: FontWeight.w300);

class TodoSectionWidget extends HookWidget {
  final TodoListCubit cubit;
  final String title;
  final bool showAddButton;
  final List<ToDo> list;

  const TodoSectionWidget(this.cubit,
      {required this.title,
      required this.list,
      this.showAddButton = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        if (title.isNotEmpty || showAddButton)
          Container(
            height: 35,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (title.isNotEmpty)
                  Container(
                    width: 160,
                    height: 28.0,
                    // color: theme.primaryColor,
                    padding: const EdgeInsets.symmetric(
                        vertical: 3.5, horizontal: 8.0),
                    child: Text(
                      title,
                      style: _titleTextStatus,
                    ),
                  ),
                if (showAddButton)
                  TextButton.icon(
                      onPressed: () {},
                      icon: LineIcon.plus(),
                      label: Text('Добавить'))
              ],
            ),
          ),
        for (var index = 0; index < list.length; index++)
          TodoWidget(
            list[index],
            index: index,
            length: list.length,
          )
      ],
    );
  }
}
