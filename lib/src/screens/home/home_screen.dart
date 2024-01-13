import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/constants/app_colors.dart';
import '../../common/constants/app_images.dart';
import '../../common/models/provider_model.dart';
import '../../common/service/l10n/app_localizations.dart';
import '../../common/utils/custom_text.dart';
import '../levels/components/custom_level_button.dart';
import '../levels/levels_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void openLevelsScreen(int level) => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => LevelsScreen(level: level),
        ),
      );

  void dropDownCallback(String? selectedValue, BuildContext context) {
    context.read<ProjectModel>().setLocale(
          Locale(selectedValue!),
          selectedValue,
        );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.backImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              left: size.width * .8,
              top: size.width * .11,
              child: DropdownButton(
                underline: const SizedBox.shrink(),
                style: const TextStyle(
                  color: AppColors.white,
                ),
                dropdownColor: AppColors.mainColor,
                iconEnabledColor: AppColors.white,
                value: context.read<ProjectModel>().dropDownValue,
                items: const [
                  DropdownMenuItem<String>(
                    value: "uz",
                    child: Text("uz"),
                  ),
                  DropdownMenuItem<String>(
                    value: "en",
                    child: Text("en"),
                  ),
                  DropdownMenuItem<String>(
                    value: "ru",
                    child: Text("ru"),
                  ),
                ],
                onChanged: (value) => dropDownCallback(value, context),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 20,
                top: size.height * .1,
                right: 20,
              ),
              child: Column(
                children: [
                  const SizedBox(width: double.infinity),
                  const Text(
                    "QUIZZLY",
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 60,
                      fontFamily: "Expletus",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    child: SizedBox(
                      width:
                          size.width > 400 ? size.width * .7 : double.infinity,
                      height: 160,
                      child: DecoratedBox(
                        decoration: const BoxDecoration(
                          color: AppColors.white90,
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                text: l10n.welcome,
                                fontSize: context.read<ProjectModel>().locale ==
                                        const Locale("ru")
                                    ? 20
                                    : 25,
                                fontWeight: FontWeight.w600,
                              ),
                              CustomText(
                                text: l10n.description,
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  CustomText(
                    text: l10n.appropriateLevel,
                    fontSize: 20,
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                    letterSpacing: .8,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomLevelButton(
                          onPressed: () => openLevelsScreen(1),
                          level: 1,
                        ),
                        CustomLevelButton(
                          onPressed: () => openLevelsScreen(2),
                          level: 2,
                        ),
                        CustomLevelButton(
                          onPressed: () => openLevelsScreen(3),
                          level: 3,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
