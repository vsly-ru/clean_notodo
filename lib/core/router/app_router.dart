import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import '../state/app_state_manager.dart';

import 'page_routes.dart';

const _initialRoute = PageRoutes.home;

@injectable
class AppRouter extends GoRouter {
  final AppStateManager _appStateManager;
  late final List<StreamSubscription> _deligated;

  AppRouter(this._appStateManager)
      : super(
            refreshListenable: Listenable.merge([
              // AppRouter will listen to app state changes and react accordingly (with redirect logic)
              _appStateManager
            ]),
            redirect: (routerState) {
              if (routerState.subloc == PageRoutes.login &&
                  _appStateManager.state.authenticated == true) {
                //  if login was a success, redirecting to a page we came [from]
                final from = routerState.queryParams['from'];
                return from ?? PageRoutes.home;
              }
              // do not redirect by default
              return null;
            },
            routes: [
              GoRoute(
                  path: '/',
                  redirect: ((state) =>
                      _appStateManager.state.authenticated == true
                          ? _initialRoute
                          : PageRoutes.login))
            ]) {
    _subscribeDeligatedEvents();
  }

  void _subscribeDeligatedEvents() {
    // TODO: subscribe to deligated events
    _deligated = [];
  }

  @override
  void dispose() {
    for (final deligatedSubscription in _deligated) {
      deligatedSubscription.cancel();
    }

    super.dispose();
  }
}
