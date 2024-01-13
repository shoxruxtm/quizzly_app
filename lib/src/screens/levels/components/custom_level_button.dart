import 'package:flutter/material.dart';

import '../../../common/constants/app_colors.dart';
import '../../../common/service/l10n/app_localizations.dart';

class CustomLevelButton extends StatelessWidget {
  final int level;
  final void Function() onPressed;

  const CustomLevelButton({
    required this.level,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final l10n = AppLocalizations.of(context);

    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: AppColors.mainColor,
        side: const BorderSide(
          color: AppColors.white,
          width: 2,
        ),
        fixedSize:
            size.width > 400 ? Size(size.width * .6, 55) : const Size(250, 55),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        l10n.levelNumber(level),
        style: const TextStyle(
          color: AppColors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: .8,
        ),
      ),
    );
  }
}
