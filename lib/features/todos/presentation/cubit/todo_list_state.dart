part of 'todo_list_cubit.dart';

@freezed
class TodoListState with _$TodoListState {
  const factory TodoListState(
      {@Default(false) bool isLoading,
      @Default(null) String? errMessage,
      @Default(null) Map<TodoStatus, List<ToDo>>? items}) = _TodoListState;

  factory TodoListState.initial() => const TodoListState();
}
