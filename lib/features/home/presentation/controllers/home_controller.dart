import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/home/data/source/home_remote_source.dart';

class HomeController extends GetxController {
  HomeController({required this.remoteSource});

  final HomeRemoteSource remoteSource;

  // Reactive state for selected tab index
  RxInt selectedTabIndex = 0.obs;

  // Tab contents
  final List<Widget> tabContents = [
    const Center(child: Text('Daily UI', style: TextStyle(fontSize: 18))),
    const Center(child: Text('Weekly UI', style: TextStyle(fontSize: 18))),
    const Center(child: Text('Monthly UI', style: TextStyle(fontSize: 18))),
  ];

  // Method to update the selected tab
  void updateSelectedTab(int index) {
    selectedTabIndex.value = index;
  }
}
