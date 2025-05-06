import 'package:empowered/core/extension/extensions.dart';

class AveragePercentage extends StatefulWidget {
  const AveragePercentage({
    required this.w1Value,
    required this.w4Value,
    super.key,
    this.percentage,
  });
  final double? w1Value;
  final double? w4Value;
  final double? percentage;
  @override
  State<AveragePercentage> createState() => _AveragePercentageState();
}

class _AveragePercentageState extends State<AveragePercentage> {
  double result = 0;
  void _calc() {
    final w1 = widget.w1Value;
    final w4 = widget.w4Value;
    if (widget.percentage != null) {
      setState(() {
        result = widget.percentage!; // or any fallback value
      });
      return;
    }
    if (w1 == null || w4 == null || w1 == 0) {
      setState(() {
        result = 0; // or any fallback value
      });
      return;
    }

    final output = ((w4 - w1) / w1) * 100;
    setState(() {
      result = output;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _calc();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (result > 0)
          Assets.images.increaseArrow.svg(width: 10)
        else
          Transform.rotate(
            angle: 3.14, // radians (180°)
            child: Assets.images.increaseArrow
                .svg(width: 10, color: AppColors.appRed),
          ),
        const HorizontalSpacing(6),
        Text('${widget.w1Value} ${widget.w4Value}'),
        Text(
          '${result >= 0 ? '+' : ''}${result.toStringAsFixed(2)}%',
          style: TextStyle(
            color: result > 0 ? const Color(0xff5CE0A0) : AppColors.appRed,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
