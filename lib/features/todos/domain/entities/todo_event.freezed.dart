// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'todo_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TodoEventTearOff {
  const _$TodoEventTearOff();

  _TodoEvent call(
      {required int timestamp, required String type, String actor = ''}) {
    return _TodoEvent(
      timestamp: timestamp,
      type: type,
      actor: actor,
    );
  }
}

/// @nodoc
const $TodoEvent = _$TodoEventTearOff();

/// @nodoc
mixin _$TodoEvent {
  int get timestamp => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get actor => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TodoEventCopyWith<TodoEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoEventCopyWith<$Res> {
  factory $TodoEventCopyWith(TodoEvent value, $Res Function(TodoEvent) then) =
      _$TodoEventCopyWithImpl<$Res>;
  $Res call({int timestamp, String type, String actor});
}

/// @nodoc
class _$TodoEventCopyWithImpl<$Res> implements $TodoEventCopyWith<$Res> {
  _$TodoEventCopyWithImpl(this._value, this._then);

  final TodoEvent _value;
  // ignore: unused_field
  final $Res Function(TodoEvent) _then;

  @override
  $Res call({
    Object? timestamp = freezed,
    Object? type = freezed,
    Object? actor = freezed,
  }) {
    return _then(_value.copyWith(
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      actor: actor == freezed
          ? _value.actor
          : actor // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$TodoEventCopyWith<$Res> implements $TodoEventCopyWith<$Res> {
  factory _$TodoEventCopyWith(
          _TodoEvent value, $Res Function(_TodoEvent) then) =
      __$TodoEventCopyWithImpl<$Res>;
  @override
  $Res call({int timestamp, String type, String actor});
}

/// @nodoc
class __$TodoEventCopyWithImpl<$Res> extends _$TodoEventCopyWithImpl<$Res>
    implements _$TodoEventCopyWith<$Res> {
  __$TodoEventCopyWithImpl(_TodoEvent _value, $Res Function(_TodoEvent) _then)
      : super(_value, (v) => _then(v as _TodoEvent));

  @override
  _TodoEvent get _value => super._value as _TodoEvent;

  @override
  $Res call({
    Object? timestamp = freezed,
    Object? type = freezed,
    Object? actor = freezed,
  }) {
    return _then(_TodoEvent(
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      actor: actor == freezed
          ? _value.actor
          : actor // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_TodoEvent implements _TodoEvent {
  const _$_TodoEvent(
      {required this.timestamp, required this.type, this.actor = ''});

  @override
  final int timestamp;
  @override
  final String type;
  @JsonKey()
  @override
  final String actor;

  @override
  String toString() {
    return 'TodoEvent(timestamp: $timestamp, type: $type, actor: $actor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TodoEvent &&
            const DeepCollectionEquality().equals(other.timestamp, timestamp) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.actor, actor));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(timestamp),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(actor));

  @JsonKey(ignore: true)
  @override
  _$TodoEventCopyWith<_TodoEvent> get copyWith =>
      __$TodoEventCopyWithImpl<_TodoEvent>(this, _$identity);
}

abstract class _TodoEvent implements TodoEvent {
  const factory _TodoEvent(
      {required int timestamp,
      required String type,
      String actor}) = _$_TodoEvent;

  @override
  int get timestamp;
  @override
  String get type;
  @override
  String get actor;
  @override
  @JsonKey(ignore: true)
  _$TodoEventCopyWith<_TodoEvent> get copyWith =>
      throw _privateConstructorUsedError;
}
