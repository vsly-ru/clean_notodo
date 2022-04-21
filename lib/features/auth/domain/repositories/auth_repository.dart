import 'package:dartz/dartz.dart';
import 'package:notodo/core/errors/failure.dart';
import 'package:notodo/features/auth/domain/entities/user.dart';

abstract class IAuthRepository {
  Future<Either<Failure, User>> loginEmailAndPassword(
      String email, String password);
  Future<Either<Failure, User>> registerEmailAndPassword(
      String email, String password);
}
