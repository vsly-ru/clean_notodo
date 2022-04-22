import 'package:flutter/material.dart';
import 'package:notodo/core/constants.dart';
import 'package:notodo/di.dart';
import 'package:notodo/my_app.dart';

void main() {
  // prepare dependencies for incection (production environment)
  configureDependencies(Env.prod);
  runApp(const MyApp());
}
