import 'package:empowered/core/config/app_config.dart';
import 'package:empowered/features/app/app_entry_point.dart';

class DevelopmentEntryPoint extends AppEntryPoint {
  DevelopmentEntryPoint() : super(AppConfiguration.development);
}

class ProductionEntryPoint extends AppEntryPoint {
  ProductionEntryPoint() : super(AppConfiguration.production);
}

class StagingEntryPoint extends AppEntryPoint {
  StagingEntryPoint() : super(AppConfiguration.staging);
}
