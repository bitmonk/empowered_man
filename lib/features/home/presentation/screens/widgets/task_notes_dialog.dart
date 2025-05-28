import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/home/data/model/daily_mit_list_model.dart';
import 'package:empowered/features/home/presentation/controllers/home_controller.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class TaskNotesDialog extends StatefulWidget {
  const TaskNotesDialog({required this.task, super.key});
  final DailyMIT task;

  @override
  _TaskNotesDialogState createState() => _TaskNotesDialogState();
}

class _TaskNotesDialogState extends State<TaskNotesDialog> {
  final controller = Get.find<HomeController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.mitTaskNote(id: widget.task.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Obx(
        () {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.color132534,
            ),
            padding: const EdgeInsets.all(24),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.task.title ?? '',
                    style: AppTextStyles.textHeadingH3,
                  ),
                  const VerticalSpacing(16),
                  const AppDivider(
                    color: AppColors.bgBorderVLight,
                  ),
                  const VerticalSpacing(12),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Notes',
                      style: AppTextStyles.textBodyB1,
                    ),
                  ),
                  const VerticalSpacing(12),
                  controller.mitTaskNoteState.value.showWidget(
                    loading: () => const LoadingWidget(),
                    error: () {
                      return CustomErrorWidget(
                        error: controller.mitTaskNoteError.value,
                        onPressed: () {
                          controller.mitTaskNote(
                            id: widget.task.id.toString(),
                          );
                        },
                      );
                    },
                    success: () => (controller.mitTaskNoteData.value != null)
                        ? Column(
                            children: [
                              HtmlWidget(
                                controller.mitTaskNoteData.value!,
                                textStyle: AppTextStyles.textSmallS2,
                              ),
                              const VerticalSpacing(32),
                              AppOutlinedButton(
                                text: 'Go To Task',
                                width: 200,
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  AppWidgetKey.bottomBarController.jumpToTab(1);
                                },
                              ),
                            ],
                          )
                        : CustomErrorWidget(
                            error: controller.mitTaskNoteError.value,
                            onPressed: () {
                              controller.mitTaskNote(
                                id: widget.task.id.toString(),
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
