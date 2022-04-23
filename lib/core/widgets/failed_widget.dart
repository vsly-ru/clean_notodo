import 'package:flutter/material.dart';

class FailedWidget extends StatelessWidget {
  final String? message;

  /// a function user can call to retry
  final Function()? retry;

  final String? retryText;
  const FailedWidget({this.message, this.retry, this.retryText, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 11.0, vertical: 15.0),
      child: Column(
        children: [
          Text(
            message ?? 'Something went wrong.',
            style: const TextStyle(color: Colors.redAccent),
          ),
          if (retry != null) SizedBox(height: 16.0),
          if (retry != null)
            ElevatedButton(onPressed: retry, child: Text(retryText ?? 'retry'))
        ],
      ),
    );
  }
}
