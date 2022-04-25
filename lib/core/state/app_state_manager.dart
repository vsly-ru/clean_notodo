/// app state manager
/// - get state & notifier
/// - setters
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:notodo/features/auth/domain/entities/user.dart';

import 'app_state.dart';

@singleton
class AppStateManager extends ValueNotifier<AppStateInfo> {
  AppStateManager() : super(const AppStateInfo()) {
    addListener(() {
      log('state updated: $value', name: 'AppStateManager');
    });
  }

  AppStateInfo get state => value;

  void setUser(User? user) {
    value = value.copyWith(user: user);
  }

  void setAuthenticated(bool authenticated) {
    value = value.copyWith(authenticated: authenticated);
  }

  void setOfflineMode(bool offlineMode) {
    value = value.copyWith(offlineMode: offlineMode);
  }

  void setTodo(String? todoId) {
    value = value.copyWith(todoId: todoId);
  }
}
