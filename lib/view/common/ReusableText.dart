// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ReusableText extends StatelessWidget {
  const ReusableText(
      {super.key,
      required this.text,
      required this.style,
      this.textAlign,
      this.textDirection});

  final String text;
  final TextStyle style;
  final TextAlign? textAlign;
  final TextDirection? textDirection;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: textDirection ?? TextDirection.rtl,
      child: Text(
        text,
        maxLines: 3,
        softWrap: true,
        textAlign: textAlign ?? TextAlign.center,
        overflow: TextOverflow.fade,
        style: style,
      ),
    );
  }
}
