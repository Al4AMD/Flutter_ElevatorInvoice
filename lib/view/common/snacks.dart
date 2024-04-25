import 'package:flutter/material.dart';

class CustomSnackBar extends SnackBar {
  CustomSnackBar({
    super.key,
    required List<Widget> widgets,
    super.closeIconColor,
    super.backgroundColor,
    Duration? duration,
    super.showCloseIcon,
    MainAxisAlignment? mainAlignment,
    CrossAxisAlignment? crossAlignment,
  }) : super(
          duration: duration ?? const Duration(milliseconds: 3000),
          content: Column(
            mainAxisAlignment: mainAlignment ?? MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: crossAlignment ?? CrossAxisAlignment.end,
            children: widgets,
          ),
        );
}
