import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:notodo/core/errors/failure.dart';
import 'package:notodo/core/interfaces/usecase.dart';
import 'package:notodo/features/todos/domain/entities/todo.dart';
import 'package:notodo/features/todos/domain/repositories/todo_repository.dart';

class AddUpdateTodoUCArgs {
  final ToDo todo;
  const AddUpdateTodoUCArgs({required this.todo});
}

@injectable
class AddUpdateTodoUC
    implements IUsecase<AddUpdateTodoUCArgs, Future<Either<Failure, ToDo>>> {
  final ITodoRepository _repository;

  AddUpdateTodoUC(this._repository);

  @override
  Future<Either<Failure, ToDo>> execute(AddUpdateTodoUCArgs args) async {
    return await _repository.addUpdateOne(args.todo);
  }
}
