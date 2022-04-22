import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:notodo/features/todos/domain/entities/todo.dart';
import 'package:notodo/features/todos/domain/repositories/todo_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:notodo/features/todos/domain/usecases/get_one_todo.dart';

import '../setup.dart';
import 'get_one_todo_test.mocks.dart';

@GenerateMocks([ITodoRepository])
void main() {
  testSetUp();

  const tid = '123';
  const tTodo = ToDo(
      title: 'title',
      description: 'description',
      fullDescription: 'fullDescription',
      isComplited: false,
      isInWork: true);

  group('todos', () {
    test(
      '[GetOneTodo] Get task from repository',
      () async {
        // arrange
        final mockRepository = MockITodoRepository();
        when(mockRepository.getOne(any))
            .thenAnswer((_) async => const Right(tTodo));
        final usecase = GetOneTodoUC(mockRepository);
        // act
        final result = await usecase.execute(const GetOneTodoArgs(id: tid));
        // assert
        expect(result, const Right(tTodo));
        verify(mockRepository.getOne(tid));
        verifyNoMoreInteractions(mockRepository);
      },
    );
  });
}
