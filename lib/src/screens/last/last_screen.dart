import 'dart:math';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/constants/app_colors.dart';
import '../../common/models/provider_model.dart';
import '../../common/service/l10n/app_localizations.dart';
import '../../common/utils/custom_button.dart';
import '../../common/utils/custom_text.dart';
import '../home/home_screen.dart';
import '../levels/levels_screen.dart';

class LastScreen extends StatefulWidget {
  final int levelNumber;

  const LastScreen({
    required this.levelNumber,
    super.key,
  });

  @override
  State<LastScreen> createState() => _LastScreenState();
}

class _LastScreenState extends State<LastScreen> {
  late final ConfettiController _controller;

  @override
  void initState() {
    _controller = ConfettiController();
    _controller.play();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final nav = Navigator.of(context);
    int correct = context.watch<ProjectModel>().correct;

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Scaffold(
          backgroundColor: AppColors.white,
          body: Stack(
            alignment: Alignment.topCenter,
            children: [
              const Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 320,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                        color: AppColors.mainColor,
                      ),
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    width: double.infinity,
                    height: 70,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        ),
                        color: AppColors.mainColor,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          "QUIZZLY",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            fontFamily: "Regular",
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  top: 40,
                  right: 10,
                ),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.topLeft,
                      child: BackButton(color: AppColors.white),
                    ),
                    SizedBox(
                      height: 190,
                      child: Align(
                        alignment: const Alignment(0, -.75),
                        child: AvatarGlow(
                          endRadius: 90,
                          showTwoGlows: true,
                          curve: Curves.linearToEaseOut,
                          duration: const Duration(milliseconds: 1500),
                          child: CircleAvatar(
                            radius: 60,
                            backgroundColor: AppColors.white,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomText(
                                  text: l10n.score,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w600,
                                ),
                                CustomText(
                                  text: "${correct * 10}",
                                  fontSize: 25,
                                  fontWeight: FontWeight.w800,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 300,
                      height: 130,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.answerBorder.withOpacity(.4),
                              offset: const Offset(0, 3),
                              blurRadius: 3,
                            ),
                          ],
                          borderRadius: const BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const CircleAvatar(
                                        radius: 7,
                                        backgroundColor: AppColors.green,
                                      ),
                                      const SizedBox(width: 15),
                                      Text(
                                        "$correct",
                                        style: const TextStyle(
                                          color: AppColors.green,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  CustomText(
                                    text: l10n.correct,
                                    fontSize: 14,
                                    color: AppColors.numberColor,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const CircleAvatar(
                                        radius: 7,
                                        backgroundColor: AppColors.red,
                                      ),
                                      const SizedBox(width: 15),
                                      Text(
                                        "${10 - correct}",
                                        style: const TextStyle(
                                          color: AppColors.red,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  CustomText(
                                    text: l10n.wrong,
                                    fontSize: 14,
                                    color: AppColors.numberColor,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomButton(
                            text: l10n.playAgain,
                            onPressed: () => nav.push(
                              MaterialPageRoute(
                                builder: (context) {
                                  context.read<ProjectModel>().reset();
                                  return LevelsScreen(
                                    level: widget.levelNumber,
                                  );
                                },
                              ),
                            ),
                          ),
                          CustomButton(
                            text: l10n.home,
                            onPressed: () => nav.push(
                              MaterialPageRoute(
                                builder: (context) {
                                  context.read<ProjectModel>().reset();
                                  return const HomeScreen();
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 70),
                  ],
                ),
              ),
            ],
          ),
        ),
        ConfettiWidget(
          confettiController: _controller,
          emissionFrequency: .02,
          gravity: .01,
          blastDirection: pi / 2,
          blastDirectionality: BlastDirectionality.directional,
          colors: [
            correct < 6 ? AppColors.red : AppColors.green,
          ],
        ),
      ],
    );
  }
}
