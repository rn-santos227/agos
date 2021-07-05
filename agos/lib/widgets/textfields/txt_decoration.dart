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
  );
}