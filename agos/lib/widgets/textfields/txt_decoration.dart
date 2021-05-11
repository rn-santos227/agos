import 'package:flutter/material.dart';

class TextDecoration extends InputDecoration {
  final IconData? iconData;
  final String? hint;

  TextDecoration({
    this.iconData,
    this.hint
  }) : super(
    isDense: true,
    hintText: hint,
    filled: true,
    fillColor: Colors.white,
    prefixIcon: Icon(iconData),
    enabledBorder: OutlineInputBorder(
      borderRadius: new BorderRadius.circular(30.0)
    ),

    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red, width: 3.0),
      borderRadius: new BorderRadius.circular(30.0)
    ),

    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red, width: 3.0),
      borderRadius: new BorderRadius.circular(30.0)
    ),

    focusedBorder: OutlineInputBorder(
      borderRadius: new BorderRadius.circular(30.0)
    ),
  );
}