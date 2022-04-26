import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:injectable/injectable.dart';
import 'package:notodo/core/constants.dart';
import 'package:notodo/core/errors/failure.dart';
import 'package:notodo/di.dart';
import 'package:notodo/features/auth/domain/repositories/auth_repository.dart';

@Injectable(as: IAuthRepository, env: [Env.prod])
class AuthRepository implements IAuthRepository {
  late final MethodChannel _platformChannel;

  AuthRepository() {
    _platformChannel = const MethodChannel('notodo.flutter.methodchannel');
  }

  @override
  Future<AuthRepositoryResult> loginWithEmail(
      String email, String password) async {
    print('invoking signin method');
    final result = await _platformChannel.invokeMapMethod<String, dynamic>(
        'signin', <String, String>{"email": email, "password": password});
    print(result);
    return Future.value(const Left(
        Failure(message: 'Method not implemented.', code: 'not_implemented')));
  }

  @override
  Future<AuthRepositoryResult> registerWithEmail(
      String email, String password) async {
    final result = await _platformChannel.invokeMapMethod<String, dynamic>(
        'signup', <String, String>{"email": email, "password": password});
    print(result);
    return Future.value(const Left(
        Failure(message: 'Method not implemented.', code: 'not_implemented')));
  }

  @override
  Future<AuthRepositoryResult> logout() {
    //
    return Future.value(const Left(
        Failure(message: 'Method not implemented.', code: 'not_implemented')));
  }
}
