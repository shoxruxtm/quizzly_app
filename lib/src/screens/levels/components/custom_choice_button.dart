import 'package:flutter/material.dart';

import '../../../common/constants/app_colors.dart';
import '../../../common/utils/custom_text.dart';

class CustomChoiceButton extends StatelessWidget {
  final int? number;
  final void Function()? onPressed;

  const CustomChoiceButton({
    this.number,
    this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(double.infinity, 60),
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
        text: "$number",
        fontSize: 17,
        fontWeight: FontWeight.w600,
        color: AppColors.numberColor,
      ),
    );
  }
}
