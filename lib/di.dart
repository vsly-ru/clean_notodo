// dependency injection init for injectable package (for get_it)

import 'package:injectable/injectable.dart';
import 'package:get_it/get_it.dart';

import 'di.config.dart';

final GetIt getIt = GetIt.I;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
void configureDependencies(String environment) =>
    $initGetIt(getIt, environment: environment);
