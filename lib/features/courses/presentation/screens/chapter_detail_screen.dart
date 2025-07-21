import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/core/extension/string_extension.dart';
import 'package:empowered/features/courses/presentation/controllers/course_controller.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class ChapterDetailScreen extends StatefulWidget {
  const ChapterDetailScreen(
      {required this.chapterIndex, super.key, this.pop = false,});
  final int chapterIndex;
  final bool pop;
  @override
  State<ChapterDetailScreen> createState() => _ChapterDetailScreenState();
}

class _ChapterDetailScreenState extends State<ChapterDetailScreen> {
  final controller = Get.find<CourseController>();
  double _videoCompleteValue = 0;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const CustomAppBar(title: 'Courses'),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildModuleProgress(),
                    const VerticalSpacing(24),
                    _buildVideoPlayer(),
                    const VerticalSpacing(24),
                    Text(
                      controller.selectedChapter.value?.title ?? '',
                      style: AppTextStyles.textBodyB1,
                    ),
                    const VerticalSpacing(12),
                    HtmlWidget(
                      controller.selectedChapter.value?.description ?? '-',
                      textStyle: AppTextStyles.textBodyB3.copyWith(height: 1.8),
                    ),
                    const VerticalSpacing(24),
                    const BottomSpacing(),
                  ],
                ),
              ),
            ),
            _buildCompleteButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildModuleProgress() {
    return ThemedContainer(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${controller.selectedModule.value.completionPercentage!}% Complete - ${controller.selectedModule.value.title}',
            style: AppTextStyles.textBodyB4
                .copyWith(color: AppColors.textColor100),
          ),
          const VerticalSpacing(12),
          LinearProgressIndicator(
            borderRadius: BorderRadius.circular(20),
            value: (controller.selectedModule.value.completionPercentage ?? 0) /
                100,
            minHeight: 8,
            backgroundColor: AppColors.textColor200,
            valueColor:
                const AlwaysStoppedAnimation<Color>(AppColors.primary500),
          ),
          const VerticalSpacing(12),
          Text(
            'Chapter ${widget.chapterIndex + 1} - ${controller.selectedChapter.value?.title}',
            style: AppTextStyles.textHeadingH3,
          ),
        ],
      ),
    );
  }

  Widget _buildVideoPlayer() {
    return controller.selectedChapter.value!.videoUrl.isNullOrEmpty()
        ? const SizedBox.shrink()
        : SizedBox(
            height: 200,
            child: AppVideoPlayer(
              videoUrl: controller.selectedChapter.value?.videoUrl,
              showListener: true,
              onProgressUpdate: (v) {
                setState(() {
                  _videoCompleteValue = v;
                });
              },
            ),
          );
  }

  Widget _buildCompleteButton() {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: AppOutlinedButton(
          text: controller.selectedChapter.value?.status != 'completed'
              ? 'Mark as Completed'
              : 'Completed',
          backgroundColor:
              controller.selectedChapter.value?.status == 'completed'
                  ? AppColors.appGreen
                  : (controller.selectedChapter.value?.status != 'completed' &&
                          controller.selectedChapter.value?.videoUrl == null)
                      ? AppColors.primary500
                      : AppColors.dividerGrey,
          progress: controller.selectedChapter.value?.status == 'completed'
              ? null
              : _videoCompleteValue,
          isLoading:
              controller.markChapterCompletedState.value == TheStates.loading,
          onPressed: () {
            if (controller.selectedChapter.value?.status != 'completed') {
              if (_videoCompleteValue > 0.9 &&
                  controller.selectedChapter.value?.videoUrl != null) {
                controller.markChapterCompleted(
                  moduleId: controller.selectedModule.value.id.toString(),
                  chapterId: controller.selectedChapter.value!.id.toString(),
                );
              } else if (controller.selectedChapter.value?.videoUrl == null) {
                controller.markChapterCompleted(
                  moduleId: controller.selectedModule.value.id.toString(),
                  chapterId: controller.selectedChapter.value!.id.toString(),
                );
              } else {
                AppUtils.showErrorSnackbar(message: 'Please watch full video');
              }
              if (widget.pop) {
                Get.close(2);
              }
            }
          },
        ),
      ),
    );
  }
}
