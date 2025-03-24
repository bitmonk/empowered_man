import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/courses/courses_screen.dart';

class CourseModuleDetailScreen extends StatelessWidget {
  const CourseModuleDetailScreen({required this.module, super.key});
  final Module module;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const CustomAppBar(title: 'Courses'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildModuleProgress(),
              const VerticalSpacing(24),
              _buildVideoPlayer(),
              const VerticalSpacing(24),
              Text(module.title, style: AppTextStyles.textBodyB1),
              const VerticalSpacing(12),
              Text(
                videoDescription,
                style: AppTextStyles.textBodyB3.copyWith(height: 1.8),
              ),
              const VerticalSpacing(24),
              _buildCompleteButton(),
              const BottomSpacing(),
            ],
          ),
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
            "80% Complete - The Warrior's Way Videobook",
            style: AppTextStyles.textBodyB4
                .copyWith(color: AppColors.textColor100),
          ),
          const VerticalSpacing(12),
          LinearProgressIndicator(
            borderRadius: BorderRadius.circular(20),
            value: 0.6,
            minHeight: 8,
            backgroundColor: AppColors.textColor200,
            valueColor:
                const AlwaysStoppedAnimation<Color>(AppColors.primary500),
          ),
          const VerticalSpacing(12),
          Text(module.title, style: AppTextStyles.textHeadingH3),
        ],
      ),
    );
  }

  Widget _buildVideoPlayer() {
    return const AppVideoPlayer(
      videoUrl:
          'https://media.istockphoto.com/id/1465360965/video/group-of-people-learning-computer-programming.mp4?s=mp4-640x640-is&k=20&c=-B6Zbhm18GfPEA-WSOLwZn1B60NYjsnbaeaey6oLVMQ=',
    );
  }

  Widget _buildCompleteButton() {
    return AppOutlinedButton(
      safePadding: true,
      text: 'Mark as Completed',
      onPressed: () {},
    );
  }
}

const String videoDescription =
    "Let's return to design thinking. Over time designers have built up their own body of approaches to solving classes of problems. Let’s return to design thinking. Over time designers have built up their own body of approaches to solving classes of problems. Let’s return to design thinking. Over time designers have built up their own body of approaches to solving classes of problems.";
