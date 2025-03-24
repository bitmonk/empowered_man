import 'package:empowered/core/extension/extensions.dart';

class HomeJournalWidget extends StatelessWidget {
  const HomeJournalWidget({
    required this.image,
    required this.title,
    required this.decription,
    super.key,
  });
  final String image;
  final String title;
  final String decription;

  @override
  Widget build(BuildContext context) {
    return ThemedContainer(
      width: double.infinity,
      border: title == 'PM Journal'
          ? null
          : Border.all(
              color: AppColors.color008CFF,
            ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.textBodyB1,
          ),
          const VerticalSpacing(12),
          Row(
            children: [
              Image.asset(
                image,
                width: 26,
              ),
              const HorizontalSpacing(12),
              Expanded(
                child: Text(
                  decription,
                  style: AppTextStyles.textBodyB2,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
