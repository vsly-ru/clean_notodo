import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:notodo/core/util/platform_info.dart';
import 'package:notodo/features/todos/data/models/todo_model.dart';
import 'package:notodo/features/todos/domain/entities/todo.dart';
import 'package:notodo/features/todos/domain/repositories/todo_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:notodo/features/todos/domain/usecases/get_one_todo.dart';
import 'package:notodo/features/todos/domain/usecases/get_todo_list.dart';

import '../setup.dart';
import 'get_one_todo_test.mocks.dart';

void main() {
  testSetUp();
  const tTodo = ToDo(
      id: '123',
      title: 'title',
      description: 'description',
      fullDescription: 'fullDescription',
      owner: '111',
      actor: '111',
      isComplited: false,
      isInWork: true);
  group('todos', () {
    test(
      '[TodoDataModel] Convert to map == and back',
      () async {
        // arrange
        final convert = TodoDataModel();
        // act
        final mapped = convert.toMap(tTodo);
        final converted = convert.fromMap(mapped);
        // assert
        expect(converted, tTodo);
      },
    );
  });
}
