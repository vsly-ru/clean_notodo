import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:notodo/core/constants.dart';
import 'package:notodo/core/enums.dart';
import 'package:notodo/core/errors/failure.dart';
import 'package:notodo/features/todos/domain/entities/todo.dart';
import 'package:notodo/features/todos/domain/repositories/todo_repository.dart';

@Injectable(as: ITodoRepository, env: [Env.dev])
class DevTodoRepository implements ITodoRepository {
  @override
  Future<Either<Failure, ToDo>> getOne(String id) async {
    await Future.delayed(const Duration(milliseconds: 800));
    return Right(_getDummyTodo(int.tryParse(id) ?? 2));
  }

  @override
  Future<Either<Failure, List<ToDo>>> getList(TodoStatus? filter) async {
    final random = Random();
    await Future.delayed(
        Duration(milliseconds: (random.nextDouble() * 3000).ceil()));
    if (random.nextDouble() > 0.88) {
      return const Left(Failure(
          message: 'Dev data failed to load. \nFor test reasons.',
          code: 'dev_fail'));
    }
    return Right([_getDummyTodo(1), _getDummyTodo(2), _getDummyTodo(3)]);
  }

  @override
  Future<Either<Failure, ToDo>> addUpdateOne(ToDo todo) async {
    await Future.delayed(const Duration(milliseconds: 800));
    return Right(todo);
  }
}

ToDo _getDummyTodo(int n) {
  return ToDo(
      id: '$n',
      title: 'Dev Task #$n',
      description: 'Get the #$n task done!',
      fullDescription: 'Get the $n task done before it\'s too late!',
      isComplited: false,
      isInWork: n.isEven);
}
