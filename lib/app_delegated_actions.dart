import 'package:injectable/injectable.dart';
import 'package:notodo/core/actions/delegated_actions.dart';
import 'package:notodo/core/state/app_state_manager.dart';

@Singleton(as: IDelegatedActions)
class AppDelegatedActions extends IDelegatedActions {
  final AppStateManager _appStateManager;

  AppDelegatedActions(this._appStateManager) {
    _init();
  }

  void _init() {
    // openTodo.listen((todo) {
    //   _appStateManager.setTodo(todo.id);
    // });
  }
}
