import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final double? letterSpacing;

  const CustomText({
    required this.text,
    required this.fontSize,
    this.color = AppColors.indicatorColor,
    this.fontWeight = FontWeight.w400,
    this.letterSpacing,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
      ),
    );
  }
}
