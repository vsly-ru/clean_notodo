import 'package:dartz/dartz.dart';
import 'package:notodo/core/errors/failure.dart';
import 'package:notodo/features/todos/domain/entities/todo.dart';
import 'package:notodo/features/todos/domain/repositories/todo_repository.dart';

class GetOneTodo {
  final ITodoRepository repository;

  GetOneTodo(this.repository);

  Future<Either<Failure, ToDo>> execute({required String id}) async {
    return await repository.getOne(id);
  }
}
