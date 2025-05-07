import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/assesments/presentation/controllers/assessment_history_controller.dart';
import 'package:empowered/features/assesments/presentation/widgets/assesment_card.dart';

class AssessmentSummary extends StatelessWidget {
  const AssessmentSummary({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AssessmentHistoryController>();

    return Obx(() {
      if (controller.getAssessmentState.value == TheStates.loading) {
        return const LoadingWidget();
      }

      final model = controller.getAssessmentModel.value;
      if (model.data == null) {
        return const Center(child: Text('No assessments available'));
      }
      return RefreshIndicator(
        onRefresh: () async {
          controller.getAssessment();
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle('The Growth Assessments'),
              ...?model.data!.assessments?.growth?.map(
                (growth) => AssessmentCard(
                  title: growth.name ?? 'Untitled',
                  score: '${growth.currentScore ?? 0} / ${growth.totalScore}',
                  iconPath: growth.image ?? '',
                  id: growth.id.toString(),
                  onTap: () {},
                  status: growth.status ?? 'Start Now',
                  scoreHistory: growth.scoreHistory,
                  totalScore: growth.totalScore.toString(),
                  //  onTap: () => _handleAssessmentTap(growth),
                ),
              ),
              const SizedBox(height: 16),
              _buildSectionTitle('The Wealth Assessments'),
              ...?model.data!.assessments?.wealth?.map(
                (wealth) => AssessmentCard(
                  title: wealth.name ?? 'Untitled',
                  score: '${wealth.currentScore ?? 0} / ${wealth.totalScore}',
                  iconPath: wealth.image ?? '',
                  status: wealth.status ?? 'Start Now',
                  id: wealth.id.toString(),
                  scoreHistory: wealth.scoreHistory,
                  totalScore: wealth.totalScore.toString(),
                  onTap: () {},
                ),
              ),
              const BottomSpacing(),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
