import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:notodo/core/constants.dart';
import 'package:notodo/core/errors/failure.dart';
import 'package:notodo/core/platform_channel.dart';
import 'package:notodo/features/todos/domain/entities/todo.dart';
import 'package:notodo/features/todos/domain/repositories/todo_repository.dart';

import 'package:notodo/core/extensions/firebase_fix.dart';
import 'package:uuid/uuid.dart';

@Injectable(as: ITodoRepository, env: [Env.prod])
class TodoRepository implements ITodoRepository {
  // TODO: inject this channel to be able to test this rep with a mocked method channel
  final _platformChannel = PlatformChannel.channel;

  @override
  Future<Either<Failure, ToDo>> getOne(String id) async {
    /// currently app using getList instead of getOne and just passes one elemnt to a page as an argument instead of using getOne
    return const Left(
        Failure(message: 'Method not implemented.', code: 'getOne'));
  }

  @override
  Future<Either<Failure, List<ToDo>>> getList(bool onlyMine) async {
    Map<Object?, Object?>? result = await _platformChannel
        .invokeMapMethod<Object?, Object?>('get_docs', <String, String>{
      "collection": "todos",
      "field": onlyMine ? "owner" : "actor"
    });
    if (kDebugMode) print(result);
    final data = result?.fix["data"];
    if (data != null && data is List) {
      print(data);
      return Right([]);
    }
    return const Left(
        Failure(message: 'Query failed.', code: 'getList_fallback'));
  }

  @override
  Future<Either<Failure, ToDo>> addUpdateOne(ToDo todo) async {
    if (todo.id.isEmpty) todo = todo.copyWith(id: const Uuid().v4());
    Map<Object?, Object?>? result = await _platformChannel
        .invokeMapMethod<Object?, Object?>('get_docs', <String, String>{
      "collection": "todos",
      "id": todo.id,
    });
    if (kDebugMode) print(result);
    final fixedData = result!.fix;
    final isSuccess =
        fixedData["message"] == "success" && fixedData["data"] != null;
    if (isSuccess) return Right(todo); // TODO: build todo from map
    return const Left(
        Failure(message: 'Query failed.', code: 'getList_fallback'));
  }
}
