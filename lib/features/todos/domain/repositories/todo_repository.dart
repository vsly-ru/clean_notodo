import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/todo.dart';

abstract class ITodoRepository {
  Future<Either<Failure, ToDo>> getOne(String id);
  Future<Either<Failure, List<ToDo>>> getList(bool onlyMine);
  Future<Either<Failure, ToDo>> addUpdateOne(ToDo todo);
}
