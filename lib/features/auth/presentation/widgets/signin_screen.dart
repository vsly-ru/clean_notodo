import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:notodo/core/constants.dart';
import 'package:notodo/core/widgets/progress_widget.dart';
import 'package:notodo/core/widgets/tap_container.dart';
import 'package:notodo/core/widgets/toggle_two.dart';
import 'package:notodo/core/widgets/widget_fadein.dart';
import 'package:notodo/features/auth/presentation/cubit/login_cubit.dart';
import 'package:notodo/features/auth/presentation/widgets/edit.dart';
import 'package:notodo/main.dart';

class SigninScreen extends HookWidget {
  final LoginCubit cubit;
  const SigninScreen({required this.cubit, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    // state
    final state = cubit.state;
    final bool isLoading = state.isLoading;
    final bool isRegistration = state.isRegistration;
    // text controllets
    final _emailCtrl = useTextEditingController();
    final _passwordCtrl = useTextEditingController();
    final _passwordCtrl2 = useTextEditingController();
    // build widgets >>
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 40),
          // ToggleTwo(
          //   width: 250.0,
          //   height: 36.0,
          //   value: state.isRegistration,
          //   onTap: cubit.toggleRegistrationMode,
          //   left: 'Вход',
          //   right: 'Регистрация',
          // ),
          // const SizedBox(height: 24.0),
          FadeIn(
              scale: 0.9,
              offset: Offset(0, -32),
              child: Edit(controller: _emailCtrl, caption: 'Email')),
          FadeIn(
              scale: 0.9,
              offset: Offset(0, -32),
              delay: 200,
              child: Edit(
                  controller: _passwordCtrl,
                  caption: 'Пароль',
                  isPassword: true)),
          if (isRegistration)
            FadeIn(
                scale: 0.9,
                offset: Offset(0, -32),
                child: Edit(
                    controller: _passwordCtrl2,
                    caption: 'Повторите пароль',
                    isPassword: true)),
          const SizedBox(height: 48.0),
          FadeIn(
            delay: 300,
            scale: 0.9,
            offset: Offset(0, -32),
            child: TapContainer(
              child: isLoading
                  ? ProgressWidget.infinite(context, compact: true)
                  : Center(
                      child: Text(
                        !isRegistration ? 'Войти' : 'Зарегистрироваться',
                        style: const TextStyle(
                            fontSize: 19, fontWeight: FontWeight.w400),
                      ),
                    ),
              onTap: isLoading
                  ? null
                  : () {
                      if (cubit.validate(_emailCtrl.text, _passwordCtrl.text)) {
                        if (isRegistration &&
                            _passwordCtrl.text != _passwordCtrl2.text) {
                          return cubit.validationFailed('Пароли не совпадают');
                        }
                        cubit.send();
                      }
                    },
            ),
          ),
          const SizedBox(height: 24),
          if (kRunningEnvironment == Env.dev)
            TapContainer(
              height: 25,
              child: const Center(
                child: Text(
                  '(offline) Dev Debug',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ),
              onTap: cubit.setDebugMode,
            ),
          if (state.errMessage != null)
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Text(
                  state.errMessage!,
                  style: const TextStyle(color: Colors.redAccent),
                )),
        ],
      ),
    );
  }
}
