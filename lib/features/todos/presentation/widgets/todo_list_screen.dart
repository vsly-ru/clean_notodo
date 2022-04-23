import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:notodo/core/enums.dart';
import 'package:notodo/core/widgets/option_row.dart';
import 'package:notodo/core/widgets/widget_fadein.dart';
import 'package:notodo/features/todos/domain/entities/todo.dart';
import 'package:notodo/features/todos/presentation/cubit/todo_list_cubit.dart';
import 'package:notodo/features/todos/presentation/widgets/todo_section.dart';

class TodoListScreen extends HookWidget {
  final TodoListCubit cubit;
  final Map<TodoStatus, List<ToDo>> items;
  const TodoListScreen(this.cubit, {required this.items, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final complited = items[TodoStatus.statusComplited]!;
    return ListView(
      children: [
        FadeIn(
          offset: Offset(0, 0),
          child: TodoSectionWidget(cubit,
              title: '',
              list: items[TodoStatus.statusInWork]!,
              outerHeight: 250.0),
        ),
        FadeIn(
          delay: 200,
          offset: Offset(0, 0),
          child: TodoSectionWidget(cubit,
              title: 'Неактивные задачи',
              list: items[TodoStatus.statusNew]!,
              outerHeight: 250.0),
        ),
        FadeIn(
            delay: 300,
            offset: Offset(0, 0),
            child: OptionRow(
              'Выполненные задачи',
              value: complited.length.toString(),
              icon: complited.length > 1
                  ? LineIcons.doubleCheck
                  : LineIcons.checkCircle,
              onTap: complited.length > 0
                  ? () {
                      // open complited task list
                    }
                  : null,
            )),
      ],
    );
  }
}
