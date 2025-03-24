import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/group/presentation/screens/widgets/colored_padded_cotainer.dart';
import 'package:empowered/features/tasks/presentation/controllers/tasks_controller.dart';
import 'package:empowered/gen/assets.gen.dart';

class SubTaskTile extends StatefulWidget {
  const SubTaskTile({
    super.key,
  });

  @override
  State<SubTaskTile> createState() => _SubTaskTileState();
}

class _SubTaskTileState extends State<SubTaskTile> {
  final controller = Get.find<TasksController>();
  bool isSubTaskDone = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(13),
      decoration: const BoxDecoration(
        color: AppColors.color223444,
        borderRadius: BorderRadius.all(Radius.circular(6)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Sub Task 1',
                style: AppTextStyles.textBodyB3,
              ),
              Assets.images.more.svg(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ColoredPaddedCotainer(
                horizontalPadding: 8,
                borderColor: AppColors.appRed,
                borderRadius: 5,
                color: AppColors.bgBorder,
                title: 'Hit',
                //font => inter
                textStyle: AppTextStyles.lightBodySubHeader.copyWith(
                  color: AppColors.appRed,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: InkWell(
                  onTap: () {
                    isSubTaskDone = !isSubTaskDone;
                    setState(() {});
                  },
                  child: isSubTaskDone
                      ? Assets.images.tickCircle.svg()
                      : Row(
                          children: [
                            const Icon(
                              Icons.circle_outlined,
                              color: AppColors.colorC1C9D1,
                              size: 20,
                            ),
                            Text(
                              ' Done',
                              style: AppTextStyles.titleSm.copyWith(
                                color: AppColors.colorC1C9D1,
                                fontSize: 11,
                              ),
                            ),
                          ],
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
