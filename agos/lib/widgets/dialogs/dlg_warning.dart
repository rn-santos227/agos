import 'package:flutter/material.dart';

class DialogWarning extends AlertDialog {
  final BuildContext context;
  final String message;

  DialogWarning({
    required this.context,
    required this.message
  }) : super(
    title: Text('Message'),
    content: SingleChildScrollView(
      child: ListBody(
        children: <Widget>[
          Text(message)
        ],
      ),
    ),
    actions: <Widget>[
        TextButton(
          child: Text('Okay'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
  );
}