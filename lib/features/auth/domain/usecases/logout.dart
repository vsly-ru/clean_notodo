import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:notodo/core/errors/failure.dart';
import 'package:notodo/core/interfaces/usecase.dart';
import 'package:notodo/features/auth/domain/entities/user.dart';
import 'package:notodo/features/auth/domain/repositories/auth_repository.dart';

@injectable
class LogoutUC implements IUsecase<void, Future<AuthRepositoryResult>> {
  final IAuthRepository _repository;

  LogoutUC(this._repository);

  @override
  Future<AuthRepositoryResult> execute(void args) async {
    return await _repository.logout();
  }
}
