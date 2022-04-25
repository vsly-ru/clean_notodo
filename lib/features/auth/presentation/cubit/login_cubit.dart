import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notodo/core/errors/failure.dart';
import 'package:notodo/core/state/app_state_manager.dart';
import 'package:notodo/features/auth/domain/entities/user.dart';
import 'package:notodo/features/auth/domain/repositories/auth_repository.dart';
import 'package:notodo/features/auth/domain/usecases/login_with_email.dart';
import 'package:notodo/features/auth/domain/usecases/logout.dart';
import 'package:notodo/features/auth/domain/usecases/register_with_email.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  final AppStateManager _appStateManager;
  final LoginWithEmailUC _loginWithEmailUC;
  final RegisterWithEmailUC _registerWithEmailUC;
  final LogoutUC _logoutUC;
  LoginCubit(this._appStateManager, this._loginWithEmailUC,
      this._registerWithEmailUC, this._logoutUC)
      : super(LoginState.initial());

  bool validate(String email, String password) {
    if (email.isEmpty || password.isEmpty) return false;
    emit(state.copyWith(email: email, password: password));
    return true;
  }

  validationFailed(String message) {
    // emit(state.co)
  }

  Future<void> send() async {
    if (state.email == null || state.password == null) {
      return _failed(const Failure(
          message: 'Emails & password not validated.',
          code: "unvalidated_null"));
    }
    try {
      emit(state.copyWith(isLoading: true));
      Future future;
      if (state.isRegistration) {
        future = _registerWithEmailUC.execute(RegisterWithEmailUCArgs(
            email: state.email!, password: state.password!));
      } else {
        future = _loginWithEmailUC.execute(LoginWithEmailUCArgs(
            email: state.email!, password: state.password!));
      }
      final AuthRepositoryResult result = await future;
      result.fold((l) => _failed(l), (r) => _success(r!));
    } catch (err) {
      if (err is Failure) {
        return _failed(err);
      } else {
        emit(state.copyWith(errMessage: err.toString()));
      }
    }
  }

  // _ _ _

  void _success(User user) {
    emit(LoginState(isSuccess: true));
  }

  void _failed(Failure failure) {
    emit(LoginState(errMessage: '[${failure.code}] ${failure.message}'));
  }
}
