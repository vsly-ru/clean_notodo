import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:notodo/core/constants.dart';
import 'package:notodo/core/errors/failure.dart';
import 'package:notodo/features/auth/domain/repositories/auth_repository.dart';

@Injectable(as: IAuthRepository, env: [Env.dev])
class DevAuthRepository implements IAuthRepository {
  @override
  Future<AuthRepositoryResult> loginWithEmail(String email, String password) {
    //
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
