import 'package:empowered/features/tasks/presentation/screens/widget/task_tile.dart';
import 'package:flutter/material.dart';

class HitList extends StatelessWidget {
  const HitList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TaskTile(
          showNote: true,
        ),
        TaskTile(
          showNote: false,
        ),
        TaskTile(
          showNote: true,
        ),
        TaskTile(
          showNote: false,
        ),
      ],
    );
  }
}
