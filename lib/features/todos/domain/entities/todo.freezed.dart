// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'todo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ToDoTearOff {
  const _$ToDoTearOff();

  _ToDo call(
      {required String title,
      required String description,
      required String fullDescription,
      required bool isComplited,
      required bool isInWork}) {
    return _ToDo(
      title: title,
      description: description,
      fullDescription: fullDescription,
      isComplited: isComplited,
      isInWork: isInWork,
    );
  }
}

/// @nodoc
const $ToDo = _$ToDoTearOff();

/// @nodoc
mixin _$ToDo {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get fullDescription => throw _privateConstructorUsedError;
  bool get isComplited => throw _privateConstructorUsedError;
  bool get isInWork => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ToDoCopyWith<ToDo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ToDoCopyWith<$Res> {
  factory $ToDoCopyWith(ToDo value, $Res Function(ToDo) then) =
      _$ToDoCopyWithImpl<$Res>;
  $Res call(
      {String title,
      String description,
      String fullDescription,
      bool isComplited,
      bool isInWork});
}

/// @nodoc
class _$ToDoCopyWithImpl<$Res> implements $ToDoCopyWith<$Res> {
  _$ToDoCopyWithImpl(this._value, this._then);

  final ToDo _value;
  // ignore: unused_field
  final $Res Function(ToDo) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? fullDescription = freezed,
    Object? isComplited = freezed,
    Object? isInWork = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      fullDescription: fullDescription == freezed
          ? _value.fullDescription
          : fullDescription // ignore: cast_nullable_to_non_nullable
              as String,
      isComplited: isComplited == freezed
          ? _value.isComplited
          : isComplited // ignore: cast_nullable_to_non_nullable
              as bool,
      isInWork: isInWork == freezed
          ? _value.isInWork
          : isInWork // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$ToDoCopyWith<$Res> implements $ToDoCopyWith<$Res> {
  factory _$ToDoCopyWith(_ToDo value, $Res Function(_ToDo) then) =
      __$ToDoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String title,
      String description,
      String fullDescription,
      bool isComplited,
      bool isInWork});
}

/// @nodoc
class __$ToDoCopyWithImpl<$Res> extends _$ToDoCopyWithImpl<$Res>
    implements _$ToDoCopyWith<$Res> {
  __$ToDoCopyWithImpl(_ToDo _value, $Res Function(_ToDo) _then)
      : super(_value, (v) => _then(v as _ToDo));

  @override
  _ToDo get _value => super._value as _ToDo;

  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? fullDescription = freezed,
    Object? isComplited = freezed,
    Object? isInWork = freezed,
  }) {
    return _then(_ToDo(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      fullDescription: fullDescription == freezed
          ? _value.fullDescription
          : fullDescription // ignore: cast_nullable_to_non_nullable
              as String,
      isComplited: isComplited == freezed
          ? _value.isComplited
          : isComplited // ignore: cast_nullable_to_non_nullable
              as bool,
      isInWork: isInWork == freezed
          ? _value.isInWork
          : isInWork // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ToDo with DiagnosticableTreeMixin implements _ToDo {
  const _$_ToDo(
      {required this.title,
      required this.description,
      required this.fullDescription,
      required this.isComplited,
      required this.isInWork});

  @override
  final String title;
  @override
  final String description;
  @override
  final String fullDescription;
  @override
  final bool isComplited;
  @override
  final bool isInWork;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ToDo(title: $title, description: $description, fullDescription: $fullDescription, isComplited: $isComplited, isInWork: $isInWork)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ToDo'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('fullDescription', fullDescription))
      ..add(DiagnosticsProperty('isComplited', isComplited))
      ..add(DiagnosticsProperty('isInWork', isInWork));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ToDo &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality()
                .equals(other.fullDescription, fullDescription) &&
            const DeepCollectionEquality()
                .equals(other.isComplited, isComplited) &&
            const DeepCollectionEquality().equals(other.isInWork, isInWork));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(fullDescription),
      const DeepCollectionEquality().hash(isComplited),
      const DeepCollectionEquality().hash(isInWork));

  @JsonKey(ignore: true)
  @override
  _$ToDoCopyWith<_ToDo> get copyWith =>
      __$ToDoCopyWithImpl<_ToDo>(this, _$identity);
}

abstract class _ToDo implements ToDo {
  const factory _ToDo(
      {required String title,
      required String description,
      required String fullDescription,
      required bool isComplited,
      required bool isInWork}) = _$_ToDo;

  @override
  String get title;
  @override
  String get description;
  @override
  String get fullDescription;
  @override
  bool get isComplited;
  @override
  bool get isInWork;
  @override
  @JsonKey(ignore: true)
  _$ToDoCopyWith<_ToDo> get copyWith => throw _privateConstructorUsedError;
}
