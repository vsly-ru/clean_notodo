import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:notodo/core/router/page_routes.dart';
import 'package:notodo/core/state/app_state_manager.dart';
import 'package:notodo/di.dart';

import '../../../../core/router/app_router.dart';

class SigninPage extends HookWidget {
  final AppStateManager _stateManager;
  const SigninPage(this._stateManager, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              ),
              SizedBox(height: 16),
              ElevatedButton(
                  onPressed: () {
                    _stateManager.setOfflineMode(true);
                  },
                  child: const Text('Открыть в offline режиме'))
            ],
          ),
        ),
      ),
    );
  }
}
