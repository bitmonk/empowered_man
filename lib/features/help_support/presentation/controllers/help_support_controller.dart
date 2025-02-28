import 'package:empowered/features/help_support/data/source/help_support_remote_source.dart';
import 'package:get/get.dart';

class HelpSupportController extends GetxController {
  HelpSupportController({required this.remoteSource});
  RxInt selectedIndex = 0.obs;
  List<String> items = [
    'Account Details',
    'Group Features',
    'Prediction Guide',
    'Prediction Guide',
    'Prediction Guide',
    'Prediction Guide',
  ];
  final HelpSupportRemoteSource remoteSource;
  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}
