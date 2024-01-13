import 'dart:async';
import 'dart:math' as math show pi;

import 'package:flutter/material.dart';

import '../../../common/constants/app_colors.dart';
import '../../../common/constants/app_images.dart';

class CreateTime extends StatefulWidget {
  final int whichLevel;
  final void Function(int) nextTask;

  const CreateTime({
    required this.whichLevel,
    required this.nextTask,
    super.key,
  });

  @override
  State<CreateTime> createState() => _CreateTimeState();
}

class _CreateTimeState extends State<CreateTime> {
  Timer? timer;
  late int timeLimit;
  double indicatorValue = 1.0;
  int count = 0;

  @override
  void initState() {
    if (widget.whichLevel case == 2 || 3) startTime();
    super.initState();
  }

  void startTime() {
    if (widget.whichLevel == 2) {
      timeLimit = 20;
    } else if (widget.whichLevel == 3) {
      timeLimit = 10;
    }

    timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      setState(() {
        indicatorValue = (timeLimit - timer.tick / 20) / timeLimit;

        count++;

        if (indicatorValue == 0.0) {
          timer.cancel();
          widget.nextTask.call(-200000);
          if (count < 10) startTime.call();
        }
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.whichLevel) {
      case 2:
        {
          return CircleAvatar(
            radius: 25,
            backgroundColor: AppColors.white,
            child: CustomIndicator(
              value: indicatorValue,
              color: AppColors.mainColor,
              width: 3,
              child: Center(
                child: Text(
                  ((20 * timeLimit - timer!.tick) / 20).ceil().toString(),
                  style: const TextStyle(
                    color: AppColors.mainColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        }
      case 3:
        {
          return CircleAvatar(
            radius: 25,
            backgroundColor: AppColors.white,
            child: CustomIndicator(
              value: indicatorValue,
              color: AppColors.mainColor,
              width: 3,
              child: Center(
                child: Text(
                  ((20 * timeLimit - timer!.tick) / 20).ceil().toString(),
                  style: const TextStyle(
                    color: AppColors.mainColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        }
      default:
        {
          return const CircleAvatar(
            radius: 25,
            backgroundColor: AppColors.mainColor,
            child: Image(
              width: 25,
              color: AppColors.white,
              image: AssetImage(AppImages.infiniteIcon),
            ),
          );
        }
    }
  }
}

class CustomIndicator extends StatelessWidget {
  const CustomIndicator({
    required this.value,
    required this.child,
    this.width = 2.0,
    this.color = const Color(0xFFFFFFFF),
    super.key,
  });

  final Widget child;
  final double value;
  final double width;
  final Color color;

  @override
  Widget build(BuildContext context) => CustomPaint(
        painter: IndicatorPaint(
          value: value,
          width: width,
          color: color,
        ),
        child: child,
      );
}

class IndicatorPaint extends CustomPainter {
  const IndicatorPaint({
    required this.value,
    required this.width,
    required this.color,
  });

  final double value;
  final double width;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = width
      ..strokeCap = StrokeCap.round
      ..color = color
      ..style = PaintingStyle.stroke;

    canvas.drawArc(
      const Offset(0.5, 0.5) & size,
      -math.pi / 2,
      2 * math.pi * value,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant IndicatorPaint oldDelegate) {
    return value != oldDelegate.value;
  }
}
