import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/courses/course_details_screen.dart';

class Course {
  Course({
    required this.title,
    required this.progress,
    required this.status,
    required this.modules,
  });
  final String title;
  final int progress;
  final CourseStatus status;
  final List<Module> modules;
}

class Module {
  Module({
    required this.title,
    required this.isCompleted,
  });

  final String title;
  bool isCompleted;
}

enum CourseStatus { completed, inProgress, notStarted }

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({super.key});

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  String selectedFilter = 'All';

  final List<Course> courses = [
    Course(
      title: 'The Warrior’s Way Videobook',
      progress: 100,
      status: CourseStatus.completed,
      modules: [
        Module(title: 'Chapter 1 - The Pit of Poverty', isCompleted: true),
        Module(title: 'Chapter 2 - The Peak of Prosperity', isCompleted: true),
        Module(title: 'Chapter 3 - Overcoming Fear', isCompleted: true),
        Module(title: 'Chapter 4 - Mastering Discipline', isCompleted: true),
      ],
    ),
    Course(
      title: 'Mastering Leadership Skills',
      progress: 60,
      status: CourseStatus.inProgress,
      modules: [
        Module(
          title: 'Module 1 - Fundamentals of Leadership',
          isCompleted: true,
        ),
        Module(title: 'Module 2 - Communication Mastery', isCompleted: true),
        Module(title: 'Module 3 - Conflict Resolution', isCompleted: false),
        Module(title: 'Module 4 - Leading by Example', isCompleted: false),
      ],
    ),
    Course(
      title: 'The Psychology of Success',
      progress: 0,
      status: CourseStatus.notStarted,
      modules: [
        Module(title: 'Lesson 1 - Mindset Matters', isCompleted: false),
        Module(
          title: 'Lesson 2 - Habits of High Achievers',
          isCompleted: false,
        ),
        Module(title: 'Lesson 3 - Overcoming Self-Doubt', isCompleted: false),
        Module(title: 'Lesson 4 - Taking Action', isCompleted: false),
      ],
    ),
    Course(
      title: 'Personal Finance & Wealth Building',
      progress: 100,
      status: CourseStatus.completed,
      modules: [
        Module(title: 'Unit 1 - Budgeting for Beginners', isCompleted: true),
        Module(title: 'Unit 2 - Smart Investing Strategies', isCompleted: true),
        Module(title: 'Unit 3 - Managing Debt Wisely', isCompleted: true),
        Module(title: 'Unit 4 - Planning for Retirement', isCompleted: true),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const CustomAppBar(
        title: 'Courses',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildSearchBar(),
            const VerticalSpacing(16),
            _buildFilterButtons(),
            const VerticalSpacing(16),
            Expanded(child: _buildCourseList()),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return AppTextFormField(
      labelText: 'Search...',
      prefixIcon: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Assets.images.search.svg(),
      ),
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
    final filters = ['All', 'Ongoing', 'Completed'];

    return Row(
      children: filters.map((filter) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedFilter = filter;
            });
          },
          child: Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: selectedFilter == filter ? AppColors.color65717C : null,
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

  Widget _buildCourseList() {
    final filteredCourses = selectedFilter == 'All'
        ? courses
        : courses.where((course) {
            if (selectedFilter == 'Ongoing') {
              return course.status == CourseStatus.inProgress;
            } else {
              return course.status == CourseStatus.completed;
            }
          }).toList();

    return ListView.builder(
      itemCount: filteredCourses.length,
      itemBuilder: (context, index) {
        return _buildCourseCard(filteredCourses[index]);
      },
    );
  }

  Widget _buildCourseCard(Course course) {
    return InkWell(
      onTap: () {
        Get.to(
          () => CourseDetailScreen(
            course: course,
          ),
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
            _buildThumbnail(course.progress),
            const HorizontalSpacing(16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course.title,
                    style: AppTextStyles.textBodyB2.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  const VerticalSpacing(12),
                  _buildStatusBadge(course.status),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildThumbnail(int progress) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 168,
          height: 111,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: Assets.images.courseThumbnail
                  .provider(), // Replace with actual image
              fit: BoxFit.cover,
            ),
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

  Widget _buildStatusBadge(CourseStatus status) {
    Color badgeColor;
    String statusText;
    switch (status) {
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
}
