import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'todo.freezed.dart';

@freezed
class ToDo with _$ToDo {
  const factory ToDo(
      {required String id,
      required String title,
      required String description,
      required String owner, // task owner (creator)
      required String actor, // one who must complite the task
      required String fullDescription,
      required bool isComplited,
      required bool isInWork}) = _ToDo;
}
