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

const _complitedHeight = 58.0;
const _animationDuration = 250;

class TodoListScreen extends HookWidget {
  final TodoListCubit cubit;
  final Map<TodoStatus, List<ToDo>> items;
  const TodoListScreen(this.cubit, {required this.items, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final complited = items[TodoStatus.statusComplited]!;
    return LayoutBuilder(builder: (context, constraints) {
      final maxHeight = constraints.maxHeight;
      return Column(
        children: [
          Container(
            height: maxHeight - _complitedHeight,
            child: ListView(
              children: [
                FadeIn(
                  offset: Offset(0, 0),
                  duration: _animationDuration,
                  opacity: 0.5,
                  child: TodoSectionWidget(
                    cubit,
                    title: '',
                    list: items[TodoStatus.statusInWork]!,
                  ),
                ),
                FadeIn(
                  delay: _animationDuration ~/ 2,
                  duration: _animationDuration,
                  offset: Offset(0, 0),
                  opacity: 0.5,
                  child: TodoSectionWidget(
                    cubit,
                    title: 'Новые задачи',
                    showAddButton: true,
                    list: items[TodoStatus.statusNew]!,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: _complitedHeight,
            // color: Colors.teal,
            padding: const EdgeInsets.only(top: 2.0, bottom: 8.0),
            child: FadeIn(
              delay: _animationDuration,
              duration: _animationDuration,
              offset: Offset(0, 0),
              opacity: 0.5,
              child: OptionRow(
                'Выполненные задачи',
                value: complited.length.toString(),
                icon: LineIcons.checkCircle,
                onTap: complited.length > 0
                    ? () {
                        // open complited task list
                      }
                    : null,
              ),
            ),
          )
        ],
      );
    });
  }
}
