import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_event.freezed.dart';

abstract class TodoEventType {
  static const created = "created";
  static const taken = "taken"; // taken to work
  static const canceled = "canceled"; // returned from work
  static const complited = "complited";
  // future
  static const delegated = "delegated"; // delegated to another user
  static const deleted = "deleted";
  static const restored = "restored";
}

@freezed
class TodoEvent with _$TodoEvent {
  const factory TodoEvent({
    required int timestamp,
    required String type,
    @Default('') String actor,
  }) = _TodoEvent;
}
