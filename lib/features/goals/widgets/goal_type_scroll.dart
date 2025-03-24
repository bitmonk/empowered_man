import 'package:empowered/core/extension/extensions.dart';

class GoalTypeScroll extends StatefulWidget {
  const GoalTypeScroll({
    required this.selectedIndex,
    required this.onSelected,
    super.key,
  });
  final int selectedIndex;
  final Function(int) onSelected;

  @override
  State<GoalTypeScroll> createState() => _GoalTypeScrollState();
}

class _GoalTypeScrollState extends State<GoalTypeScroll> {
  final List<String> goalTypes = [
    'Body',
    'Mind',
    'Balance',
    'Wealth',
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        goalTypes.length,
        (index) {
          var isSelected = index == widget.selectedIndex;
          return GestureDetector(
            onTap: () =>
                widget.onSelected(index), // Notify parent when selected
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xff3B4B58) : null,
                borderRadius: BorderRadius.circular(50),
                border: isSelected
                    ? null
                    : Border.all(color: Colors.white.withOpacity(0.5)),
              ),
              child: Row(
                children: [
                  Text(
                    goalTypes[index],
                    style: const TextStyle(
                      color: AppColors.textColor50,
                      fontSize: 12,
                    ),
                  ),
                  if (isSelected) ...[
                    const HorizontalSpacing(10),
                    const Icon(
                      Icons.check_circle,
                      color: AppColors.color2AD674,
                      size: 16,
                    ),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
