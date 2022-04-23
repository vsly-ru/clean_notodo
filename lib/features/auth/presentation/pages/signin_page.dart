import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SigninPage extends HookWidget {
  const SigninPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Text('Sign In'),
      ),
    );
  }
}
