import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:notodo/core/util/platform_info.dart';
import 'package:notodo/features/todos/domain/entities/todo.dart';
import 'package:notodo/features/todos/domain/repositories/todo_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:notodo/features/todos/domain/usecases/get_one_todo.dart';
import 'package:notodo/features/todos/domain/usecases/get_todo_list.dart';

import '../setup.dart';
import 'get_one_todo_test.mocks.dart';

@GenerateMocks([ITodoRepository])
void main() {
  testSetUp();
  const tFilter = TodoListFilter.all;
  const tTodos = [
    ToDo(
        title: 'title',
        description: 'description',
        fullDescription: 'fullDescription',
        isComplited: false,
        isInWork: true)
  ];
  group('todos', () {
    test(
      '[GetTodoList] Get task from repository',
      () async {
        // arrange
        final mockRepository = MockITodoRepository();
        when(mockRepository.getList(any))
            .thenAnswer((_) async => const Right(tTodos));
        final usecase = GetTodoListUC(mockRepository);
        // act
        final result = await usecase.execute(tFilter);
        // assert
        expect(result, const Right(tTodos));
        verify(mockRepository.getList(tFilter));
        verifyNoMoreInteractions(mockRepository);
      },
    );
  });
}
