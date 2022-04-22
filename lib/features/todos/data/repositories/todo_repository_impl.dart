import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:notodo/core/constants.dart';
import 'package:notodo/core/errors/failure.dart';
import 'package:notodo/features/todos/domain/entities/todo.dart';
import 'package:notodo/features/todos/domain/repositories/todo_repository.dart';

@Injectable(as: ITodoRepository, env: [Env.prod])
class TodoRepository implements ITodoRepository {
  @override
  Future<Either<Failure, ToDo>> getOne(String id) {
    return Future.value(
        const Left(Failure('not_implemented', 'not_implemented')));
  }

  @override
  Future<Either<Failure, List<ToDo>>> getList(TodoListFilter filters) {
    return Future.value(
        const Left(Failure('not_implemented', 'not_implemented')));
  }
}