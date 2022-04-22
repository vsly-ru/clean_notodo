import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:notodo/core/constants.dart';
import 'package:notodo/di.dart';
import 'core/router/app_router.dart';
import 'core/theme/dark.dart';
import 'core/theme/light.dart';
import 'core/widgets/widget_fadein.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final appRouter = useMemoized(() => getIt<AppRouter>());
    //
    return MaterialApp.router(
      color: LightTheme.themeData.primaryColor,
      routeInformationParser: appRouter.routeInformationParser,
      routerDelegate: appRouter.routerDelegate,
      title: 'Nothing ToDo',
      debugShowCheckedModeBanner: false,
      theme: LightTheme.themeData,
      darkTheme: DarkTheme.themeData,
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        // Enable scrolling on all devices (otherwise ListView doesn't react on pointer-scroll events)
        dragDevices: PointerDeviceKind.values.toSet(),
      ),
    );
  }
}
