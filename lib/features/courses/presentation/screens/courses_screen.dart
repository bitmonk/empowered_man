import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/courses/data/model/course_model.dart';
import 'package:empowered/features/courses/presentation/controllers/course_controller.dart';
import 'package:empowered/features/courses/presentation/screens/chapter_list_screen.dart';
import 'package:empowered/features/courses/presentation/screens/components/badge_wid.dart';

enum CourseStatus { completed, inProgress, notStarted }

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({super.key});

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  final controller = Get.find<CourseController>();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const CustomAppBar(
        title: 'Courses',
      ),
      body: Obx(() {
        final currentFilter = controller.selectedFilters.value.toLowerCase();
        final courses = controller.filteredCourses[currentFilter] ?? [];
        final error = controller.errorMessages[currentFilter];
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _buildSearchBar(),
              const VerticalSpacing(16),
              _buildFilterButtons(),
              const VerticalSpacing(16),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    await controller.getCourses(
                      tag: controller.selectedFilters.value.toLowerCase(),
                    );
                  },
                  child:
                      controller.filterStates[currentFilter]!.value.showWidget(
                    success: () => courses.isEmpty
                        ? const CustomErrorWidget(
                            error: 'No course found.',
                          )
                        : ListView.builder(
                            itemCount: courses.length,
                            itemBuilder: (context, index) {
                              return _buildCourseCard(courses[index]);
                            },
                          ),
                    error: () => CustomErrorWidget(
                      error: error,
                      onPressed: () {
                        controller.getCourses(
                          tag: controller.selectedFilters.value.toLowerCase(),
                        );
                      },
                    ),
                    orElse: () => const LoadingWidget(),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildSearchBar() {
    return AppTextFormField(
      labelText: 'Search...',
      prefixIcon: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Assets.images.search.svg(),
      ),
      onChanged: (v) {
        if (v.isNotEmpty) {
          controller.queryText.value = v;
          controller.getCourses();
        } else {
          controller.queryText.value = null;
          controller.fetchAllCourses();
        }
      },
      fillColor: AppColors.color132534,
      borderSide: const BorderSide(
        color: AppColors.color132534,
      ),
      enabledBorderSide: const BorderSide(
        color: AppColors.color132534,
      ),
    );
  }

  Widget _buildFilterButtons() {
    return Row(
      children: controller.filters.map((filter) {
        return GestureDetector(
          onTap: () {
            if (controller.selectedFilters.value != filter) {
              setState(() {
                controller.selectedFilters.value = filter;
                controller.getCourses();
              });
            }
          },
          child: Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: controller.selectedFilters.value == filter
                  ? AppColors.color65717C
                  : null,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white24),
            ),
            child: Text(
              filter,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildCourseCard(Course course) {
    return InkWell(
      onTap: () {
        controller.selectedCourse.value = course;
        Get.to(
          () => const ChapterListScreen(),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            _buildThumbnail(
              progress: course.completionPercentage ?? 0,
              thumbail: course.thumbnail,
            ),
            const HorizontalSpacing(16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course.title ?? '',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.textBodyB2.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  const VerticalSpacing(12),
                  StatusBadge(
                    status: course.status,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildThumbnail({required int progress, String? thumbail}) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 168,
          height: 111,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: AppCachedImage(
            imgUrl: thumbail ?? '',
            fit: BoxFit.cover,
            borderRadius: BorderRadius.circular(8),
            errorWid: const Icon(Icons.image_not_supported),
          ),
        ),
        Positioned(
          bottom: 4,
          left: 4,
          right: 4,
          child: Stack(
            children: [
              Container(
                height: 6,
                margin: const EdgeInsets.symmetric(horizontal: 8),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              LayoutBuilder(
                builder: (context, constraints) {
                  return Container(
                    height: 6,
                    width: (progress / 100) * constraints.maxWidth,
                    decoration: BoxDecoration(
                      color: AppColors.primary300,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        Positioned(
          right: 16,
          bottom: 18,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              color: AppColors.bgDark.withOpacity(0.5),
            ),
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
            child: Text(
              '$progress%',
              style: AppTextStyles.textBodyB1.copyWith(
                color: AppColors.primary300,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
