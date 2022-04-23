import 'package:dartz/dartz.dart';
import 'package:notodo/core/enums.dart';

import '../../../../core/errors/failure.dart';
import '../entities/todo.dart';

abstract class ITodoRepository {
  Future<Either<Failure, ToDo>> getOne(String id);
  Future<Either<Failure, List<ToDo>>> getList(TodoStatus? filter);
}
