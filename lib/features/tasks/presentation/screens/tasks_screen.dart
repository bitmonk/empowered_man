import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/tasks/presentation/controllers/tasks_controller.dart';
import 'package:empowered/features/tasks/presentation/screens/widget/task_list.dart';
import 'package:empowered/features/tasks/presentation/screens/widget/tasks_expansion_tile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  final controller = Get.find<TasksController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initFunc();
  }

  void _initFunc() {
    controller
      ..getTaskEnums()
      ..getTask();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: SafeArea(
        bottom: false,
        child: Obx(
          () => Column(
            children: [
              const VerticalSpacing(16),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: DrawerHeaderWithBack(title: 'Tasks'),
              ),
              const VerticalSpacing(32),
              _searchField(),
              const VerticalSpacing(26),
              _weekListWidget(),
              const VerticalSpacing(10),
              controller.getTaskState.value.showWidget(
                orElse: () => const LoadingWidget(),
                error: () => CustomErrorWidget(
                  error: controller.getTaskError.value,
                  onPressed: () {
                    controller.getTask();
                  },
                ),
                success: () => Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      controller.resetValue();
                      _initFunc();
                    },
                    child: ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 16)
                          .copyWith(bottom: 120),
                      children: [
                        TasksExpansionTile(
                          title: 'Hit List',
                          description: '',
                          taskPortion: controller.hitData.value?.tasks?.length
                                  .toString() ??
                              '0',
                          isCompleted: false,
                          isDone: true,
                          onTap: () {
                            controller.isExpandedHitList.value =
                                !controller.isExpandedHitList.value;
                          },
                        ),
                        if (controller.isExpandedHitList.value)
                          TaskList(list: controller.hitData.value?.tasks),
                        TasksExpansionTile(
                          title: 'Mit List',
                          description: '',
                          taskPortion:
                              '${controller.mitData.value?.tasks?.length ?? 0}/4',
                          totalTask: 4,
                          isCompleted: false,
                          isDone: true,
                          onTap: () {
                            controller.isExpandedMitList.value =
                                !controller.isExpandedMitList.value;
                          },
                        ),
                        if (controller.isExpandedMitList.value)
                          TaskList(list: controller.mitData.value?.tasks),
                        TasksExpansionTile(
                          title: 'Do List',
                          description: '',
                          taskPortion: controller.doData.value?.tasks?.length
                                  .toString() ??
                              '0',
                          isCompleted: false,
                          isDone: true,
                          taskCompletionPoint: 12,
                          onTap: () {
                            controller.isExpandedDoList.value =
                                !controller.isExpandedDoList.value;
                          },
                        ),
                        if (controller.isExpandedDoList.value)
                          TaskList(list: controller.doData.value?.tasks),
                        TasksExpansionTile(
                          title: 'Achieved List',
                          description: '',
                          totalTask: 20,
                          taskPortion: controller
                                  .achievedData.value?.tasks?.length
                                  .toString() ??
                              '0',
                          isCompleted: true,
                          isDone: true,
                          taskCompletionPoint:
                              controller.achievedData.value?.tasks?.length,
                          collapseBorderSideColor: AppColors.color2AD674,
                          onTap: () {
                            controller.isExpandedAchievedList.value =
                                !controller.isExpandedAchievedList.value;
                          },
                        ),
                        if (controller.isExpandedAchievedList.value)
                          TaskList(
                            list: controller.achievedData.value?.tasks,
                          ),
                        TasksExpansionTile(
                          title: 'Done List',
                          description: '',
                          taskPortion: controller.doneData.value?.tasks?.length
                                  .toString() ??
                              '0',
                          isCompleted: true,
                          isDone: true,
                          taskCompletionPoint:
                              controller.doneData.value?.tasks?.length,
                          collapseBorderSideColor: AppColors.color2AD674,
                          onTap: () {
                            controller.isExpandedDoneList.value =
                                !controller.isExpandedDoneList.value;
                          },
                        ),
                        if (controller.isExpandedDoneList.value)
                          TaskList(list: controller.doneData.value?.tasks),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _searchField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: AppTextFormField(
        controller: controller.searchTextController,
        enabledBorderSide: const BorderSide(color: AppColors.bgMedium),
        borderSide: const BorderSide(color: AppColors.bgMedium),
        fillColor: AppColors.bgMedium,
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Assets.images.search.svg(height: 22, width: 22),
        ),
        hintText: 'Search...',
        hintStyle: AppTextStyles.textCaptionC2,
      ),
    );
  }

  Widget _weekListWidget() {
    return SizedBox(
      height: 66.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            splashColor: Colors.transparent,
            customBorder: const CircleBorder(),
            onTap: () {
              // if (controller.selectedDaysindex.value > 0) {
              //   controller.selectedDaysindex.value--;
              // }
              controller.changeWeek(-1);
            },
            child: Assets.images.arrowBack.svg(
              width: 35,
              height: 35,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...controller.daysList.map(
                  (index) {
                    var selectedDaysIndex = controller.selectedDate.value;
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        onTap: () {
                          controller.selectedDate.value = index.date;
                          controller.getTask();
                        },
                        child: Column(
                          children: [
                            Text(
                              index.title,
                              style: AppTextStyles.titleMd.copyWith(
                                color: isToday(
                                  selectedDaysIndex,
                                  date2: index.date,
                                )
                                    ? AppColors.primary500
                                    : AppColors.textColor100,
                              ),
                            ),
                            Text(
                              index.date.day.toString(),
                              style: AppTextStyles.textCaptionC2.copyWith(
                                color: isToday(
                                  selectedDaysIndex,
                                  date2: index.date,
                                )
                                    ? AppColors.primary500
                                    : AppColors.textColor100,
                              ),
                            ),

                            if (isToday(index.date))
                              Assets.images.tickCircle.svg(),
                            // if (index == 1)
                            //   Text(
                            //     '2/3',
                            //     style: AppTextStyles.textCaptionC2.copyWith(
                            //       color: const Color(0xFF959EA6),
                            //     ),
                            //   ),
                            if (isToday(selectedDaysIndex, date2: index.date))
                              Container(
                                width: 5,
                                height: 5,
                                decoration: BoxDecoration(
                                  color: AppColors.primary500,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          InkWell(
            splashColor: Colors.transparent,
            customBorder: const CircleBorder(),
            onTap: () {
              // if (controller.selectedDaysindex.value <
              //     controller.daysList.length - 1) {
              //   controller.selectedDaysindex.value++;
              // }
              controller.changeWeek(1);
            },
            child: Assets.images.arrowForward.svg(
              width: 35,
              height: 35,
            ),
          ),
        ],
      ),
    );
  }

  bool isToday(DateTime date, {DateTime? date2}) {
    final now = date2 ?? DateTime.now();
    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }
}
