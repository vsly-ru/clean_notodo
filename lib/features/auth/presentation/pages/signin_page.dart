import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:notodo/core/state/app_state_manager.dart';
import 'package:notodo/core/widgets/toggle_two.dart';
import 'package:notodo/core/widgets/widget_fadein.dart';
import 'package:notodo/features/auth/domain/repositories/auth_repository.dart';
import 'package:notodo/features/auth/domain/usecases/login_with_email.dart';
import 'package:notodo/features/auth/domain/usecases/logout.dart';
import 'package:notodo/features/auth/domain/usecases/register_with_email.dart';
import 'package:notodo/features/auth/presentation/cubit/login_cubit.dart';
import 'package:notodo/features/auth/presentation/widgets/signin_screen.dart';

class SigninPage extends HookWidget {
  final AppStateManager appStateManager;
  final IAuthRepository repository;
  const SigninPage(
      {required this.appStateManager, required this.repository, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _loginWithEmailUC =
        useMemoized(() => LoginWithEmailUC(repository: repository));
    final _registerWithEmailUC =
        useMemoized(() => RegisterWithEmailUC(repository: repository));
    final _logoutUC = useMemoized(() => LogoutUC(repository: repository));
    // TODO: inject cubit with usecases from page building in router
    final LoginCubit cubit = useMemoized(() => LoginCubit(
        appStateManager, _loginWithEmailUC, _registerWithEmailUC, _logoutUC));
    // building >>
    return BlocBuilder<LoginCubit, LoginState>(
        bloc: cubit,
        builder: (context, state) {
          final theme = Theme.of(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: theme.scaffoldBackgroundColor,
              title: state.isSuccess
                  ? null
                  : ToggleTwo(
                      width: 250.0,
                      height: 36.0,
                      value: state.isRegistration,
                      onTap:
                          state.isLoading ? null : cubit.toggleRegistrationMode,
                      left: 'Вход',
                      right: 'Регистрация',
                      duration: 250,
                      awaitBeforeOnTap: 0.75,
                    ),
              elevation: 0,
            ),
            body: SafeArea(
                child: state.isSuccess
                    ? successWidget
                    : Container(
                        height: double.infinity,
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: SigninScreen(cubit: cubit),
                      )),
          );
        });
  }
}

const successWidget = Center(
  child: FadeIn(
    scale: 0.9,
    // duration: 800,
    child: Text(
      'Успешно',
      style: TextStyle(
          fontSize: 22, fontWeight: FontWeight.w300, color: Colors.lightGreen),
    ),
  ),
);
