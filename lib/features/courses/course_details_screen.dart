import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/courses/course_module_video_screen.dart';
import 'package:empowered/features/courses/courses_screen.dart';

class CourseDetailScreen extends StatelessWidget {
  const CourseDetailScreen({required this.course, super.key});
  final Course course;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const CustomAppBar(title: 'Courses'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const VerticalSpacing(12),
            _buildCourseHeader(),
            const SizedBox(height: 24),
            const Text(
              'Modules',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Expanded(child: _buildModulesList()),
          ],
        ),
      ),
    );
  }

  Widget _buildCourseHeader() {
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
                child: Image.asset(
                  Assets.images.courseThumbnail.path,
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
                          '${course.progress}%',
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
                      value: course.progress / 100,
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
            course.title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColors.textColor50,
            ),
          ),
          const VerticalSpacing(16),
          _buildStatusBadge(),
        ],
      ),
    );
  }

  Widget _buildStatusBadge() {
    Color badgeColor;
    String statusText;
    switch (course.status) {
      case CourseStatus.completed:
        badgeColor = AppColors.color2AD674;
        statusText = 'Completed';
      case CourseStatus.inProgress:
        badgeColor = AppColors.colorF2994A;
        statusText = 'In Progress';
      case CourseStatus.notStarted:
        badgeColor = AppColors.colorF64E51;
        statusText = 'Not Started';
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(
          color: badgeColor,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        statusText,
        style: TextStyle(
          color: badgeColor,
        ),
      ),
    );
  }

  Widget _buildModulesList() {
    return ListView.builder(
      itemCount: course.modules.length,
      itemBuilder: (context, index) {
        final module = course.modules[index];

        return ListTile(
          leading: Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: module.isCompleted
                  ? AppColors.primary500
                  : null, // Background color
              border: Border.all(color: AppColors.primary500),
            ),
            child: !module.isCompleted
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
            module.title,
            style: const TextStyle(
              color: AppColors.textColor200,
              fontSize: 16,
            ),
          ),
          onTap: () {
            Get.to(() => CourseModuleDetailScreen(module: module));
          },
        );
      },
    );
  }
}
