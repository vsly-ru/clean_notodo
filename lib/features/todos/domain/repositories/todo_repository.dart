import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failure.dart';
import '../entities/todo.dart';

enum TodoListFilter {
  all,
  inWorkOnly,
  notInWorkOnly,
  complitedOnly,
  notComplitedOnly
}

abstract class ITodoRepository {
  Future<Either<Failure, ToDo>> getOne(String id);
  Future<Either<Failure, List<ToDo>>> getList(TodoListFilter filters);
}
