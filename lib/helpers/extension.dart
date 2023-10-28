import 'package:flutter/material.dart';

extension MediaQueryExtension on BuildContext {
  Size get getSize => MediaQuery.sizeOf(this);
}
