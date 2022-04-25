import 'package:dartz/dartz.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:injectable/injectable.dart';
import 'package:notodo/core/constants.dart';
import 'package:notodo/core/errors/failure.dart';
import 'package:notodo/core/platform_channel/platform_channel.dart';
import 'package:notodo/di.dart';
import 'package:notodo/features/auth/domain/repositories/auth_repository.dart';

@Injectable(as: IAuthRepository, env: [Env.prod])
class AuthRepository implements IAuthRepository {
  late final PlatformChannel _platformChannel;

  AuthRepository() {
    _platformChannel = useMemoized(() => getIt<PlatformChannel>());
  }

  @override
  Future<AuthRepositoryResult> loginWithEmail(
      String email, String password) async {
    final result = await _platformChannel.channel
        .invokeMapMethod<String, dynamic>(
            'signin', <String, String>{"email": email, "password": password});
    print('invocation result:');
    print(result);
    return Future.value(const Left(
        Failure(message: 'Method not implemented.', code: 'not_implemented')));
  }

  @override
  Future<AuthRepositoryResult> registerWithEmail(
      String email, String password) {
    //
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
