// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'app_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AppStateInfoTearOff {
  const _$AppStateInfoTearOff();

  _AppStateInfo call(
      {bool? authenticated, bool? offlineMode, User? user, String? todoId}) {
    return _AppStateInfo(
      authenticated: authenticated,
      offlineMode: offlineMode,
      user: user,
      todoId: todoId,
    );
  }
}

/// @nodoc
const $AppStateInfo = _$AppStateInfoTearOff();

/// @nodoc
mixin _$AppStateInfo {
  bool? get authenticated => throw _privateConstructorUsedError;
  bool? get offlineMode => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;
  String? get todoId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppStateInfoCopyWith<AppStateInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateInfoCopyWith<$Res> {
  factory $AppStateInfoCopyWith(
          AppStateInfo value, $Res Function(AppStateInfo) then) =
      _$AppStateInfoCopyWithImpl<$Res>;
  $Res call(
      {bool? authenticated, bool? offlineMode, User? user, String? todoId});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$AppStateInfoCopyWithImpl<$Res> implements $AppStateInfoCopyWith<$Res> {
  _$AppStateInfoCopyWithImpl(this._value, this._then);

  final AppStateInfo _value;
  // ignore: unused_field
  final $Res Function(AppStateInfo) _then;

  @override
  $Res call({
    Object? authenticated = freezed,
    Object? offlineMode = freezed,
    Object? user = freezed,
    Object? todoId = freezed,
  }) {
    return _then(_value.copyWith(
      authenticated: authenticated == freezed
          ? _value.authenticated
          : authenticated // ignore: cast_nullable_to_non_nullable
              as bool?,
      offlineMode: offlineMode == freezed
          ? _value.offlineMode
          : offlineMode // ignore: cast_nullable_to_non_nullable
              as bool?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      todoId: todoId == freezed
          ? _value.todoId
          : todoId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc
abstract class _$AppStateInfoCopyWith<$Res>
    implements $AppStateInfoCopyWith<$Res> {
  factory _$AppStateInfoCopyWith(
          _AppStateInfo value, $Res Function(_AppStateInfo) then) =
      __$AppStateInfoCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool? authenticated, bool? offlineMode, User? user, String? todoId});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$AppStateInfoCopyWithImpl<$Res> extends _$AppStateInfoCopyWithImpl<$Res>
    implements _$AppStateInfoCopyWith<$Res> {
  __$AppStateInfoCopyWithImpl(
      _AppStateInfo _value, $Res Function(_AppStateInfo) _then)
      : super(_value, (v) => _then(v as _AppStateInfo));

  @override
  _AppStateInfo get _value => super._value as _AppStateInfo;

  @override
  $Res call({
    Object? authenticated = freezed,
    Object? offlineMode = freezed,
    Object? user = freezed,
    Object? todoId = freezed,
  }) {
    return _then(_AppStateInfo(
      authenticated: authenticated == freezed
          ? _value.authenticated
          : authenticated // ignore: cast_nullable_to_non_nullable
              as bool?,
      offlineMode: offlineMode == freezed
          ? _value.offlineMode
          : offlineMode // ignore: cast_nullable_to_non_nullable
              as bool?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      todoId: todoId == freezed
          ? _value.todoId
          : todoId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_AppStateInfo implements _AppStateInfo {
  const _$_AppStateInfo(
      {this.authenticated, this.offlineMode, this.user, this.todoId});

  @override
  final bool? authenticated;
  @override
  final bool? offlineMode;
  @override
  final User? user;
  @override
  final String? todoId;

  @override
  String toString() {
    return 'AppStateInfo(authenticated: $authenticated, offlineMode: $offlineMode, user: $user, todoId: $todoId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AppStateInfo &&
            const DeepCollectionEquality()
                .equals(other.authenticated, authenticated) &&
            const DeepCollectionEquality()
                .equals(other.offlineMode, offlineMode) &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality().equals(other.todoId, todoId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(authenticated),
      const DeepCollectionEquality().hash(offlineMode),
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(todoId));

  @JsonKey(ignore: true)
  @override
  _$AppStateInfoCopyWith<_AppStateInfo> get copyWith =>
      __$AppStateInfoCopyWithImpl<_AppStateInfo>(this, _$identity);
}

abstract class _AppStateInfo implements AppStateInfo {
  const factory _AppStateInfo(
      {bool? authenticated,
      bool? offlineMode,
      User? user,
      String? todoId}) = _$_AppStateInfo;

  @override
  bool? get authenticated;
  @override
  bool? get offlineMode;
  @override
  User? get user;
  @override
  String? get todoId;
  @override
  @JsonKey(ignore: true)
  _$AppStateInfoCopyWith<_AppStateInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
