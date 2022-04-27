import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:notodo/core/errors/failure.dart';
import 'package:notodo/core/interfaces/usecase.dart';
import 'package:notodo/core/state/app_state_manager.dart';
import 'package:notodo/features/auth/domain/entities/user.dart';
import 'package:notodo/features/auth/domain/repositories/auth_repository.dart';

class LoginWithEmailUCArgs {
  final String email;
  final String password;
  const LoginWithEmailUCArgs({required this.email, required this.password});
}

@injectable
class LoginWithEmailUC
    implements IUsecase<LoginWithEmailUCArgs, Future<AuthRepositoryResult>> {
  final IAuthRepository repository;

  LoginWithEmailUC({required this.repository});

  @override
  Future<AuthRepositoryResult> execute(LoginWithEmailUCArgs args) async {
    return await repository.loginWithEmail(args.email, args.password);
  }
}
