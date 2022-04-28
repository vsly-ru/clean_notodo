import 'package:injectable/injectable.dart';
import 'package:notodo/core/actions/action.dart';
import 'package:notodo/core/actions/delegated_actions.dart';
import 'package:notodo/features/todos/domain/entities/todo.dart';

@injectable
class OpenAddPageAction implements Action {
  final IDelegatedActions delegate;

  const OpenAddPageAction(this.delegate);

  @override
  void call(void _) => delegate.addTodo.add(null);
}
