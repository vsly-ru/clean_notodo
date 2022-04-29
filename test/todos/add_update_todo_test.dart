import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:notodo/features/todos/domain/entities/todo.dart';
import 'package:notodo/features/todos/domain/repositories/todo_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:notodo/features/todos/domain/usecases/save_todo.dart';
import 'package:notodo/features/todos/domain/usecases/get_one_todo.dart';

import '../setup.dart';
import 'get_one_todo_test.mocks.dart';

@GenerateMocks([ITodoRepository])
void main() {
  testSetUp();

  const tid = '123';
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
      '[addUpdateOne] Add task to repository',
      () async {
        // arrange
        final mockRepository = MockITodoRepository();
        when(mockRepository.saveOne(any))
            .thenAnswer((_) async => const Right(tTodo));
        final usecase = SaveTodoUC(mockRepository);
        // act
        final result =
            await usecase.execute(const AddUpdateTodoUCArgs(todo: tTodo));
        // assert
        expect(result, const Right(tTodo));
        verify(mockRepository.saveOne(tTodo));
        verifyNoMoreInteractions(mockRepository);
      },
    );
  });
}
