import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/gen/assets.gen.dart';

class MonthlyWidget extends StatelessWidget {
  const MonthlyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Table Header
          Table(
            columnWidths: const {
              0: FlexColumnWidth(6), // Task column
              1: FlexColumnWidth(5), // Date column
              2: FlexColumnWidth(5), // Status column
            },
            children: [
              TableRow(
                children: [
                  TableHeader(
                    title: 'Targets',
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Assets.images.arrowsDownUp.svg(),
                    ),
                  ),
                  const TableHeader(title: 'Type'),
                  const TableHeader(title: 'Status'),
                ],
              ),
              TableRow(
                children: List.generate(
                  3,
                  (index) =>
                      const Divider(color: AppColors.bgBorder, height: 12),
                ),
              ),
            ],
          ),
          // Task Rows
          Column(
            children: List.generate(4, (index) {
              return TaskRow(
                taskName: 'Activity ${index + 1}',
                date: 'Body',
              );
            }),
          ),
        ],
      ),
    );
  }
}

class TableHeader extends StatelessWidget {
  const TableHeader({required this.title, super.key, this.child});
  final String title;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Text(
            title,
            style: AppTextStyles.textBodyB3.copyWith(
              color: AppColors.colorWhite,
            ),
          ),
          if (child != null) child!,
        ],
      ),
    );
  }
}

// Task Row Widget
class TaskRow extends StatefulWidget {
  const TaskRow({
    required this.taskName,
    required this.date,
    super.key,
  });
  final String taskName;
  final String date;

  @override
  State<TaskRow> createState() => _TaskRowState();
}

class _TaskRowState extends State<TaskRow> {
  String status = 'Not Started';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Table(
        columnWidths: const {
          0: FlexColumnWidth(6), // Task column
          1: FlexColumnWidth(5), // Date column
          2: FlexColumnWidth(5), // Status column
        },
        children: [
          TableRow(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: GestureDetector(
                  onTap: () {
                    if (status == 'Completed') {
                      status = 'Not Started';
                    } else {
                      status = 'Completed';
                    }
                    setState(() {});
                  },
                  behavior: HitTestBehavior.translucent,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Icon(
                      //   status == 'Not Started'
                      //       ? Icons.radio_button_off
                      //       : Icons.radio_button_on,
                      //   color: Colors.white38,
                      // ),
                      //const SizedBox(width: 8),
                      Text(
                        widget.taskName,
                        style: AppTextStyles.textBodyB4
                            .copyWith(color: AppColors.textColor100),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  widget.date,
                  style: AppTextStyles.textBodyB4
                      .copyWith(color: AppColors.textColor100),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: GestureDetector(
                  onTap: () {
                    if (status == 'Completed') {
                      status = 'Not Started';
                    } else {
                      status = 'Completed';
                    }
                    setState(() {});
                  },
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: status == 'Completed'
                            ? const Color(0xff0E2B1D)
                            : const Color(0xff3D3834),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        status,
                        style: TextStyle(
                          color: status == 'Not Started'
                              ? AppColors.colorFEA463
                              : AppColors.color0EC76D,
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
