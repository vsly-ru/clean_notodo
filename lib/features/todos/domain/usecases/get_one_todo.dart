import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:notodo/core/errors/failure.dart';
import 'package:notodo/core/interfaces/usecase.dart';
import 'package:notodo/features/todos/domain/entities/todo.dart';
import 'package:notodo/features/todos/domain/repositories/todo_repository.dart';

class GetOneTodoArgs {
  final String id;
  const GetOneTodoArgs({required this.id});
}

@injectable
class GetOneTodoUC
    implements IUsecase<GetOneTodoArgs, Future<Either<Failure, ToDo>>> {
  final ITodoRepository _repository;

  GetOneTodoUC(this._repository);

  @override
  Future<Either<Failure, ToDo>> execute(GetOneTodoArgs args) async {
    return await _repository.getOne(args.id);
  }
}
