import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:notodo/core/constants.dart';
import 'package:notodo/core/errors/failure.dart';
import 'package:notodo/core/platform_channel.dart';
import 'package:notodo/features/todos/data/models/todo_model.dart';
import 'package:notodo/features/todos/domain/entities/todo.dart';
import 'package:notodo/features/todos/domain/repositories/todo_repository.dart';

import 'package:notodo/core/extensions/firebase_fix.dart';
import 'package:uuid/uuid.dart';

@Injectable(as: ITodoRepository, env: [Env.prod])
class TodoRepository implements ITodoRepository {
  // TODO: inject this channel to be able to test this rep with a mocked method channel
  final _platformChannel = PlatformChannel.channel;

  /// default data model implementation
  final TodoDataModel _model = TodoDataModel();

  @override
  Future<Either<Failure, ToDo>> getOne(String id) async {
    /// currently the app is using getList instead of getOne and just passes one elemnt to a page as an argument instead of using getOne
    return const Left(
        Failure(message: 'Method not implemented.', code: 'getOne'));
  }

  @override
  Future<Either<Failure, List<ToDo>>> getList(bool onlyMine) async {
    try {
      Map<Object?, Object?>? result = await _platformChannel
          .invokeMapMethod<Object?, Object?>('get_docs', <String, String>{
        "collection": "todos",
        "field": onlyMine ? "owner" : "actor"
      });
      if (kDebugMode) print(result);
      final data = result?.fix["data"];
      if (data != null && data is List) {
        print(data);
        List<ToDo> re = [];
        for (var todo in data) {
          re.add(_model.fromMap(todo, nullInsteadOfThrowing: false)!);
        }
        return Right(re);
      }
      // fallback
      return const Left(
          Failure(message: 'Query failed.', code: 'getList_fallback'));
    } catch (err) {
      return Left(Failure(message: err.toString(), code: 'getList_catch'));
    }
  }

  @override
  Future<Either<Failure, ToDo>> saveOne(ToDo todo) async {
    try {
      if (todo.id.isEmpty) {
        // generating random uuid if id is empty
        todo = todo.copyWith(id: const Uuid().v4());
      }
      Map<Object?, Object?>? result = await _platformChannel
          .invokeMapMethod<Object?, Object?>('set_doc', <String, dynamic>{
        "collection": "todos",
        "id": todo.id,
        "doc": _model.toMap(todo)
      });
      if (kDebugMode) print(result);
      final fixedData = result!.fix;
      final isSuccess = fixedData["data"] != null;
      if (isSuccess) return Right(todo);
      // fallback
      return const Left(
          Failure(message: 'Query failed.', code: 'addUpdateOne_fallback'));
    } catch (err) {
      return Left(Failure(message: err.toString(), code: 'addUpdateOne_catch'));
    }
  }
}
