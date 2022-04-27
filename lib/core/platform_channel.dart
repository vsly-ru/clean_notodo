import 'package:flutter/services.dart';

abstract class PlatformChannel {
  static const channel = MethodChannel('notodo.flutter.methodchannel');
}
