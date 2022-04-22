import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:notodo/core/errors/failure.dart';
import 'package:notodo/features/auth/domain/entities/user.dart';

typedef AuthRepositoryResult = Either<Failure, User?>;

abstract class IAuthRepository {
  Future<AuthRepositoryResult> loginWithEmail(String email, String password);
  Future<AuthRepositoryResult> registerWithEmail(String email, String password);
  Future<AuthRepositoryResult> logout();
}
