import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/tasks/data/model/task_model.dart';
import 'package:empowered/features/tasks/presentation/controllers/tasks_controller.dart';
import 'package:empowered/features/tasks/presentation/screens/add_new_task_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskMenuDialog extends GetView<TasksController> {
  const TaskMenuDialog({
    required this.task,
    required this.currentLevel,
    super.key,
  });
  final Task task;
  final String currentLevel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 52.5.w, vertical: 210.h),
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: AppColors.bgMedium,
        child: Padding(
          padding: const EdgeInsets.only(left: 8, top: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 16,
                  left: 16,
                ),
                child: GestureDetector(
                  onTap: () {
                    Get.off(() => AddNewTaskScreen(task: task));
                  },
                  child: const Text(
                    'View Task',
                    style: AppTextStyles.textBodyB2,
                  ),
                ),
              ),
              const VerticalSpacing(15),
              const AppDivider(),
              const VerticalSpacing(15),
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Text(
                  'Move to:',
                  style: AppTextStyles.textBodyB2
                      .copyWith(color: AppColors.primary500),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount:
                      controller.getTaskCategoryTitle(currentLevel).length,
                  itemBuilder: (context, index) {
                    final label =
                        controller.getTaskCategoryTitle(currentLevel)[index];
                    return InkWell(
                      customBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        controller.changeTaskLevel(
                          taskId: task.id.toString(),
                          level: controller.levelList
                                  .where((e) =>
                                      e.toLowerCase() == label.toLowerCase(),)
                                  .isNotEmpty
                              ? controller.levelList.firstWhere((e) =>
                                  e.toLowerCase() == label.toLowerCase(),)
                              : null,
                          completionStatus: controller.completionStatusList
                                  .where((e) => label
                                      .toLowerCase()
                                      .contains(e.toLowerCase()),)
                                  .isNotEmpty
                              ? controller.completionStatusList.firstWhere(
                                  (e) => label
                                      .toLowerCase()
                                      .contains(e.toLowerCase()),)
                              : null,
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                        ),
                        child: Obx(
                          () => Text(
                            '    ${controller.taskCategoryTitle[index]}',
                            style: AppTextStyles.textBodyB2,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
