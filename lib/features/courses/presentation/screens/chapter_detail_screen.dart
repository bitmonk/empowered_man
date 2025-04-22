import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/core/extension/string_extension.dart';
import 'package:empowered/features/courses/data/model/chapter_model.dart';
import 'package:empowered/features/courses/presentation/controllers/course_controller.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class ChapterDetailScreen extends StatefulWidget {
  const ChapterDetailScreen({
    required this.chapter,
    required this.chapterIndex,
    required this.courseID,
    super.key,
  });
  final Chapter chapter;
  final int chapterIndex;
  final String courseID;

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
                      widget.chapter.title ?? '',
                      style: AppTextStyles.textBodyB1,
                    ),
                    const VerticalSpacing(12),
                    HtmlWidget(
                      widget.chapter.description ?? '-',
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
            '${controller.selectedCourse.value!.completionPercentage}% Complete - ${controller.selectedCourse.value!.title}',
            style: AppTextStyles.textBodyB4
                .copyWith(color: AppColors.textColor100),
          ),
          const VerticalSpacing(12),
          if (widget.chapter.videoUrl != null)
            LinearProgressIndicator(
              borderRadius: BorderRadius.circular(20),
              value: widget.chapter.status == 'completed'
                  ? 1.0
                  : _videoCompleteValue,
              minHeight: 8,
              backgroundColor: AppColors.textColor200,
              valueColor:
                  const AlwaysStoppedAnimation<Color>(AppColors.primary500),
            ),
          if (widget.chapter.videoUrl != null) const VerticalSpacing(12),
          Text(
            'Chapter ${widget.chapterIndex + 1} - ${widget.chapter.title}',
            style: AppTextStyles.textHeadingH3,
          ),
        ],
      ),
    );
  }

  Widget _buildVideoPlayer() {
    return widget.chapter.videoUrl.isNullOrEmpty()
        ? const SizedBox.shrink()
        : AppVideoPlayer(
            videoUrl: widget.chapter.videoUrl!,
            showListener: true,
            onProgressUpdate: (v) {
              setState(() {
                _videoCompleteValue = v;
              });
            },
          );
  }

  Widget _buildCompleteButton() {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: AppOutlinedButton(
          text: widget.chapter.status != 'completed'
              ? 'Mark as Completed'
              : 'Completed',
          backgroundColor: widget.chapter.status == 'completed'
              ? AppColors.appGreen
              : AppColors.dividerGrey,
          progress:
              widget.chapter.status == 'completed' ? null : _videoCompleteValue,
          isLoading:
              controller.markChapterCompletedState.value == TheStates.loading,
          onPressed: () {
            if (widget.chapter.status != 'completed' &&
                _videoCompleteValue > 0.9) {
              controller.markChapterCompleted(
                courseId: widget.courseID,
                chapterId: widget.chapter.id.toString(),
              );
            } else {
              AppUtils.showErrorSnackbar(message: 'Please watch full video');
            }
          },
        ),
      ),
    );
  }
}
