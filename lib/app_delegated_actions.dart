import 'package:injectable/injectable.dart';
import 'package:notodo/core/actions/delegated_actions.dart';
import 'package:notodo/core/state/app_state_manager.dart';

class AppDelegatedActions extends DelegatedActions {
  final AppStateManager _appStateManager;
  AppDelegatedActions(@factoryParam this._appStateManager) {
    _init();
  }

  void _init() {
    openTodo.listen((todo) {
      _appStateManager.setTodo(todo.id);
    });
  }
}
