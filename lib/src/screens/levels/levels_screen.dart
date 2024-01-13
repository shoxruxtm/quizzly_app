import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/constants/app_colors.dart';
import '../../common/models/provider_model.dart';
import '../../common/service/l10n/app_localizations.dart';
import '../../common/utils/custom_text.dart';
import '../last/last_screen.dart';

import 'components/custom_choice_button.dart';
import 'components/custom_create_time.dart';

class LevelsScreen extends StatefulWidget {
  final int level;

  const LevelsScreen({
    required this.level,
    super.key,
  });

  @override
  State<LevelsScreen> createState() => _LevelsScreenState();
}

class _LevelsScreenState extends State<LevelsScreen> {
  List<String> symbols = ["+", "-", "*", "/"];
  int questionLimit = 1;
  int correct = 0;

  late List<int> numbers1;
  late List<int> numbers2;
  late int num1;
  late int num2;
  late double result;
  late List<int> answers;

  @override
  void initState() {
    switch (widget.level) {
      case 1:
        numbers1 = List.generate(9, (index) => index + 1);
        break;
      case 2:
        numbers1 = List.generate(29, (index) => index + 1);
        break;
      case 3:
        numbers1 = List.generate(99, (index) => index + 1);
        break;
    }

    switch (widget.level) {
      case 1:
        numbers2 = List.generate(9, (index) => index + 1);
        break;
      case 2:
        numbers2 = List.generate(29, (index) => index + 1);
        break;
      case 3:
        numbers2 = List.generate(99, (index) => index + 1);
        break;
    }

    randomNumbers();

    randomSymbols();

    whichLevel();

    /// bu bir xil javoblarni taklif qilmaslik uchun

    answers.shuffle();

    super.initState();
  }

  void isCorrect(int value) {
    bool isCorrect = value == result.toInt();
    context.read<ProjectModel>().addCorrect(isCorrect);
  }

  void randomSymbols() {
    symbols.shuffle();
    switch (symbols[0]) {
      case "/":
        result = num1 / num2;
        break;
      case "*":
        result = (num1 * num2).toDouble();
        break;
      case "+":
        result = (num1 + num2).toDouble();
        break;
      case "-":
        result = (num1 - num2).toDouble();
        break;
    }
  }

  void randomNumbers() {
    numbers1.shuffle();
    num1 = numbers1[0];
    numbers2.shuffle();
    num2 = numbers2[0];
  }

  void isOver() {
    questionLimit == 10 ? openLastScreen(widget.level) : questionLimit++;
  }

  void whichLevel() {
    switch (widget.level) {
      case 1:
        answers = [
          result.toInt(),
          Random().nextInt(50) + -30,
          Random().nextInt(100),
          Random().nextInt(10),
        ];
        break;
      case 2:
        answers = [
          result.toInt(),
          Random().nextInt(1000) + -300,
          Random().nextInt(1000),
          Random().nextInt(10),
        ];
        break;
      case 3:
        answers = [
          result.toInt(),
          Random().nextInt(7000) + -3000,
          Random().nextInt(10000),
          Random().nextInt(1000),
        ];
        break;
    }
  }

  void nextTask(int value) {
    setState(() {
      /// javobni to'griligini tekshirish uchun
      isCorrect(value);

      /// savollar tugashini aniqlash uchun
      isOver();

      /// random sonlar hosil qilish uchun
      randomNumbers();

      /// random simvollar hosil qilish uchun
      randomSymbols();

      whichLevel();

      /// javobni tasodifiy o'ringa joylashtirish uchun
      randomAnswerPlace(value);
    });
  }

  void randomAnswerPlace(int value) {
    answers.toSet().length != 4
        ? () {
            nextTask(value);
            questionLimit--;
          }
        : answers.shuffle();
  }

  void openLastScreen(int levelNumber) => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => LastScreen(levelNumber: levelNumber),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          const Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 250,
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
              left: 40,
              top: 40,
              right: 40,
            ),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: BackButton(color: AppColors.white),
                ),
                const SizedBox(height: 90),
                SizedBox(
                  width: double.infinity,
                  height: 140,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.mainColor.withOpacity(.4),
                          offset: const Offset(0, 3),
                          blurRadius: 3,
                        ),
                      ],
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text:
                                "${l10n.question} ${questionLimit.toString().padLeft(2, "0")}/10",
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            letterSpacing: .7,
                          ),
                          CustomText(
                            text: "$num1 ${symbols[0]} $num2 = ?",
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            letterSpacing: .7,
                            color: AppColors.numberColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomChoiceButton(
                        number: answers[0],
                        onPressed: () => nextTask(answers[0]),
                      ),
                      CustomChoiceButton(
                        number: answers[1],
                        onPressed: () => nextTask(answers[1]),
                      ),
                      CustomChoiceButton(
                        number: answers[2],
                        onPressed: () => nextTask(answers[2]),
                      ),
                      CustomChoiceButton(
                        number: answers[3],
                        onPressed: () => nextTask(answers[3]),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 70),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 145),
            child: CircleAvatar(
              radius: 33,
              backgroundColor: AppColors.white,
              child: CreateTime(
                whichLevel: widget.level,
                nextTask: nextTask,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
