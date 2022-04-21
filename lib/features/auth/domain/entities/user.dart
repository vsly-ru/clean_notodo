import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User(
      {
      // user id
      required String uid,
      // email (as a login)
      required String email,
      // auth token
      required String token,
      // time when the token was issued (unix epoch time, ms, UTC)
      @Default(0) int lastOnline,
      // empty or displayed user name
      @Default('') String name,
      // empty or url to a profile picture
      @Default('') String profilePictureUrl,
      // en_US, ru_RU, etc.
      required String locale,
      // android, ios, windows, web, etc.
      required String platform,
      // time the user was registered (unix epoch time, ms, UTC)
      @Default(0) int registered}) = _User;
}
