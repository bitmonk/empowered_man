import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/tasks/presentation/controllers/tasks_controller.dart';
import 'package:empowered/features/tasks/presentation/screens/widget/hit_list.dart';
import 'package:empowered/features/tasks/presentation/screens/widget/tasks_expansion_tile.dart';
import 'package:empowered/gen/assets.gen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TasksScreen extends GetView<TasksController> {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Obx(
            () => Column(
              children: [
                const VerticalSpacing(16),
                const DrawerHeaderWithBack(title: 'Tasks'),
                const VerticalSpacing(32),
                AppTextFormField(
                  controller: controller.searchTextController,
                  enabledBorderSide:
                      const BorderSide(color: AppColors.bgMedium),
                  borderSide: const BorderSide(color: AppColors.bgMedium),
                  fillColor: AppColors.bgMedium,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Assets.images.search.svg(height: 22, width: 22),
                  ),
                  hintText: 'Search...',
                  hintStyle: AppTextStyles.textCaptionC2,
                ),
                const VerticalSpacing(26),
                SizedBox(
                  height: 66.h,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        customBorder: const CircleBorder(),
                        onTap: () {
                          if (controller.selectedDaysindex.value > 0) {
                            controller.selectedDaysindex.value--;
                          }
                        },
                        child: Assets.images.arrowBack.svg(
                          width: 35,
                          height: 35,
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                            controller.daysList.length,
                            (index) {
                              var selectedDaysIndex =
                                  controller.selectedDaysindex.value == index;
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  onTap: () {
                                    controller.selectedDaysindex.value = index;
                                  },
                                  child: Column(
                                    children: [
                                      Text(
                                        controller.daysList[index].title,
                                        style: AppTextStyles.titleMd.copyWith(
                                          color: selectedDaysIndex
                                              ? AppColors.primary500
                                              : AppColors.textColor100,
                                        ),
                                      ),
                                      Text(
                                        controller.daysList[index].date,
                                        style: AppTextStyles.textCaptionC2
                                            .copyWith(
                                          color: selectedDaysIndex
                                              ? AppColors.primary500
                                              : AppColors.textColor100,
                                        ),
                                      ),
                                      if (index == 0)
                                        Assets.images.tickCircle.svg(),
                                      if (index == 1)
                                        Text(
                                          '2/3',
                                          style: AppTextStyles.textCaptionC2
                                              .copyWith(
                                            color: const Color(0xFF959EA6),
                                          ),
                                        ),
                                      if (selectedDaysIndex)
                                        Container(
                                          width: 5,
                                          height: 5,
                                          decoration: BoxDecoration(
                                            color: AppColors.primary500,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        customBorder: const CircleBorder(),
                        onTap: () {
                          if (controller.selectedDaysindex.value <
                              controller.daysList.length - 1) {
                            controller.selectedDaysindex.value++;
                          }
                        },
                        child: Assets.images.arrowForward.svg(
                          width: 35,
                          height: 35,
                        ),
                      ),
                    ],
                  ),
                ),
                const VerticalSpacing(10),
                Expanded(
                  child: ListView(
                    children: [
                      TasksExpansionTile(
                        title: 'Hit List',
                        description: '',
                        taskPortion: 10,
                        isCompleted: false,
                        isDone: true,
                        onTap: () {
                          controller.isExpandedHitList.value =
                              !controller.isExpandedHitList.value;
                        },
                      ),
                      if (controller.isExpandedHitList.value) const HitList(),
                      TasksExpansionTile(
                        title: 'Mit List',
                        description: '',
                        taskPortion: 12,
                        isCompleted: false,
                        isDone: true,
                        onTap: () {
                          controller.isExpandedMitList.value =
                              !controller.isExpandedMitList.value;
                        },
                      ),
                      if (controller.isExpandedMitList.value) const HitList(),
                      TasksExpansionTile(
                        title: 'Do List',
                        description: '',
                        taskPortion: 16,
                        isCompleted: false,
                        isDone: true,
                        taskCompletionPoint: 12,
                        onTap: () {
                          controller.isExpandedDoList.value =
                              !controller.isExpandedDoList.value;
                        },
                      ),
                      if (controller.isExpandedDoList.value) const HitList(),
                      TasksExpansionTile(
                        title: 'Achieved List',
                        description: '',
                        taskPortion: 12,
                        isCompleted: true,
                        isDone: true,
                        taskCompletionPoint: 12,
                        collapseBorderSideColor: AppColors.color2AD674,
                        onTap: () {
                          controller.isExpandedAchievedList.value =
                              !controller.isExpandedAchievedList.value;
                        },
                      ),
                      if (controller.isExpandedAchievedList.value)
                        const HitList(),
                      TasksExpansionTile(
                        title: 'Done List',
                        description: '',
                        taskPortion: 12,
                        isCompleted: true,
                        isDone: true,
                        taskCompletionPoint: 12,
                        collapseBorderSideColor: AppColors.color2AD674,
                        onTap: () {
                          controller.isExpandedDoneList.value =
                              !controller.isExpandedDoneList.value;
                        },
                      ),
                      if (controller.isExpandedDoneList.value) const HitList(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
