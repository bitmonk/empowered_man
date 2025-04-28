import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/assesments/presentation/widgets/assesment_card.dart';

class AssessmentSummary extends StatelessWidget {
  const AssessmentSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical:16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('The Growth Assessments'),
          AssessmentCard(
            title: 'Power',
            score: '77/98',
            iconPath: Assets.images.assesmentPower.path,
            onTap: () {},
          ),
          AssessmentCard(
            title: 'Mindset',
            score: '77/98',
            iconPath: Assets.images.assesmentMindset.path,
            onTap: () {},
          ),
          AssessmentCard(
            title: 'Stress',
            score: '77/98',
            iconPath: Assets.images.assesmentStress.path,
            onTap: () {},
          ),
          const SizedBox(height: 16),
          _buildSectionTitle('The Wealth Assessments'),
          AssessmentCard(
            title: 'Production',
            score: '77/98',
            iconPath: Assets.images.assesmentProduction.path,
            onTap: () {},
          ),
          AssessmentCard(
            title: 'Profit',
            score: '77/98',
            iconPath: Assets.images.assesmentProfit.path,
            onTap: () {},
          ),
          AssessmentCard(
            title: 'Protection',
            score: '77/98',
            iconPath: Assets.images.assesmentProtection.path,
            onTap: () {},
          ),
          const BottomSpacing(),
        ],
      ),
    );
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
