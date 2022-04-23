import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:notodo/core/constants.dart';
import 'package:notodo/di.dart';
import 'package:notodo/my_app.dart';

void main() {
  const runningEnvironment = kDebugMode ? Env.dev : Env.prod;
  if (kDebugMode) print('Running in $runningEnvironment mode');
  // prepare dependencies for incection (for a selected environment)
  configureDependencies(runningEnvironment);
  runApp(const MyApp());
}
