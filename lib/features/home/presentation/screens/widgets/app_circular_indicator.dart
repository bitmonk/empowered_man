import 'package:empowered/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppCircularProgressIndicator extends StatelessWidget {

  const AppCircularProgressIndicator({
    required this.progress, required this.count, super.key,
    this.strokeWidth = 6,
    this.progressColor = AppColors.primary500,
    this.backgroundColor = const Color(0xff1C2934),
    this.textStyle = const TextStyle(
      color: AppColors.textColor50,
      fontSize: 28,
      fontWeight: FontWeight.w600,
    ),
  });
  final double progress; // Progress value from 0.0 to 1.0
  final double strokeWidth;
  final Color progressColor;
  final Color backgroundColor;
  final TextStyle textStyle;
  final int count;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 88,
      height: 88,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background Circle
          CustomPaint(
            size: const Size(88, 88),
            painter: CirclePainter(
              progress: 1, // Draw a full background circle
              strokeWidth: strokeWidth,
              color: backgroundColor,
            ),
          ),
          // Progress Circle
          CustomPaint(
            size: const Size(88, 88),
            painter: CirclePainter(
              progress: progress,
              strokeWidth: strokeWidth,
              color: progressColor,
              anticlockwise: true,
            ),
          ),
          // Center Text
          Text(
            '$count',
            style: textStyle,
          ),
        ],
      ),
    );
  }
}

class CirclePainter extends CustomPainter {

  CirclePainter({
    required this.progress,
    required this.strokeWidth,
    required this.color,
    this.anticlockwise = false, // Default is clockwise
  });
  final double progress; // Progress value from 0.0 to 1.0
  final double strokeWidth;
  final Color color;
  final bool anticlockwise;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final rect = Rect.fromLTWH(0, 0, size.width, size.height);

    const startAngle = -3.14; // Start from center-left
    final sweepAngle =
        anticlockwise ? -2 * 3.14 * progress : 2 * 3.14 * progress;

    // Draw the arc
    canvas.drawArc(rect, startAngle, sweepAngle, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
