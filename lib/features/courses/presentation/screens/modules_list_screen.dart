import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/courses/presentation/controllers/course_controller.dart';
import 'package:empowered/features/courses/presentation/screens/chapter_list_screen.dart';
import 'package:empowered/features/courses/presentation/screens/components/badge_wid.dart';

class ModulesListScreen extends StatefulWidget {
  const ModulesListScreen({super.key});

  @override
  State<ModulesListScreen> createState() => _ModulesListScreenState();
}

class _ModulesListScreenState extends State<ModulesListScreen> {
  final controller = Get.find<CourseController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _refresh();
  }

  void _refresh() {
    controller.getModules();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const CustomAppBar(title: 'Courses'),
      body: Obx(
        () => RefreshIndicator(
          onRefresh: () async {
            _refresh();
          },
          child: controller.moduleState.value.showWidget(
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
                    _buildModuleHeader(),
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
                    _buildModulesList(),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildModuleHeader() {
    final moduleData = controller.moduleData.value.course!;
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
                  imgUrl: moduleData.thumbnail ?? '',
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
                          '${moduleData.completionPercentage}%',
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
                      value: moduleData.completionPercentage! / 100,
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
            moduleData.title ?? '',
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColors.textColor50,
            ),
          ),
          const VerticalSpacing(16),
          StatusBadge(
            status: moduleData.status,
          ),
        ],
      ),
    );
  }

  Widget _buildModulesList() {
    return controller.moduleData.value.modules?.isEmpty ?? true
        ? const SizedBox.shrink()
        : ListView.builder(
            itemCount: controller.moduleData.value.modules!.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final modules = controller.moduleData.value.modules![index];
              return ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: modules.status == 'completed'
                        ? AppColors.primary500
                        : null, // Background color
                    border: Border.all(color: AppColors.primary500),
                  ),
                  child: modules.status != 'completed'
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
                  modules.title ?? '',
                  style: const TextStyle(
                    color: AppColors.textColor200,
                    fontSize: 16,
                  ),
                ),
                onTap: () {
                  controller.selectedModule.value = modules;
                  Get.to(
                    () => const ChapterListScreen(),
                  );
                },
              );
            },
          );
  }
}
