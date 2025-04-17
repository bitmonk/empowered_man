import 'package:empowered/common/app_selected_button.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/chat/presentation/controllers/chat_controller.dart';
import 'package:empowered/features/journal_chat/presentation/controllers/journal_chat_bindings.dart';
import 'package:empowered/features/journal_chat/presentation/controllers/journal_chat_controller.dart';
import 'package:empowered/features/journal_chat/presentation/screens/journal_chat_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProgressGoalWidget extends StatefulWidget {
  const ProgressGoalWidget({
    required this.title,
    required this.selectedTent,
    super.key,
  });
  final String title;
  final String selectedTent;

  @override
  _ProgressGoalWidgetState createState() => _ProgressGoalWidgetState();
}

class _ProgressGoalWidgetState extends State<ProgressGoalWidget> {
  bool isOnTrackSelected = true; // Default for On Track / Off Track
  List<bool> selectedGoals = List.generate(
    4,
    (index) => index.isEven,
  ); // Track selected goals

  void selectTrack(bool onTrack) {
    setState(() {
      isOnTrackSelected = onTrack;
    });
  }

  void toggleGoalSelection(int index) {
    setState(() {
      selectedGoals[index] = !selectedGoals[index]; // Toggle selected state
    });
  }

  @override
  Widget build(BuildContext context) {
    return ThemedContainer(
      margin: const EdgeInsets.symmetric(vertical: 12),
      border: Border.all(
        color: AppColors.primary600,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title & Actions
          Row(
            children: [
              Text(widget.title, style: AppTextStyles.textHeadingH3),
              const Spacer(),
              InkWell(
                onTap: () {
                  initJournalWithNavigate(widget.selectedTent);
                },
                child: Assets.images.goalAdd.image(width: 32),
              ),
              const HorizontalSpacing(16),
              Assets.images.goalThreeDot.image(width: 32),
            ],
          ),
          const VerticalSpacing(4),
          InkWell(
            onTap: () {
              Get.toNamed(AppRoutes.reflectionScreen);
            },
            child: Text(
              'View full reflection',
              style: AppTextStyles.textBodyB2.copyWith(
                color: AppColors.primary400,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.primary400,
              ),
            ),
          ),
          const VerticalSpacing(16),
          Row(
            children: [
              const Text(
                'Targets',
                style: TextStyle(
                  fontSize: 28,
                  color: AppColors.textColor50,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              SizedBox(
                width: 120.w,
                child: LinearProgressIndicator(
                  borderRadius: BorderRadius.circular(20),
                  minHeight: 8,
                  color: AppColors.colorF5CA41,
                  value: 0.5,
                ),
              ),
              const HorizontalSpacing(8),
              const Text(
                '50%',
                style: AppTextStyles.textBodyB3,
              ),
            ],
          ),
          // Replace the dynamic goals list section with this code:
          const VerticalSpacing(8),
          SizedBox(
            height: 200,
            child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(
                selectedGoals.length,
                (index) => Align(
                  child: GestureDetector(
                    onTap: () => toggleGoalSelection(index),
                    child: AppSelectedButton(
                      selectedItem: selectedGoals[index],
                      title: 'Squat 140kg 5 5',
                    ),
                  ),
                ),
              ),
            ),
          ),
          const VerticalSpacing(30),

          // On Track / Off Track
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              children: [
                // On Track Button
                Expanded(
                  child: GestureDetector(
                    onTap: () => selectTrack(true),
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                        vertical: 14,
                        horizontal: 12,
                      ),
                      decoration: BoxDecoration(
                        color: isOnTrackSelected && widget.title == 'Weekly'
                            ? AppColors.primary500
                            : AppColors.bgBorder,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.check,
                            color: isOnTrackSelected
                                ? Colors.white
                                : AppColors.textColor100,
                          ),
                          const HorizontalSpacing(8),
                          Text(
                            widget.title == 'Weekly' ? 'Won' : 'On Track',
                            style: AppTextStyles.textBodyB1.copyWith(
                              color: isOnTrackSelected
                                  ? Colors.white
                                  : AppColors.textColor100,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const HorizontalSpacing(16),
                // Off Track Button
                Expanded(
                  child: GestureDetector(
                    onTap: () => selectTrack(false),
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                        vertical: 14,
                        horizontal: 12,
                      ),
                      decoration: BoxDecoration(
                        color: !isOnTrackSelected && widget.title == 'Weekly'
                            ? AppColors.primary500
                            : AppColors.bgBorder,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.close,
                            color: !isOnTrackSelected
                                ? Colors.white
                                : AppColors.textColor100,
                          ),
                          const HorizontalSpacing(8),
                          Text(
                            widget.title == 'Weekly' ? 'Lost' : 'Off Track',
                            style: AppTextStyles.textBodyB1.copyWith(
                              color: !isOnTrackSelected
                                  ? Colors.white
                                  : AppColors.textColor100,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void initJournalWithNavigate(String title) {
  JournalChatInitializer.initialize();
  Get.find<JournalChatController>().title.value = '$title Tent';
  // var chatConversationList = [
  //   ChatConversationModel(
  //     isMine: false,
  //     timeStamp: '10:30 AM',
  //     profileImageUrl: '',
  //     name: '',
  //     message:
  //         '''A new week has arrived! Take a moment to review the insights from the past week in the Mind domain and create your updated fire map for the week ahead.''',
  //     dateTime: '2024-02-10 10:30:00',
  //   ),
  //   ChatConversationModel(
  //     isMine: true,
  //     timeStamp: '11:00 AM',
  //     hide: true,
  //     profileImageUrl: '',
  //     name: '',
  //     message: 'Angry!',
  //     dateTime: '2024-02-10 11:00:00',
  //   ),
  // ].obs;
  // Get.find<JournalChatController>().chatConversationList.value =
  //     chatConversationList;
  Get.to(
    () => const JournalChatScreen(
      isFromGoals: true,
    ),
  );
}
