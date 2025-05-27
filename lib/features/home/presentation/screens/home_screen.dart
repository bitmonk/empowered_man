import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/home/presentation/controllers/home_controller.dart';
import 'package:empowered/features/home/presentation/screens/widgets/daily_widget.dart';
import 'package:empowered/features/home/presentation/screens/widgets/home_header_widgets.dart';
import 'package:empowered/features/home/presentation/screens/widgets/monthly_widget.dart';
import 'package:empowered/features/home/presentation/screens/widgets/weekly_widget.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      key: AppWidgetKey.home,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          children: [
            const HomeHeaderWidgets(),
            // Tab Buttons
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildTabButton(0, 'My Daily'),
                  const SizedBox(width: 12),
                  _buildTabButton(1, 'My Weekly'),
                  const SizedBox(width: 12),
                  _buildTabButton(2, 'My Monthly'),
                ],
              ),
            ),
            const VerticalSpacing(16),

            Expanded(
              child: Obx(
                () => IndexedStack(
                  index: controller.selectedTabIndex.value,
                  children: const [
                    DailyWidget(),
                    WeeklyWidget(),
                    MonthlyWidget(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabButton(int index, String title) {
    return Obx(
      () {
        final isSelected = controller.selectedTabIndex.value == index;
        return GestureDetector(
          onTap: () {
            if (index == 2) {
              controller.getMyMonthy();
            }
            controller.updateSelectedTab(index);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.bgBorderVLight : Colors.transparent,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: AppColors.bgBorderVLight,
              ),
            ),
            child: Text(
              title,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.grey[400],
              ),
            ),
          ),
        );
      },
    );
  }
}
