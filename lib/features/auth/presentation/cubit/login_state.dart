part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    @Default(false) bool isRegistration, // sign in or sign up mode
    @Default(null) String? email, // email & password after validation
    @Default(null) String? password,
    @Default(null) String? validationError,
    @Default(null) String? errMessage,
  }) = _LoginState;

  factory LoginState.initial() => const LoginState();
}
