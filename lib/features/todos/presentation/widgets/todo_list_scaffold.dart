import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:notodo/features/todos/presentation/cubit/todo_list_cubit.dart';

class TodoListScaffold extends HookWidget {
  final Widget body;
  final TodoListCubit cubit;
  const TodoListScaffold(
    this.cubit, {
    required this.body,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 52.0,
        title: Text(
          'Активные Задачи',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
        ),
        backgroundColor: theme.scaffoldBackgroundColor,
        actions: [
          IconButton(
              onPressed: cubit.loadAll,
              icon: LineIcon.circleAlt(
                color: theme.colorScheme.onBackground,
              ),
              splashRadius: 8.0),
        ],
      ),
      body: SafeArea(child: body),
      // floatingActionButton: FloatingActionButton(
      //     backgroundColor: theme.colorScheme.primary,
      //     mini: true,
      //     child: LineIcon.plus(
      //       color: theme.colorScheme.onSurface,
      //     ),
      //     onPressed: () {}),
    );
  }
}
