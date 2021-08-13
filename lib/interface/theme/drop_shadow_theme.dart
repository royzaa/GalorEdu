import 'package:flutter/material.dart';

class DropShadowTheme {
  static const appBar = BoxShadow(
    blurRadius: 50,
    offset: Offset(0, 10),
    spreadRadius: 5,
    color: Color.fromRGBO(0, 0, 0, 0.05),
  );
}
