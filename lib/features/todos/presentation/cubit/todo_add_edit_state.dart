part of 'todo_add_edit_cubit.dart';

@freezed
class TodoAddEditState with _$TodoAddEditState {
  const factory TodoAddEditState({
    @Default(false) bool isLoading,
    @Default(null) ToDo? editing,
    @Default(null) String? errMessage,
  }) = _TodoAddEditState;

  factory TodoAddEditState.initial() => const TodoAddEditState();
}