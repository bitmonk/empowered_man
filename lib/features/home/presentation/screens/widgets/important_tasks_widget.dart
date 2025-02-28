import 'package:empowered/constants/app_colors.dart';
import 'package:empowered/features/common/app_spacing.dart';
import 'package:empowered/features/common/themed_container.dart';
import 'package:empowered/features/home/presentation/screens/widgets/task_status_widget.dart';
import 'package:empowered/gen/assets.gen.dart';
import 'package:empowered/utlis/app_text_styles.dart';
import 'package:flutter/material.dart';

class ImportantTasksWidget extends StatefulWidget {
  const ImportantTasksWidget({super.key});

  @override
  _ImportantTasksWidgetState createState() => _ImportantTasksWidgetState();
}

class _ImportantTasksWidgetState extends State<ImportantTasksWidget> {
  // List to track task completion status
  List<bool> isCompleted = List.generate(4, (index) => false);

  void toggleTaskStatus(int index) {
    setState(() {
      isCompleted[index] = !isCompleted[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return ThemedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Title
          const Text(
            "My Most Important Tasks (MIT's)",
            style: AppTextStyles.textBodyB1, // Replace with your style
          ),
          const SizedBox(height: 8),
          // Subtitle
          const Text(
            "You haven't set your mandatory mission",
            style: AppTextStyles.textBodyB3, // Replace with your style
          ),
          const SizedBox(height: 16),
          // Table for Header + Tasks
          Table(
            columnWidths: const {
              0: FlexColumnWidth(6),
              1: FlexColumnWidth(5),
              2: FlexColumnWidth(4),
            },
            children: [
              // Header Row
              const TableRow(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: [
                        Text(
                          'Type : ',
                          style: AppTextStyles.textBodyB3,
                        ),
                        Text(
                          'Type1',
                          style: AppTextStyles.textBodyB3,
                        ),
                        HorizontalSpacing(6),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: AppColors.textColor200,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      'Notes',
                      style: AppTextStyles.textBodyB3,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      'Status',
                      style: AppTextStyles.textBodyB3,
                    ),
                  ),
                ],
              ),
              // Divider Row (Optional)
              const TableRow(
                children: [
                  Divider(color: AppColors.textColor200),
                  Divider(color: AppColors.textColor200),
                  Divider(color: AppColors.textColor200),
                ],
              ),
              // Tasks Rows
              ...List.generate(
                isCompleted.length,
                (index) => TableRow(
                  children: [
                    // Task Title
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () => toggleTaskStatus(index),
                            child: isCompleted[index]
                                ? Assets.images.tickCircle.svg()
                                : Assets.images.emptyCirlce.svg(),
                          ),
                          const HorizontalSpacing(12),
                          Text(
                            'Activity ${index + 1}',
                            style: AppTextStyles.textBodyB4,
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: GestureDetector(
                        onTap: () {
                          // Handle View Notes
                        },
                        child: const Text(
                          'View Notes',
                          style: TextStyle(
                            fontSize: 12,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.primary500,
                            color: AppColors.primary500,
                          ),
                        ),
                      ),
                    ),
                    // Status
                    const TaskStatusWidget(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
