import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/home/presentation/controllers/home_controller.dart';

class MonthlyWidget extends StatelessWidget {
  const MonthlyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Obx(
      () => controller.getMonthlyState.value.showWidget(
        loading: () => const LoadingWidget(),
        error: () => CustomErrorWidget(
          error: controller.myMonthlyError.value,
          onPressed: () {
            controller.getMyMonthy();
          },
        ),
        success: () {
          final data = controller.myMonthlyData;
          return (data.isEmpty)
              ? CustomErrorWidget(
                  error: 'No data found',
                  verticlePadding: const EdgeInsets.symmetric(vertical: 200),
                  onPressed: () async {
                    controller.getMyMonthy();
                  },
                )
              : ThemedContainer(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      controller.getMyMonthy();
                    },
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return SingleChildScrollView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          // controller: _controller.getScrollController(
                          //   paginationName,
                          // ),
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              minHeight: constraints.maxHeight,
                            ),
                            child: IntrinsicHeight(
                              child: Column(
                                children: [
                                  Table(
                                    columnWidths: const {
                                      0: FlexColumnWidth(
                                        6,
                                      ), // Task column
                                      1: FlexColumnWidth(
                                        5,
                                      ), // Date column
                                      2: FlexColumnWidth(
                                        5,
                                      ), // Status column
                                    },
                                    children: [
                                      TableRow(
                                        children: [
                                          TableHeader(
                                            title: 'Targets',
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                left: 8,
                                              ),
                                              child: Assets.images.arrowsDownUp
                                                  .svg(),
                                            ),
                                          ),
                                          const TableHeader(
                                            title: 'Type',
                                          ),
                                          const TableHeader(
                                            title: 'Status',
                                          ),
                                        ],
                                      ),
                                      TableRow(
                                        children: List.generate(
                                          3,
                                          (index) => const Divider(
                                            color: AppColors.bgBorder,
                                            height: 12,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  ...data.map(
                                    (e) => TaskRow(
                                      taskName: e.target ?? 'N/A',
                                      date: e.type ?? '',
                                      status: e.status ?? '',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
        },
      ),
    );
  }
}

// // Task Rows
//                                 Column(
//                                   children: List.generate(4, (index) {
//                                     return TaskRow(
//                                       taskName: 'Activity ${index + 1}',
//                                       date: 'Body',
//                                     );
//                                   }),
//                                 ),

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
    required this.status, super.key,
  });
  final String taskName;
  final String date;
  final String status;

  @override
  State<TaskRow> createState() => _TaskRowState();
}

class _TaskRowState extends State<TaskRow> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Table(
        columnWidths: const {
          0: FlexColumnWidth(5), // Task column
          1: FlexColumnWidth(4), // Date column
          2: FlexColumnWidth(5), // Status column
        },
        children: [
          TableRow(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.taskName,
                      style: AppTextStyles.textBodyB4
                          .copyWith(color: AppColors.textColor100),
                    ),
                  ],
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
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: widget.status == 'Completed'
                          ? const Color(0xff0E2B1D)
                          : const Color(0xff3D3834),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      widget.status,
                      style: TextStyle(
                        color: widget.status == 'Not Started'
                            ? AppColors.colorFEA463
                            : AppColors.color0EC76D,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
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
