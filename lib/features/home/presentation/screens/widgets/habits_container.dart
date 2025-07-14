import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/home/data/model/dashboard_habit_model.dart';
import 'package:empowered/features/home/presentation/controllers/home_controller.dart';

class HabitsContainer extends StatefulWidget {
  const HabitsContainer({required this.habit, super.key});
  final Habit habit;

  @override
  State<HabitsContainer> createState() => _HabitsContainerState();
}

class _HabitsContainerState extends State<HabitsContainer> {
  bool isActive = false;
  final controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.updateDashboardHabit(id: widget.habit.id.toString());
        // setState(() {
        //   isActive = !isActive;
        // });
      },
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            20,
          ),
          color: widget.habit.status == 1
              ? AppColors.primary500
              : AppColors.bgContainer,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppCachedImage(
              imgUrl: widget.habit.logo ?? '',
              width: 20,
              color: widget.habit.status == 1 ? AppColors.white : null,
              height: 20,
              errorWid: const Icon(
                Icons.image_not_supported,
                size: 20,
                color: AppColors.primary500,
              ),
            ),
            const VerticalSpacing(16),
            Text(
              widget.habit.type ?? '',
              style: AppTextStyles.bodyB5,
            ),
          ],
        ),
      ),
    );
  }
}
