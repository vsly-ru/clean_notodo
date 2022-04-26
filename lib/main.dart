import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:notodo/core/constants.dart';
import 'package:notodo/di.dart';
import 'package:notodo/my_app.dart';

const kRunningEnvironment = !kDebugMode ? Env.dev : Env.prod;

void main() {
  if (kDebugMode) print('Running in $kRunningEnvironment mode');
  // prepare dependencies for incection (for a selected environment)
  configureDependencies(kRunningEnvironment);
  runApp(const MyApp());
}
