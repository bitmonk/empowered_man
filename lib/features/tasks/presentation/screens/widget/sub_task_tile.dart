import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/group/presentation/screens/widgets/colored_padded_cotainer.dart';
import 'package:empowered/features/tasks/data/model/task_model.dart';
import 'package:empowered/features/tasks/presentation/controllers/tasks_controller.dart';
import 'package:empowered/features/tasks/presentation/screens/widget/priority_color.dart';

class SubTaskTile extends StatefulWidget {
  const SubTaskTile({required this.subtask, required this.mainTask, super.key});
  final Task mainTask;
  final Task subtask;
  @override
  State<SubTaskTile> createState() => _SubTaskTileState();
}

class _SubTaskTileState extends State<SubTaskTile> {
  final controller = Get.find<TasksController>();
  bool isSubTaskDone = false;
  final isCompleted = 'completed';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isSubTaskDone = widget.subtask.status == isCompleted;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.all(13),
        decoration: const BoxDecoration(
          color: AppColors.color223444,
          borderRadius: BorderRadius.all(Radius.circular(6)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.subtask.title ?? '',
                  style: AppTextStyles.textBodyB3,
                ),
                Assets.images.more.svg(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ColoredPaddedCotainer(
                  horizontalPadding: 8,
                  borderColor:
                      priorityColor(priority: widget.mainTask.priority ?? ''),
                  borderRadius: 5,
                  color: AppColors.bgBorder,
                  title: widget.mainTask.priority ?? '',
                  //font => inter
                  textStyle: AppTextStyles.lightBodySubHeader.copyWith(
                    color:
                        priorityColor(priority: widget.mainTask.priority ?? ''),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: controller.mmarkSubTaskCompletedState.value ==
                          TheStates.loading
                      ? const AppLoadingWidget.small(
                          size: 16,
                        )
                      : InkWell(
                          onTap: () async {
                            var res = await controller.markSubTaskCompleted(
                                taskId: widget.mainTask.id.toString(),
                                subTaskId: widget.subtask.id.toString(),);
                            if (res) {
                              setState(() {
                                isSubTaskDone = res;
                              });
                            }
                          },
                          child: isSubTaskDone
                              ? Assets.images.tickCircle.svg()
                              : Row(
                                  children: [
                                    const Icon(
                                      Icons.circle_outlined,
                                      color: AppColors.colorC1C9D1,
                                      size: 20,
                                    ),
                                    Text(
                                      ' Done',
                                      style: AppTextStyles.titleSm.copyWith(
                                        color: AppColors.colorC1C9D1,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ],
                                ),
                        ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
