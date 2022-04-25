// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'login_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LoginStateTearOff {
  const _$LoginStateTearOff();

  _LoginState call(
      {bool isLoading = false,
      bool isSuccess = false,
      bool isRegistration = false,
      String? email = null,
      String? password = null,
      String? validationError = null,
      String? errMessage = null}) {
    return _LoginState(
      isLoading: isLoading,
      isSuccess: isSuccess,
      isRegistration: isRegistration,
      email: email,
      password: password,
      validationError: validationError,
      errMessage: errMessage,
    );
  }
}

/// @nodoc
const $LoginState = _$LoginStateTearOff();

/// @nodoc
mixin _$LoginState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  bool get isRegistration =>
      throw _privateConstructorUsedError; // sign in or sign up mode
  String? get email =>
      throw _privateConstructorUsedError; // email & password after validation
  String? get password => throw _privateConstructorUsedError;
  String? get validationError => throw _privateConstructorUsedError;
  String? get errMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginStateCopyWith<LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading,
      bool isSuccess,
      bool isRegistration,
      String? email,
      String? password,
      String? validationError,
      String? errMessage});
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res> implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  final LoginState _value;
  // ignore: unused_field
  final $Res Function(LoginState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isSuccess = freezed,
    Object? isRegistration = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? validationError = freezed,
    Object? errMessage = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: isSuccess == freezed
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isRegistration: isRegistration == freezed
          ? _value.isRegistration
          : isRegistration // ignore: cast_nullable_to_non_nullable
              as bool,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      validationError: validationError == freezed
          ? _value.validationError
          : validationError // ignore: cast_nullable_to_non_nullable
              as String?,
      errMessage: errMessage == freezed
          ? _value.errMessage
          : errMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$LoginStateCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory _$LoginStateCopyWith(
          _LoginState value, $Res Function(_LoginState) then) =
      __$LoginStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading,
      bool isSuccess,
      bool isRegistration,
      String? email,
      String? password,
      String? validationError,
      String? errMessage});
}

/// @nodoc
class __$LoginStateCopyWithImpl<$Res> extends _$LoginStateCopyWithImpl<$Res>
    implements _$LoginStateCopyWith<$Res> {
  __$LoginStateCopyWithImpl(
      _LoginState _value, $Res Function(_LoginState) _then)
      : super(_value, (v) => _then(v as _LoginState));

  @override
  _LoginState get _value => super._value as _LoginState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isSuccess = freezed,
    Object? isRegistration = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? validationError = freezed,
    Object? errMessage = freezed,
  }) {
    return _then(_LoginState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: isSuccess == freezed
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isRegistration: isRegistration == freezed
          ? _value.isRegistration
          : isRegistration // ignore: cast_nullable_to_non_nullable
              as bool,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      validationError: validationError == freezed
          ? _value.validationError
          : validationError // ignore: cast_nullable_to_non_nullable
              as String?,
      errMessage: errMessage == freezed
          ? _value.errMessage
          : errMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_LoginState implements _LoginState {
  const _$_LoginState(
      {this.isLoading = false,
      this.isSuccess = false,
      this.isRegistration = false,
      this.email = null,
      this.password = null,
      this.validationError = null,
      this.errMessage = null});

  @JsonKey()
  @override
  final bool isLoading;
  @JsonKey()
  @override
  final bool isSuccess;
  @JsonKey()
  @override
  final bool isRegistration;
  @JsonKey()
  @override // sign in or sign up mode
  final String? email;
  @JsonKey()
  @override // email & password after validation
  final String? password;
  @JsonKey()
  @override
  final String? validationError;
  @JsonKey()
  @override
  final String? errMessage;

  @override
  String toString() {
    return 'LoginState(isLoading: $isLoading, isSuccess: $isSuccess, isRegistration: $isRegistration, email: $email, password: $password, validationError: $validationError, errMessage: $errMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoginState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.isSuccess, isSuccess) &&
            const DeepCollectionEquality()
                .equals(other.isRegistration, isRegistration) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality()
                .equals(other.validationError, validationError) &&
            const DeepCollectionEquality()
                .equals(other.errMessage, errMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(isSuccess),
      const DeepCollectionEquality().hash(isRegistration),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(validationError),
      const DeepCollectionEquality().hash(errMessage));

  @JsonKey(ignore: true)
  @override
  _$LoginStateCopyWith<_LoginState> get copyWith =>
      __$LoginStateCopyWithImpl<_LoginState>(this, _$identity);
}

abstract class _LoginState implements LoginState {
  const factory _LoginState(
      {bool isLoading,
      bool isSuccess,
      bool isRegistration,
      String? email,
      String? password,
      String? validationError,
      String? errMessage}) = _$_LoginState;

  @override
  bool get isLoading;
  @override
  bool get isSuccess;
  @override
  bool get isRegistration;
  @override // sign in or sign up mode
  String? get email;
  @override // email & password after validation
  String? get password;
  @override
  String? get validationError;
  @override
  String? get errMessage;
  @override
  @JsonKey(ignore: true)
  _$LoginStateCopyWith<_LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}
