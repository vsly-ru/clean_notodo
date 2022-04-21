import 'package:rxdart/rxdart.dart';

abstract class DelegatedActions {
  final openedTodo = PublishSubject<dynamic>();
}
