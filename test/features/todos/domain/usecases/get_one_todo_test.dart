import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:notodo/core/util/platform_info.dart';
import 'package:notodo/features/todos/domain/entities/todo.dart';
import 'package:notodo/features/todos/domain/repositories/todo_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:notodo/features/todos/domain/usecases/get_one_todo.dart';

import 'get_one_todo_test.mocks.dart';

@GenerateMocks([ITodoRepository])
void main() {
  print('running on ${PlatformInfo.name}');
  const tid = '123';
  const tTodo = ToDo(
      title: 'title',
      description: 'description',
      fullDescription: 'fullDescription',
      isComplited: false,
      isInWork: true);

  test(
    'should get a predefined task from the mocked repository',
    () async {
      final mockTodoRepository = MockITodoRepository();
      // arrange
      when(mockTodoRepository.getOne(any))
          .thenAnswer((_) async => const Right(tTodo));
      final usecase = GetOneTodo(mockTodoRepository);
      // act
      final result = await usecase.execute(id: tid);
      // assert
      expect(result, const Right(tTodo));
      verify(mockTodoRepository.getOne(tid));
      verifyNoMoreInteractions(mockTodoRepository);
    },
  );
}
