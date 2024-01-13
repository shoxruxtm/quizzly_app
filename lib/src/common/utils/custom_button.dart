import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const CustomButton({
    required this.text,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(280, 60),
          side: const BorderSide(
            color: AppColors.answerBorder,
            width: 2,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
        ),
        onPressed: onPressed,
        child: CustomText(
          text: text,
          fontSize: 17,
          fontWeight: FontWeight.w600,
          color: AppColors.numberColor,
          letterSpacing: 1,
        ),
      ),
    );
  }
}
