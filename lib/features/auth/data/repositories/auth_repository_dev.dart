// dev implementation of auth repository to test in dev mode (without accessing production)

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:notodo/core/constants.dart';
import 'package:notodo/core/errors/failure.dart';
import 'package:notodo/features/auth/domain/entities/user.dart';
import 'package:notodo/features/auth/domain/repositories/auth_repository.dart';

@Injectable(as: IAuthRepository, env: [Env.dev])
class DevAuthRepository implements IAuthRepository {
  @override
  Future<AuthRepositoryResult> loginWithEmail(
      String email, String password) async {
    //
    return const Right(
        User(uid: '123', email: 'dev@example.com', name: 'Developer'));
  }

  @override
  Future<AuthRepositoryResult> registerWithEmail(
      String email, String password) {
    //
    return Future.value(const Left(Failure(
        message: 'Method not implemented.', code: 'registerWithEmail')));
  }

  @override
  Future<AuthRepositoryResult> logout() {
    //
    return Future.value(const Left(
        Failure(message: 'Method not implemented.', code: 'logout')));
  }
}
