import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/tasks/data/model/task_model.dart';
import 'package:empowered/features/tasks/presentation/controllers/tasks_controller.dart';
import 'package:empowered/features/tasks/presentation/screens/widget/sub_task_tile.dart';

class SubTaskList extends GetView<TasksController> {
  const SubTaskList({
    required this.subTaskList,
    required this.mainTask,
    super.key,
  });
  final List<Task> subTaskList;
  final Task mainTask;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const VerticalSpacing(19),
        ...subTaskList.map(
          (e) => SubTaskTile(
            subtask: e,
            mainTask: mainTask,
          ),
        ),
      ],
    );
  }
}
