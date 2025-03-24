import 'package:empowered/core/extension/extensions.dart';

class HabitsContainer extends StatefulWidget {
  const HabitsContainer({required this.label, required this.image, super.key});
  final String label;
  final String image;

  @override
  State<HabitsContainer> createState() => _HabitsContainerState();
}

class _HabitsContainerState extends State<HabitsContainer> {
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            isActive = !isActive;
          });
        },
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              20,
            ),
            color: isActive ? AppColors.primary500 : AppColors.bgContainer,
          ),
          child: Column(
            children: [
              Image.asset(
                widget.image,
                width: 32,
                color: isActive ? AppColors.white : null,
              ),
              const VerticalSpacing(16),
              Text(
                widget.label,
                style: AppTextStyles.bodyB5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
