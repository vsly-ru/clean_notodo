import 'package:flutter/material.dart';

class PlaceholderWidget extends StatelessWidget {
  const PlaceholderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150.0,
      padding: EdgeInsets.symmetric(horizontal: 11.0, vertical: 15.0),
      alignment: Alignment.center,
      child: const Text('[PLACEHOLDER]'),
    );
  }
}
