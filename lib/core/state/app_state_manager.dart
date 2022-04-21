/// app state manager concrete implementation
/// - get state & notifier
/// - state setters implementation
import 'dart:developer';

import 'package:flutter/foundation.dart';

import 'app_state.dart';

class AppStateManager extends ValueNotifier<AppStateInfo> {
  AppStateManager() : super(const AppStateInfo()) {
    addListener(() {
      log('state updated: $value', name: 'AppStateManager');
    });
  }

  AppStateInfo get state => value;

  void setInitialized(bool initialized) {
    value = value.copyWith(initialized: initialized);
  }

  void setAuthenticated(bool authenticated) {
    value = value.copyWith(authenticated: authenticated);
  }

  void setPage(String pageId) {
    value = value.copyWith(pageId: pageId);
  }
}
