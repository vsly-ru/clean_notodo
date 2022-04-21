// platform info
// v2 2022-02-15

import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';

class PlatformInfo {
  // host platform name
  static String get name {
    if (kIsWeb) return 'web';
    if (Platform.isIOS) return 'ios';
    if (Platform.isMacOS) return 'macos';
    if (Platform.isLinux) return 'linux';
    if (Platform.isAndroid) return 'android';
    if (Platform.isWindows) return 'windows';
    if (Platform.isFuchsia) return 'fuchsia';
    return 'unknown';
  }

  // en_US, ru_RU, etc.
  static String get locale => Platform.localeName;
}
