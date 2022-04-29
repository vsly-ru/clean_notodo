import 'package:flutter/material.dart';

class Edit extends StatelessWidget {
  final TextEditingController controller;
  final String caption;
  final bool isPassword;
  const Edit(
      {this.caption = '',
      required this.controller,
      this.isPassword = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (caption.isNotEmpty)
          Container(
              padding: EdgeInsets.only(left: 18, top: 11, bottom: 2.0),
              child: Text(
                caption,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: theme.colorScheme.onBackground),
              )),
        Container(
          // padding: const EdgeInsets.only(
          //     left: 11.0, right: 11.0, top: 2.0, bottom: 6.0),
          margin: const EdgeInsets.symmetric(horizontal: 7.0),
          height: 45.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(6.0),
            // border: Border.all(color: Colors.grey.withOpacity(0.3)),
          ),
          child: TextField(
            obscureText: isPassword,
            controller: controller,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
            decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 13.0, vertical: 2.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0))),
          ),
        ),
      ],
    );
  }
}
