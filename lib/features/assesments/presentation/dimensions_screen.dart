import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/assesments/presentation/widgets/navigation_buttons.dart';

class DimensionScreen extends StatefulWidget {
  // Track current dimension

  const DimensionScreen({super.key, this.dimensionIndex = 1});
  final int dimensionIndex;

  @override
  _DimensionScreenState createState() => _DimensionScreenState();
}

class _DimensionScreenState extends State<DimensionScreen> {
  double selectedScore = 4;
  int? expandedIndex;

  static const int totalDimensions = 5; // Total number of pages

  final List<String> levels = [
    '[1-3] BODY - FITNESS LEVEL 1: ASLEEP',
    '[4-6] TITLE PLACEHOLDER',
    '[7-9] TITLE PLACEHOLDER',
    '[10-12] BODY - TITLE PLACEHOLDER',
  ];

  void navigateToDetail(String title) {}

  void goToNextDimension() {
    if (widget.dimensionIndex < totalDimensions) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              DimensionScreen(dimensionIndex: widget.dimensionIndex + 1),
        ),
      );
    } else {
      Get.toNamed(AppRoutes.assesmentsResult);
    }
  }

  void goToPreviousDimension() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    var progressValue = widget.dimensionIndex / totalDimensions;

    return AppScaffold(
      appBar: CustomAppBar(
        heroTag: 'power-app-bar',
        title: 'Power ${widget.dimensionIndex}/$totalDimensions',
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: 'power-linear',
                      child: LinearProgressIndicator(
                        minHeight: 6,
                        borderRadius: BorderRadius.circular(20),
                        value: progressValue,
                        color: AppColors.primary500,
                        backgroundColor: AppColors.color324E65,
                      ),
                    ),
                    const VerticalSpacing(24),
                    Text(
                      'DIMENSION #${widget.dimensionIndex}: BODY, SECTION #1: FITNESS',
                      style: AppTextStyles.textHeadingH3,
                    ),
                    const VerticalSpacing(16),
                    const Text(
                      'The state and condition of being physically sound and healthy, especially as the result of exercise.',
                      style: AppTextStyles.textBodyB2,
                    ),
                    const VerticalSpacing(8),
                    Column(
                      children: [
                        SliderTheme(
                          data: const SliderThemeData(trackHeight: 6),
                          child: Slider(
                            value: selectedScore,
                            max: 12,
                            inactiveColor: AppColors.color324E65,
                            thumbColor: AppColors.white,
                            activeColor: AppColors.primary300,
                            onChanged: (value) {
                              setState(() {
                                selectedScore = value;
                              });
                            },
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(
                            13,
                            (index) => Text(
                              (index).toString(),
                              style: AppTextStyles.textBodyB3,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const VerticalSpacing(24),
                    Theme(
                      data: ThemeData()
                          .copyWith(dividerColor: Colors.transparent),
                      child: Column(
                        children: List.generate(levels.length, (index) {
                          return ExpansionTile(
                            tilePadding: EdgeInsets.zero,
                            expandedAlignment: Alignment.centerLeft,
                            expandedCrossAxisAlignment:
                                CrossAxisAlignment.start,
                            onExpansionChanged: (expanded) {
                              setState(() {
                                expandedIndex = expanded ? index : null;
                              });
                            },
                            title: Text(
                              levels[index],
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primary300,
                              ),
                            ),
                            trailing: expandedIndex == index
                                ? const Icon(
                                    Icons.keyboard_arrow_up,
                                    color: AppColors.textColor300,
                                  )
                                : const Icon(
                                    Icons.keyboard_arrow_down,
                                    color: AppColors.textColor300,
                                  ),
                            children: [
                              const Text(
                                'Your Body Is Irrelevant To You',
                                style: AppTextStyles.textBodyB2,
                              ),
                              const VerticalSpacing(16),
                              Text(
                                testPower,
                                style: AppTextStyles.textBodyB3,
                              ),
                            ],
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Hero(
              tag: 'power-nav',
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: NavigationButtons(
                  onPrevious: goToPreviousDimension,
                  onNext: goToNextDimension,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String testPower = '''
You're ignorant & lazy when it comes to exercise.
You don't know how your body works, and simply ignore any sense of reality with your body when it comes to fitness.
You can't remember the last time you actually went to the gym, or even attempted to break a sweat.
You have spent little to no thought on how your Body affects your life, thus fitness is not even part of your reality.
You're fat and/or out of shape and you just don't give a shit about your body anymore.
''';
