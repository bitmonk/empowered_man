import 'package:empowered/features/common/app_spacing.dart';
import 'package:empowered/features/tasks/presentation/controllers/tasks_controller.dart';
import 'package:empowered/features/tasks/presentation/screens/widget/sub_task_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class SubTaskList extends GetView<TasksController> {
  const SubTaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        VerticalSpacing(19),
        SubTaskTile(),
        SubTaskTile(),
        SubTaskTile(),
        SubTaskTile(),
      ],
    );
  }
}
