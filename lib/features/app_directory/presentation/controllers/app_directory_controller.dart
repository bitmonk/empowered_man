import 'package:empowered/features/app_directory/data/source/app_directory_remote_source.dart';
import 'package:get/get.dart';

class AppDirectoryController extends GetxController {
  AppDirectoryController({required this.remoteSource});
  final AppDirectoryRemoteSource remoteSource;
}
