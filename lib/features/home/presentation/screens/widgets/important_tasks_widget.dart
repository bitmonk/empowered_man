import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/home/presentation/controllers/home_controller.dart';
import 'package:empowered/features/home/presentation/screens/widgets/task_notes_dialog.dart';
import 'package:empowered/features/home/presentation/screens/widgets/task_status_widget.dart';

class ImportantTasksWidget extends StatefulWidget {
  const ImportantTasksWidget({super.key});

  @override
  _ImportantTasksWidgetState createState() => _ImportantTasksWidgetState();
}

class _ImportantTasksWidgetState extends State<ImportantTasksWidget> {
  final controller = Get.find<HomeController>();
  // List to track task completion status
  List<bool> isCompleted = List.generate(4, (index) => false);

  void toggleTaskStatus(int index) {
    setState(() {
      isCompleted[index] = !isCompleted[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ThemedContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Title
            const Text(
              "My Most Important Tasks (MIT's)",
              style: AppTextStyles.textBodyB1, // Replace with your style
            ),
            const SizedBox(height: 8),
            // Subtitle
            const Text(
              "You haven't set your mandatory mission",
              style: AppTextStyles.textBodyB3, // Replace with your style
            ),
            const SizedBox(height: 16),
            // Table for Header + Tasks
            controller.dailyMitListState.value.showWidget(
              loading: () => const LoadingWidget(),
              error: () => CustomErrorWidget(
                error: controller.dailyMitListError.value,
                onPressed: () {
                  controller.getMyMonthy();
                },
              ),
              success: () {
                final data = controller.dailyMitListData;
                return (data.isEmpty)
                    ? CustomErrorWidget(
                        error: 'No MIT added',
                        // verticlePadding: const EdgeInsets.symmetric(vertical: 200),
                        onPressed: () async {
                          AppWidgetKey.bottomBarController.jumpToTab(1);
                        },
                        buttonText: 'Add',
                      )
                    : Table(
                        // columnWidths: const {
                        //   0: FlexColumnWidth(5),
                        //   1: FlexColumnWidth(5),
                        //   2: FlexColumnWidth(5),
                        // },
                        children: [
                          // Header Row
                          const TableRow(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  'Task',
                                  style: AppTextStyles.textBodyB3,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  'Notes',
                                  style: AppTextStyles.textBodyB3,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  'Status',
                                  style: AppTextStyles.textBodyB3,
                                ),
                              ),
                            ],
                          ),
                          // Divider Row (Optional)
                          const TableRow(
                            children: [
                              Divider(color: AppColors.color132534),
                              Divider(color: AppColors.color132534),
                              Divider(color: AppColors.color132534),
                            ],
                          ),
                          // Tasks Rows

                          ...data.map(
                            (e) => TableRow(
                              children: [
                                // Task Title
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: Row(
                                    children: [
                                      // GestureDetector(
                                      //   onTap: () => toggleTaskStatus(index),
                                      //   child: isCompleted[index]
                                      //       ? Assets.images.tickCircle.svg()
                                      //       : Assets.images.emptyCirlce.svg(),
                                      // ),
                                      const HorizontalSpacing(2),
                                      Text(
                                        e.title ?? '',
                                        style: AppTextStyles.textBodyB4,
                                      ),
                                    ],
                                  ),
                                ),

                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: GestureDetector(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return TaskNotesDialog(
                                            task: e,
                                          );
                                        },
                                      );
                                    },
                                    child: const Text(
                                      'View Notes',
                                      style: TextStyle(
                                        fontSize: 12,
                                        decoration: TextDecoration.underline,
                                        decorationColor: AppColors.primary500,
                                        color: AppColors.primary500,
                                      ),
                                    ),
                                  ),
                                ),
                                // Status
                                TaskStatusWidget(
                                  isAchievedInitially:
                                      e.completionStatus == 'Achieved',
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
