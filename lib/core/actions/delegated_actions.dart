// Delegation pattern actions

import 'package:rxdart/rxdart.dart';

abstract class DelegatedActions {
  final opened = PublishSubject<dynamic>();
}
