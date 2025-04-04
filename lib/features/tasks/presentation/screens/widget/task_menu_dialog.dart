import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/tasks/presentation/controllers/tasks_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskMenuDialog extends GetView<TasksController> {
  const TaskMenuDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 52.5.w, vertical: 220.h),
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: AppColors.bgMedium,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(
                top: 16,
                left: 16,
              ),
              child: Text(
                'View Task',
                style: AppTextStyles.textBodyB2,
              ),
            ),
            const VerticalSpacing(5),
            const AppDivider(),
            const VerticalSpacing(15),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                'Move to:',
                style: AppTextStyles.textBodyB2
                    .copyWith(color: AppColors.primary500),
              ),
            ),
            Expanded(
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.taskCategoryTitle.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    onTap: () {
                      Navigator.pop(context);
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
    );
  }
}
