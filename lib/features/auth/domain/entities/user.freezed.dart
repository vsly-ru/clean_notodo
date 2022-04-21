// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UserTearOff {
  const _$UserTearOff();

  _User call(
      {required String uid,
      required String email,
      required String token,
      int lastOnline = 0,
      String name = '',
      String profilePictureUrl = '',
      required String locale,
      required String platform,
      int registered = 0}) {
    return _User(
      uid: uid,
      email: email,
      token: token,
      lastOnline: lastOnline,
      name: name,
      profilePictureUrl: profilePictureUrl,
      locale: locale,
      platform: platform,
      registered: registered,
    );
  }
}

/// @nodoc
const $User = _$UserTearOff();

/// @nodoc
mixin _$User {
// user id
  String get uid => throw _privateConstructorUsedError; // email (as a login)
  String get email => throw _privateConstructorUsedError; // auth token
  String get token =>
      throw _privateConstructorUsedError; // time when the token was issued (unix epoch time, ms, UTC)
  int get lastOnline =>
      throw _privateConstructorUsedError; // empty or displayed user name
  String get name =>
      throw _privateConstructorUsedError; // empty or url to a profile picture
  String get profilePictureUrl =>
      throw _privateConstructorUsedError; // en_US, ru_RU, etc.
  String get locale =>
      throw _privateConstructorUsedError; // android, ios, windows, web, etc.
  String get platform =>
      throw _privateConstructorUsedError; // time the user was registered (unix epoch time, ms, UTC)
  int get registered => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call(
      {String uid,
      String email,
      String token,
      int lastOnline,
      String name,
      String profilePictureUrl,
      String locale,
      String platform,
      int registered});
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object? uid = freezed,
    Object? email = freezed,
    Object? token = freezed,
    Object? lastOnline = freezed,
    Object? name = freezed,
    Object? profilePictureUrl = freezed,
    Object? locale = freezed,
    Object? platform = freezed,
    Object? registered = freezed,
  }) {
    return _then(_value.copyWith(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      lastOnline: lastOnline == freezed
          ? _value.lastOnline
          : lastOnline // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      profilePictureUrl: profilePictureUrl == freezed
          ? _value.profilePictureUrl
          : profilePictureUrl // ignore: cast_nullable_to_non_nullable
              as String,
      locale: locale == freezed
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
      platform: platform == freezed
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String,
      registered: registered == freezed
          ? _value.registered
          : registered // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) then) =
      __$UserCopyWithImpl<$Res>;
  @override
  $Res call(
      {String uid,
      String email,
      String token,
      int lastOnline,
      String name,
      String profilePictureUrl,
      String locale,
      String platform,
      int registered});
}

/// @nodoc
class __$UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(_User _value, $Res Function(_User) _then)
      : super(_value, (v) => _then(v as _User));

  @override
  _User get _value => super._value as _User;

  @override
  $Res call({
    Object? uid = freezed,
    Object? email = freezed,
    Object? token = freezed,
    Object? lastOnline = freezed,
    Object? name = freezed,
    Object? profilePictureUrl = freezed,
    Object? locale = freezed,
    Object? platform = freezed,
    Object? registered = freezed,
  }) {
    return _then(_User(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      lastOnline: lastOnline == freezed
          ? _value.lastOnline
          : lastOnline // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      profilePictureUrl: profilePictureUrl == freezed
          ? _value.profilePictureUrl
          : profilePictureUrl // ignore: cast_nullable_to_non_nullable
              as String,
      locale: locale == freezed
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
      platform: platform == freezed
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String,
      registered: registered == freezed
          ? _value.registered
          : registered // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_User with DiagnosticableTreeMixin implements _User {
  const _$_User(
      {required this.uid,
      required this.email,
      required this.token,
      this.lastOnline = 0,
      this.name = '',
      this.profilePictureUrl = '',
      required this.locale,
      required this.platform,
      this.registered = 0});

  @override // user id
  final String uid;
  @override // email (as a login)
  final String email;
  @override // auth token
  final String token;
  @JsonKey()
  @override // time when the token was issued (unix epoch time, ms, UTC)
  final int lastOnline;
  @JsonKey()
  @override // empty or displayed user name
  final String name;
  @JsonKey()
  @override // empty or url to a profile picture
  final String profilePictureUrl;
  @override // en_US, ru_RU, etc.
  final String locale;
  @override // android, ios, windows, web, etc.
  final String platform;
  @JsonKey()
  @override // time the user was registered (unix epoch time, ms, UTC)
  final int registered;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'User(uid: $uid, email: $email, token: $token, lastOnline: $lastOnline, name: $name, profilePictureUrl: $profilePictureUrl, locale: $locale, platform: $platform, registered: $registered)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'User'))
      ..add(DiagnosticsProperty('uid', uid))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('token', token))
      ..add(DiagnosticsProperty('lastOnline', lastOnline))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('profilePictureUrl', profilePictureUrl))
      ..add(DiagnosticsProperty('locale', locale))
      ..add(DiagnosticsProperty('platform', platform))
      ..add(DiagnosticsProperty('registered', registered));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _User &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.token, token) &&
            const DeepCollectionEquality()
                .equals(other.lastOnline, lastOnline) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.profilePictureUrl, profilePictureUrl) &&
            const DeepCollectionEquality().equals(other.locale, locale) &&
            const DeepCollectionEquality().equals(other.platform, platform) &&
            const DeepCollectionEquality()
                .equals(other.registered, registered));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(uid),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(token),
      const DeepCollectionEquality().hash(lastOnline),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(profilePictureUrl),
      const DeepCollectionEquality().hash(locale),
      const DeepCollectionEquality().hash(platform),
      const DeepCollectionEquality().hash(registered));

  @JsonKey(ignore: true)
  @override
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);
}

abstract class _User implements User {
  const factory _User(
      {required String uid,
      required String email,
      required String token,
      int lastOnline,
      String name,
      String profilePictureUrl,
      required String locale,
      required String platform,
      int registered}) = _$_User;

  @override // user id
  String get uid;
  @override // email (as a login)
  String get email;
  @override // auth token
  String get token;
  @override // time when the token was issued (unix epoch time, ms, UTC)
  int get lastOnline;
  @override // empty or displayed user name
  String get name;
  @override // empty or url to a profile picture
  String get profilePictureUrl;
  @override // en_US, ru_RU, etc.
  String get locale;
  @override // android, ios, windows, web, etc.
  String get platform;
  @override // time the user was registered (unix epoch time, ms, UTC)
  int get registered;
  @override
  @JsonKey(ignore: true)
  _$UserCopyWith<_User> get copyWith => throw _privateConstructorUsedError;
}
