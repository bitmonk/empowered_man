import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/tasks/presentation/controllers/tasks_controller.dart';

Color priorityColor({required String priority}) {
  final controller = Get.find<TasksController>();

  if (priority == controller.prioritiesList[0]) {
    return AppColors.appRed; // High
  } else if (priority == controller.prioritiesList[1]) {
    return Colors.orange; // Medium
  } else if (priority == controller.prioritiesList[2]) {
    return AppColors.appYellow; // Low
  } else {
    return Colors.grey; // Default/fallback
  }
}
