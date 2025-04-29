import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/tasks/data/model/task_model.dart';
import 'package:empowered/features/tasks/presentation/controllers/tasks_controller.dart';
import 'package:empowered/features/tasks/presentation/screens/widget/task_tile.dart';

class TaskList extends GetView<TasksController> {
  const TaskList({
    super.key,
    this.list,
  });
  final List<Task>? list;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: list?.length,
      itemBuilder: (context, i) => TaskTile(
        task: list![i],
      ),
    );
  }
}
