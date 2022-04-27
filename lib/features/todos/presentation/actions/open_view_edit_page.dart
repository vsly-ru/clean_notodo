import 'package:injectable/injectable.dart';
import 'package:notodo/core/actions/action.dart';
import 'package:notodo/core/actions/delegated_actions.dart';
import 'package:notodo/features/todos/domain/entities/todo.dart';

@injectable
class OpenViewEditPage implements Action {
  final IDelegatedActions delegate;

  const OpenViewEditPage(this.delegate);

  @override
  void call(covariant ToDo todo) => delegate.openTodo.add(todo);
}
