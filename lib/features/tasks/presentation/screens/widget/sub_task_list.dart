import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/tasks/presentation/controllers/tasks_controller.dart';
import 'package:empowered/features/tasks/presentation/screens/widget/sub_task_tile.dart';

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
