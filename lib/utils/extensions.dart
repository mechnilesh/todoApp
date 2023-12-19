import 'package:flutter/material.dart';

extension BuildContextExtensions on BuildContext{
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  Size get deviceSize => MediaQuery.sizeOf(this);
}