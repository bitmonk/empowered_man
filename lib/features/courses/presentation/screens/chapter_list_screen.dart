import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/courses/presentation/controllers/course_controller.dart';
import 'package:empowered/features/courses/presentation/screens/chapter_detail_screen.dart';
import 'package:empowered/features/courses/presentation/screens/components/badge_wid.dart';

class ChapterListScreen extends StatefulWidget {
  const ChapterListScreen({super.key});

  @override
  State<ChapterListScreen> createState() => _ChapterListScreenState();
}

class _ChapterListScreenState extends State<ChapterListScreen> {
  final controller = Get.find<CourseController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _refresh();
  }

  void _refresh() {
    controller.getChapters();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const CustomAppBar(title: 'Modules'),
      body: Obx(
        () => RefreshIndicator(
          onRefresh: () async {
            _refresh();
          },
          child: controller.getChapterState.value.showWidget(
            orElse: () => const LoadingWidget(),
            error: () => CustomErrorWidget(
              onPressed: _refresh,
            ),
            success: () {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const VerticalSpacing(12),
                    _buildChapterHeader(),
                    const SizedBox(height: 24),
                    const Text(
                      'Chapters',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildChapterList(),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildChapterHeader() {
    final chapterData = controller.chapterData.value;
    return ThemedContainer(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: AppCachedImage(
                  imgUrl: chapterData.thumbnail ?? '',
                  width: double.infinity,
                  height: 180,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 12,
                left: 16,
                right: 16,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          color: AppColors.bgDark.withOpacity(0.5),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 6,
                          horizontal: 12,
                        ),
                        child: Text(
                          '${chapterData.completionPercentage}%',
                          style: AppTextStyles.textBodyB1.copyWith(
                            color: AppColors.primary300,
                          ),
                        ),
                      ),
                    ),
                    const VerticalSpacing(8),
                    LinearProgressIndicator(
                      borderRadius: BorderRadius.circular(20),
                      minHeight: 6,
                      value: chapterData.completionPercentage! / 100,
                      backgroundColor: Colors.white24,
                      color: AppColors.primary300,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const VerticalSpacing(16),
          Text(
            chapterData.title ?? '',
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColors.textColor50,
            ),
          ),
          const VerticalSpacing(16),
          StatusBadge(
            status: chapterData.status,
          ),
        ],
      ),
    );
  }

  Widget _buildChapterList() {
    return controller.chapterData.value.chapters?.isEmpty ?? true
        ? const SizedBox.shrink()
        : ListView.builder(
            itemCount: controller.chapterData.value.chapters?.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final chapter = controller.chapterData.value.chapters?[index];
              return ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: chapter!.status.toString() == 'completed'
                        ? AppColors.primary500
                        : null, // Background color
                    border: Border.all(color: AppColors.primary500),
                  ),
                  child: chapter.status != 'completed'
                      ? const SizedBox(
                          height: 16,
                          width: 16,
                        )
                      : const Icon(
                          Icons.check,
                          color: Colors.white, // Tick color
                          size: 16,
                        ),
                ),
                title: Text(
                  chapter.title ?? '',
                  style: const TextStyle(
                    color: AppColors.textColor200,
                    fontSize: 16,
                  ),
                ),
                onTap: () {
                  if (index == 0 ||
                      controller
                              .chapterData.value.chapters![index - 1].status ==
                          'completed' ||
                      chapter.status == 'completed') {
                    if (index == 0) {
                      controller.changeCourseStatus(
                        chapterId: chapter.id.toString(),
                        moduleId: controller.selectedModule.value.id.toString(),
                      );
                    }
                    controller.selectedChapter.value = chapter;
                    Get.to(
                      () => ChapterDetailScreen(
                          chapterIndex: index,
                          pop: index ==
                              (controller.chapterData.value.chapters!.length -
                                  1),),
                    );
                  } else {
                    AppUtils.showErrorSnackbar(
                      message: 'Please complete previous chapters',
                    );
                  }
                },
              );
            },
          );
  }
}
