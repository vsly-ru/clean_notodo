import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:notodo/core/interfaces/usecase.dart';
import 'package:notodo/core/state/app_state_manager.dart';
import 'package:notodo/features/auth/domain/repositories/auth_repository.dart';

@injectable
class LogoutUC implements IUsecase<void, Future<AuthRepositoryResult>> {
  final IAuthRepository repository;

  LogoutUC({required this.repository});

  @override
  Future<AuthRepositoryResult> execute(void args) async {
    return await repository.logout();
  }
}
