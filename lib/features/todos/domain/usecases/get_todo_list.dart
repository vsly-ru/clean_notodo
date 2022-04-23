import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:notodo/core/enums.dart';
import 'package:notodo/core/errors/failure.dart';
import 'package:notodo/core/interfaces/usecase.dart';
import 'package:notodo/features/todos/domain/entities/todo.dart';
import 'package:notodo/features/todos/domain/repositories/todo_repository.dart';

@injectable
class GetTodoListUC
    implements IUsecase<TodoStatus?, Future<Either<Failure, List<ToDo>>>> {
  final ITodoRepository _repository;

  GetTodoListUC(this._repository);

  @override
  Future<Either<Failure, List<ToDo>>> execute(TodoStatus? filter) async {
    return await _repository.getList(filter);
  }
}
