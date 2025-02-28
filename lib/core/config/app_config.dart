import 'package:empowered/core/build_variants/app_environment_enum.dart';

class AppConfiguration {
  const AppConfiguration({
    required this.baseUrl,
    required this.appEnvironment,
  });
  final String baseUrl;

  final AppEnvironment appEnvironment;

  static const development = AppConfiguration(
    baseUrl: 'https://admin.janasamparka.org/api/v1/',
    appEnvironment: AppEnvironment.development,
  );

  static const production = AppConfiguration(
    baseUrl: 'https://admin.janasamparka.org/api/v1/',
    appEnvironment: AppEnvironment.production,
  );
  static const staging = AppConfiguration(
    baseUrl: 'https://admin.janasamparka.org/api/v1/',
    appEnvironment: AppEnvironment.staging,
  );
}
