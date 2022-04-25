import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:notodo/features/auth/presentation/cubit/login_cubit.dart';

class SigninPage extends HookWidget {
  // final AppStateManager _stateManager;
  // final LoginWithEmailUC _loginWithEmailUC;
  // final RegisterWithEmailUC _registerWithEmailUC;
  // final LogoutUC _logoutUC;
  final LoginCubit cubit;
  const SigninPage({required this.cubit, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _emailCtrl = useTextEditingController();
    final _passwordCtrl = useTextEditingController();
    // >>
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Sign In',
                style: TextStyle(fontSize: 24.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
