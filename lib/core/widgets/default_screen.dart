import 'package:flutter/material.dart';

class DefaultScreenScaffold extends StatelessWidget {
  final Widget? body;
  final Alignment align;
  final EdgeInsets padding;
  const DefaultScreenScaffold(
      {this.body,
      Key? key,
      this.align = Alignment.center,
      this.padding =
          const EdgeInsets.symmetric(vertical: 55.0, horizontal: 11.0)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
              alignment: align,
              padding: padding,
              width: double.infinity,
              height: double.infinity,
              child: body)),
    );
  }
}
