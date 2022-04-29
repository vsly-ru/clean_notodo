// Mocks generated by Mockito 5.1.0 from annotations
// in notodo/test/todos/add_update_todo_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:notodo/core/errors/failure.dart' as _i5;
import 'package:notodo/features/todos/domain/entities/todo.dart' as _i6;
import 'package:notodo/features/todos/domain/repositories/todo_repository.dart'
    as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeEither_0<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

/// A class which mocks [ITodoRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockITodoRepository extends _i1.Mock implements _i3.ITodoRepository {
  MockITodoRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.ToDo>> getOne(String? id) =>
      (super.noSuchMethod(Invocation.method(#getOne, [id]),
              returnValue: Future<_i2.Either<_i5.Failure, _i6.ToDo>>.value(
                  _FakeEither_0<_i5.Failure, _i6.ToDo>()))
          as _i4.Future<_i2.Either<_i5.Failure, _i6.ToDo>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.ToDo>>> getList(bool? onlyMine) =>
      (super.noSuchMethod(Invocation.method(#getList, [onlyMine]),
          returnValue: Future<_i2.Either<_i5.Failure, List<_i6.ToDo>>>.value(
              _FakeEither_0<_i5.Failure, List<_i6.ToDo>>())) as _i4
          .Future<_i2.Either<_i5.Failure, List<_i6.ToDo>>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.ToDo>> saveOne(_i6.ToDo? todo) =>
      (super.noSuchMethod(Invocation.method(#saveOne, [todo]),
              returnValue: Future<_i2.Either<_i5.Failure, _i6.ToDo>>.value(
                  _FakeEither_0<_i5.Failure, _i6.ToDo>()))
          as _i4.Future<_i2.Either<_i5.Failure, _i6.ToDo>>);
}
