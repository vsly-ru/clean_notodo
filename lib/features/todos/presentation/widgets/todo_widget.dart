import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:notodo/core/enums.dart';
import 'package:notodo/core/widgets/tap_container.dart';
import 'package:notodo/features/todos/domain/entities/todo.dart';
import 'package:notodo/features/todos/presentation/cubit/todo_list_cubit.dart';

const _borderRadius = 6.0;
const _itemHeight = 48.0;

class TodoWidget extends HookWidget {
  // final TodoListCubit cubit;
  // final double outerHeight;
  final ToDo item;

  /// item index in a list
  final int index;

  /// parent list length
  final int length;

  const TodoWidget(this.item, {this.index = 0, this.length = 0, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TapContainer(
      height: _itemHeight,
      radius: _borderRadius,
      roundTop: index == 0,
      roundBottom: index == length - 1,
      duration: 400,
      horizontalMargin: 8.0,
      child: Row(
        children: [
          Checkbox(value: false, onChanged: null),
          Text('$index ${item.title}')
        ],
      ),
    );
  }
}
