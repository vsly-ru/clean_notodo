// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'todo_add_edit_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TodoAddEditStateTearOff {
  const _$TodoAddEditStateTearOff();

  _TodoAddEditState call(
      {bool isLoading = false,
      bool isEditing = false,
      ToDo? todo = null,
      String? errMessage = null}) {
    return _TodoAddEditState(
      isLoading: isLoading,
      isEditing: isEditing,
      todo: todo,
      errMessage: errMessage,
    );
  }
}

/// @nodoc
const $TodoAddEditState = _$TodoAddEditStateTearOff();

/// @nodoc
mixin _$TodoAddEditState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isEditing => throw _privateConstructorUsedError;
  ToDo? get todo => throw _privateConstructorUsedError;
  String? get errMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TodoAddEditStateCopyWith<TodoAddEditState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoAddEditStateCopyWith<$Res> {
  factory $TodoAddEditStateCopyWith(
          TodoAddEditState value, $Res Function(TodoAddEditState) then) =
      _$TodoAddEditStateCopyWithImpl<$Res>;
  $Res call({bool isLoading, bool isEditing, ToDo? todo, String? errMessage});

  $ToDoCopyWith<$Res>? get todo;
}

/// @nodoc
class _$TodoAddEditStateCopyWithImpl<$Res>
    implements $TodoAddEditStateCopyWith<$Res> {
  _$TodoAddEditStateCopyWithImpl(this._value, this._then);

  final TodoAddEditState _value;
  // ignore: unused_field
  final $Res Function(TodoAddEditState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isEditing = freezed,
    Object? todo = freezed,
    Object? errMessage = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isEditing: isEditing == freezed
          ? _value.isEditing
          : isEditing // ignore: cast_nullable_to_non_nullable
              as bool,
      todo: todo == freezed
          ? _value.todo
          : todo // ignore: cast_nullable_to_non_nullable
              as ToDo?,
      errMessage: errMessage == freezed
          ? _value.errMessage
          : errMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $ToDoCopyWith<$Res>? get todo {
    if (_value.todo == null) {
      return null;
    }

    return $ToDoCopyWith<$Res>(_value.todo!, (value) {
      return _then(_value.copyWith(todo: value));
    });
  }
}

/// @nodoc
abstract class _$TodoAddEditStateCopyWith<$Res>
    implements $TodoAddEditStateCopyWith<$Res> {
  factory _$TodoAddEditStateCopyWith(
          _TodoAddEditState value, $Res Function(_TodoAddEditState) then) =
      __$TodoAddEditStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isLoading, bool isEditing, ToDo? todo, String? errMessage});

  @override
  $ToDoCopyWith<$Res>? get todo;
}

/// @nodoc
class __$TodoAddEditStateCopyWithImpl<$Res>
    extends _$TodoAddEditStateCopyWithImpl<$Res>
    implements _$TodoAddEditStateCopyWith<$Res> {
  __$TodoAddEditStateCopyWithImpl(
      _TodoAddEditState _value, $Res Function(_TodoAddEditState) _then)
      : super(_value, (v) => _then(v as _TodoAddEditState));

  @override
  _TodoAddEditState get _value => super._value as _TodoAddEditState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isEditing = freezed,
    Object? todo = freezed,
    Object? errMessage = freezed,
  }) {
    return _then(_TodoAddEditState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isEditing: isEditing == freezed
          ? _value.isEditing
          : isEditing // ignore: cast_nullable_to_non_nullable
              as bool,
      todo: todo == freezed
          ? _value.todo
          : todo // ignore: cast_nullable_to_non_nullable
              as ToDo?,
      errMessage: errMessage == freezed
          ? _value.errMessage
          : errMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_TodoAddEditState
    with DiagnosticableTreeMixin
    implements _TodoAddEditState {
  const _$_TodoAddEditState(
      {this.isLoading = false,
      this.isEditing = false,
      this.todo = null,
      this.errMessage = null});

  @JsonKey()
  @override
  final bool isLoading;
  @JsonKey()
  @override
  final bool isEditing;
  @JsonKey()
  @override
  final ToDo? todo;
  @JsonKey()
  @override
  final String? errMessage;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TodoAddEditState(isLoading: $isLoading, isEditing: $isEditing, todo: $todo, errMessage: $errMessage)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TodoAddEditState'))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty('isEditing', isEditing))
      ..add(DiagnosticsProperty('todo', todo))
      ..add(DiagnosticsProperty('errMessage', errMessage));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TodoAddEditState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.isEditing, isEditing) &&
            const DeepCollectionEquality().equals(other.todo, todo) &&
            const DeepCollectionEquality()
                .equals(other.errMessage, errMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(isEditing),
      const DeepCollectionEquality().hash(todo),
      const DeepCollectionEquality().hash(errMessage));

  @JsonKey(ignore: true)
  @override
  _$TodoAddEditStateCopyWith<_TodoAddEditState> get copyWith =>
      __$TodoAddEditStateCopyWithImpl<_TodoAddEditState>(this, _$identity);
}

abstract class _TodoAddEditState implements TodoAddEditState {
  const factory _TodoAddEditState(
      {bool isLoading,
      bool isEditing,
      ToDo? todo,
      String? errMessage}) = _$_TodoAddEditState;

  @override
  bool get isLoading;
  @override
  bool get isEditing;
  @override
  ToDo? get todo;
  @override
  String? get errMessage;
  @override
  @JsonKey(ignore: true)
  _$TodoAddEditStateCopyWith<_TodoAddEditState> get copyWith =>
      throw _privateConstructorUsedError;
}
