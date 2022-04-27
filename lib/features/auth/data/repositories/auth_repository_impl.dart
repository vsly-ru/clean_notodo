import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:injectable/injectable.dart';
import 'package:notodo/core/constants.dart';
import 'package:notodo/core/errors/failure.dart';
import 'package:notodo/core/platform_channel.dart';
import 'package:notodo/di.dart';
import 'package:notodo/features/auth/domain/entities/user.dart';
import 'package:notodo/features/auth/domain/repositories/auth_repository.dart';

@Injectable(as: IAuthRepository, env: [Env.prod])
class AuthRepository implements IAuthRepository {
  // TODO: inject this channel to be able to test this rep with a mocked method channel
  final _platformChannel = PlatformChannel.channel;

  @override
  Future<AuthRepositoryResult> loginWithEmail(
      String email, String password) async {
    Map<String, dynamic>? result = await _platformChannel
        .invokeMapMethod<String, dynamic>(
            'signin', <String, String>{"email": email, "password": password});
    if (kDebugMode) print(result);
    if (result != null) {
      result = jsonDecode(jsonEncode(result)); // firebase format fix 🤷‍♂️
    }

    if (result != null && result["data"] != null) {
      final Map<String, dynamic> data = result["data"];
      final user = User(
          uid: data["uid"]!,
          email: data["email"]!,
          name: data["name"] ?? '',
          profilePictureUrl: data["profilePictureUrl"] ?? '');
      return Right(user);
    }
    return const Left(
        Failure(message: 'Login failed.', code: 'login_fallback'));
  }

  @override
  Future<AuthRepositoryResult> registerWithEmail(
      String email, String password) async {
    Map<String, dynamic>? result = await _platformChannel
        .invokeMapMethod<String, dynamic>(
            'signup', <String, String>{"email": email, "password": password});
    if (kDebugMode) print(result);
    if (result != null) {
      result = jsonDecode(jsonEncode(result)); // firebase format fix 🤷‍♂️
    }

    if (result != null && result["data"] != null) {
      final Map<String, dynamic> data = result["data"];
      final user = User(
          uid: data["uid"]!,
          email: data["email"]!,
          name: data["name"] ?? '',
          profilePictureUrl: data["profilePictureUrl"] ?? '');
      return Right(user);
    }
    return const Left(
        Failure(message: 'Registration failed.', code: 'reg_fallback'));
  }

  @override
  Future<AuthRepositoryResult> logout() {
    //
    return Future.value(const Left(
        Failure(message: 'Method not implemented.', code: 'not_implemented')));
  }
}
