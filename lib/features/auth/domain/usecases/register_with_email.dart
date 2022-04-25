import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:notodo/core/errors/failure.dart';
import 'package:notodo/core/interfaces/usecase.dart';
import 'package:notodo/features/auth/domain/entities/user.dart';
import 'package:notodo/features/auth/domain/repositories/auth_repository.dart';

class RegisterWithEmailUCArgs {
  final String email;
  final String password;
  const RegisterWithEmailUCArgs({required this.email, required this.password});
}

@injectable
class RegisterWithEmailUC
    implements IUsecase<RegisterWithEmailUCArgs, Future<AuthRepositoryResult>> {
  final IAuthRepository _repository;

  RegisterWithEmailUC(this._repository);

  @override
  Future<AuthRepositoryResult> execute(RegisterWithEmailUCArgs args) async {
    return await _repository.registerWithEmail(args.email, args.password);
  }
}
