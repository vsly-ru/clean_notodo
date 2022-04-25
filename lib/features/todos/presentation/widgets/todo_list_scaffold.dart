import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:notodo/core/widgets/progress_widget.dart';
import 'package:notodo/core/widgets/widget_fadein.dart';
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
    final mq = MediaQuery.of(context);
    final theme = Theme.of(context);
    final _textEditController = useTextEditingController();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 52.0,
        title: Text(
          'Активные Задачи',
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w300,
              color: theme.colorScheme.onBackground),
        ),
        backgroundColor: theme.scaffoldBackgroundColor,
        actions: [
          if (cubit.state.isLoading == false)
            IconButton(
                onPressed: cubit.loadAll,
                icon: LineIcon.circleAlt(
                  color: theme.colorScheme.onBackground,
                ),
                splashRadius: 8.0),
          if (cubit.state.isLoading)
            Container(
                padding: EdgeInsets.only(right: 14),
                child: const CircularProgressIndicator.adaptive())
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
      // bottomSheet: cubit.state.addingMode == false
      //     ? null
      //     : FadeIn(
      //         child: Container(
      //           width: double.infinity,
      //           height: 65.0,
      //           color: theme.cardColor,
      //           margin: EdgeInsets.only(
      //               bottom: mq.padding.bottom,
      //               left: mq.padding.left,
      //               right: mq.padding.right),
      //           child: TextField(
      //             controller: _textEditController,
      //           ),
      //         ),
      //       ),
    );
  }
}
