import 'package:flutter/material.dart';

import 'ReusableText.dart';
import 'app_style.dart';

class CustomOutlineBtn extends StatelessWidget {
  const CustomOutlineBtn(
      {super.key,
      required this.width,
      required this.hieght,
      required this.text,
      this.onTap,
      this.textColor,
      required this.btnColor});

  final double width;
  final double hieght;
  final String text;
  final Function()? onTap;
  final Color? textColor;
  final List<Color> btnColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          width: width,
          height: hieght,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.0),
              gradient: LinearGradient(
                  colors: btnColor,
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft)),
          child: Center(
            child: ReusableText(
                text: text,
                style:
                    appstyle(18, textColor ?? Colors.white, FontWeight.w700)),
          ),
        ));
  }
}
