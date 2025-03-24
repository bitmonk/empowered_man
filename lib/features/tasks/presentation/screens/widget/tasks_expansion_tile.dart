import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/group/presentation/screens/widgets/colored_padded_cotainer.dart';
import 'package:empowered/features/tasks/presentation/controllers/tasks_controller.dart';
import 'package:empowered/gen/assets.gen.dart';

class TasksExpansionTile extends StatelessWidget {
  TasksExpansionTile({
    required this.title,
    required this.description,
    required this.taskPortion,
    required this.isCompleted,
    required this.isDone,
    required this.onTap,
    this.taskCompletionPoint,
    this.collapseBorderSideColor = AppColors.color008CFF,
    super.key,
  });
  final String title;
  final String description;
  final int taskPortion;
  final bool isCompleted;
  final bool isDone;
  final VoidCallback onTap;

  final int? taskCompletionPoint;
  final Color collapseBorderSideColor;
  final controller = Get.find<TasksController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 11),
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.bgDark,
            border: Border.all(
              color: collapseBorderSideColor,
            ),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Row(
            children: [
              if (!isCompleted)
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ColoredPaddedCotainer(
                    horizontalPadding: 5,
                    textStyle: AppTextStyles.titleSm.copyWith(fontSize: 12),
                    title: '$taskPortion',
                    color: AppColors.primary500,
                    borderColor: AppColors.primary500,
                    verticalPadding: 2,
                  ),
                ),
              Text(
                title,
                style: AppTextStyles.titleMd
                    .copyWith(color: Colors.white, fontSize: 15),
              ),
              if (isCompleted)
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    '$taskCompletionPoint/20',
                    style: AppTextStyles.titleSm.copyWith(
                      fontSize: 12,
                      color: const Color(0xFFC1C9D1),
                    ),
                  ),
                ),
              const Spacer(),
              InkWell(
                onTap: () {
                  Get.toNamed(AppRoutes.addNewTask);
                },
                child:
                    Assets.images.addCircleOutlined.svg(width: 24, height: 24),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
