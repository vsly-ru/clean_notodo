import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:notodo/core/state/app_state_manager.dart';
import 'package:notodo/features/todos/domain/entities/todo.dart';
import 'package:notodo/features/todos/domain/repositories/todo_repository.dart';
import 'package:notodo/features/todos/presentation/cubit/todo_add_edit_cubit.dart';
import 'package:notodo/features/todos/presentation/screens/add_edit_screen.dart';

class PageAddEditViewTodo extends HookWidget {
  final TodoAddEditCubit cubit;

  /// adding mode
  final bool adding;

  /// todo id
  final String? id;

  /// optional todo when opened via delegated action (TODO: otherwise will be loaded using id)
  final ToDo? extraTodo;

  const PageAddEditViewTodo(
      {required this.cubit,
      required this.adding,
      this.id,
      this.extraTodo,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final opening = extraTodo != null;
    useEffect(() {
      if (kDebugMode) print('-> PageAddEditViewTodo init');
      if (opening) {
        cubit.initViewing(extraTodo!);
      } else {
        cubit.initAdding();
      }
      return null;
    });
    final _titleCtrl =
        useTextEditingController(text: opening ? extraTodo!.title : null);
    final _descCtrl =
        useTextEditingController(text: opening ? extraTodo!.description : null);
    final _fullDescCtrl = useTextEditingController(
        text: opening ? extraTodo!.fullDescription : null);
    return BlocBuilder(
        bloc: cubit,
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
                child: TodoAddEditScreen(
              cubit: cubit,
              textControllers: [_titleCtrl, _descCtrl, _fullDescCtrl],
            )),
          );
        });
  }
}
