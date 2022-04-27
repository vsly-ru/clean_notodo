import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    // user id
    required String uid,
    // email (as a login)
    required String email,
    // empty or displayed user name
    @Default('') String name,
    // empty or url to a profile picture
    @Default('') String profilePictureUrl,
    //
  }) = _User;
}
