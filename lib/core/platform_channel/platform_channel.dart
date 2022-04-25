import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

@singleton
class PlatformChannel {
  late final MethodChannel _channel;
  PlatformChannel() {
    _channel = const MethodChannel('notodo.flutter.methodchannel');
  }

  MethodChannel get channel => _channel;
}
