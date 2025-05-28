import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/group/presentation/screens/widgets/colored_padded_cotainer.dart';
import 'package:empowered/features/tasks/data/model/task_model.dart';
import 'package:empowered/features/tasks/presentation/controllers/tasks_controller.dart';
import 'package:empowered/features/tasks/presentation/screens/widget/priority_color.dart';
import 'package:empowered/features/tasks/presentation/screens/widget/sub_task_list.dart';
import 'package:empowered/features/tasks/presentation/screens/widget/task_menu_dialog.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:intl/intl.dart';

class TaskTile extends StatefulWidget {
  const TaskTile({required this.task, super.key});

  final Task task;

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool isTaskDone = false;
  bool isExpandedTaskTile = false;
  final controller = Get.find<TasksController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          isExpandedTaskTile = !isExpandedTaskTile;
          setState(() {});
        },
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              decoration: const BoxDecoration(
                color: AppColors.bgBorder,
                borderRadius: BorderRadius.all(Radius.circular(6)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Journal',
                          style: AppTextStyles.titleSm.copyWith(
                            color: AppColors.textColor200,
                            fontSize: 12,
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            // if (widget.task.status.toString().toLowerCase() ==
                            //     'completed') {
                            showDialog(
                              context: context,
                              builder: (context) => Transform.translate(
                                offset: const Offset(-60, 0),
                                child: TaskMenuDialog(
                                    task: widget.task,
                                    currentLevel: widget.task.level.toString(),
                                    completed: widget.task.status
                                            .toString()
                                            .toLowerCase() ==
                                        'completed',),
                              ),
                            );
                            // } else {
                            //   AppUtils.showErrorSnackbar(
                            //     message: 'Please complete task first.',
                            //   );
                            // }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Assets.images.more.svg(),
                          ),
                        ),
                      ],
                    ),
                    const VerticalSpacing(12),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text(
                        widget.task.title ?? '',
                        textAlign: TextAlign.start,
                        style: AppTextStyles.titleMd,
                      ),
                    ),
                    const VerticalSpacing(12),
                    Wrap(
                      spacing: 15, // horizontal spacing
                      runSpacing: 10, // vertical spacing
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        ColoredPaddedCotainer(
                          horizontalPadding: 8,
                          borderColor: AppColors.colorE6F4FF,
                          borderRadius: 5,
                          color: AppColors.bgBorder,
                          title: widget.task.dueDate == null
                              ? 'N/A'
                              : DateFormat('MMM dd')
                                  .format(widget.task.dueDate!),
                          textStyle: AppTextStyles.lightBodySubHeader,
                          //font => inter
                        ),
                        ColoredPaddedCotainer(
                          horizontalPadding: 8,
                          borderColor:
                              priorityColor(priority: widget.task.priority!),
                          borderRadius: 5,
                          color: AppColors.bgBorder,
                          title: widget.task.priority ?? '',
                          //font => inter
                          textStyle: AppTextStyles.lightBodySubHeader.copyWith(
                            color: priorityColor(
                              priority: widget.task.priority!,
                            ),
                          ),
                        ),

                        if (!isExpandedTaskTile &&
                            (widget.task.subTasks?.isNotEmpty ?? false))
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Assets.images.subTaskBranchIcon.svg(),
                              Padding(
                                padding: const EdgeInsets.all(5),
                                child: ColoredPaddedCotainer(
                                  horizontalPadding: 5,
                                  textStyle: AppTextStyles.titleSm
                                      .copyWith(fontSize: 12),
                                  title:
                                      widget.task.subTasks?.length.toString() ??
                                          '0',
                                  color: AppColors.primary500,
                                  borderColor: AppColors.primary500,
                                ),
                              ),
                            ],
                          ),
                        // else
                        if (controller.markingMainTaskIds
                            .contains(widget.task.id))
                          const AppLoadingWidget.small(
                            size: 16,
                          )
                        else
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: InkWell(
                              onTap: () {
                                if (widget.task.status == 'completed') {
                                  return;
                                }
                                controller.markMainTaskCompleted(
                                  taskId: widget.task.id.toString(),
                                );
                              },
                              child: widget.task.status == 'completed'
                                  ? Assets.images.tickCircle.svg()
                                  : Row(
                                      mainAxisSize: MainAxisSize.min,
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
                                            // fontFamily: Inter
                                          ),
                                        ),
                                      ],
                                    ),
                            ),
                          ),
                      ],
                    ),
                    if (isExpandedTaskTile)
                      Column(
                        children: [
                          if (widget.task.notes != null)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const VerticalSpacing(16),
                                const AppDivider(
                                  color: AppColors.bgBorderVLight,
                                ),
                                const VerticalSpacing(16),
                                const Text(
                                  'Notes',
                                  style: AppTextStyles.textBodyB1,
                                ),
                                const VerticalSpacing(12),
                                HtmlWidget(
                                  widget.task.notes ?? '',
                                  textStyle: const TextStyle(
                                    color: AppColors.textColor100,
                                  ),
                                ),
                              ],
                            ),
                          if (widget.task.subTasks != null)
                            SubTaskList(
                              subTaskList: widget.task.subTasks ?? [],
                              mainTask: widget.task,
                            ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 20,
              child: Container(
                height: 50,
                width: 4,
                decoration: BoxDecoration(
                  color: _priorityColor(widget.task.priority!),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _priorityColor(String val) {
    if (val == controller.prioritiesList[0]) {
      return AppColors.colorFFB032;
    } else if (val == controller.prioritiesList[1]) {
      return AppColors.appRed;
    } else if (val == controller.prioritiesList[2]) {
      return AppColors.appGreen;
    } else {
      return AppColors.primaryMedium;
    }
  }
}
