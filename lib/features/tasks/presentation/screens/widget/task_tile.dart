import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/group/presentation/screens/widgets/colored_padded_cotainer.dart';
import 'package:empowered/features/tasks/presentation/controllers/tasks_controller.dart';
import 'package:empowered/features/tasks/presentation/screens/widget/sub_task_list.dart';
import 'package:empowered/features/tasks/presentation/screens/widget/task_menu_dialog.dart';

class TaskTile extends StatefulWidget {
  const TaskTile({required this.showNote, super.key});
  final bool showNote;

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool isTaskDone = false;
  bool isExpandedTaskTile = false;
  final controller = Get.find<TasksController>();
  @override
  Widget build(BuildContext context) {
    return InkWell(
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
                          showDialog(
                            context: context,
                            builder: (context) => Transform.translate(
                                offset: const Offset(-60, 0),
                                child: const TaskMenuDialog(),),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Assets.images.more.svg(),
                        ),
                      ),
                    ],
                  ),
                  const VerticalSpacing(12),
                  const Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Text(
                      'Plan convo sith CS Team Task 123',
                      textAlign: TextAlign.start,
                      style: AppTextStyles.titleMd,
                    ),
                  ),
                  const VerticalSpacing(12),
                  Row(
                    children: [
                      const ColoredPaddedCotainer(
                        horizontalPadding: 8,
                        borderColor: AppColors.colorE6F4FF,
                        borderRadius: 5,
                        color: AppColors.bgBorder,
                        title: 'Dec 29',
                        textStyle: AppTextStyles.lightBodySubHeader,
                        //font => inter
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        child: !isExpandedTaskTile || widget.showNote
                            ? ColoredPaddedCotainer(
                                horizontalPadding: 8,
                                borderColor: AppColors.appYellow,
                                borderRadius: 5,
                                color: AppColors.bgBorder,
                                title: 'Do',
                                //font => inter
                                textStyle:
                                    AppTextStyles.lightBodySubHeader.copyWith(
                                  color: AppColors.appYellow,
                                ),
                              )
                            : ColoredPaddedCotainer(
                                horizontalPadding: 8,
                                borderColor: AppColors.appRed,
                                borderRadius: 5,
                                color: AppColors.bgBorder,
                                title: 'Hit',
                                //font => inter
                                textStyle:
                                    AppTextStyles.lightBodySubHeader.copyWith(
                                  color: AppColors.appRed,
                                ),
                              ),
                      ),
                      const Spacer(),
                      if (isExpandedTaskTile)
                        Row(
                          children: [
                            Assets.images.subTaskBranchIcon.svg(),
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: ColoredPaddedCotainer(
                                horizontalPadding: 5,
                                textStyle: AppTextStyles.titleSm
                                    .copyWith(fontSize: 12),
                                title: '3',
                                color: AppColors.primary500,
                                borderColor: AppColors.primary500,
                              ),
                            ),
                          ],
                        )
                      else
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: InkWell(
                            onTap: () {
                              isTaskDone = !isTaskDone;
                              setState(() {});
                            },
                            child: isTaskDone
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
                    if (widget.showNote)
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          VerticalSpacing(16),
                          AppDivider(
                            color: AppColors.bgBorderVLight,
                          ),
                          VerticalSpacing(16),
                          Text(
                            'Notes',
                            style: AppTextStyles.textBodyB1,
                          ),
                          VerticalSpacing(12),
                          Text(
                            'The content here is not meant to convey any specific information but to illustrate how text will appear in the final design. Please note that this text will be replaced with the approved content at the final stage.',
                            style: TextStyle(
                              color: AppColors.textColor100,
                            ),
                          ),
                        ],
                      )
                    else
                      const SubTaskList(),
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
                color: AppColors.colorFFB032,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
