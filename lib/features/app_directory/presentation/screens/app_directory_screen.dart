import 'package:empowered/core/extension/extensions.dart';

class AppDirectoryScreen extends StatelessWidget {
  const AppDirectoryScreen({required this.appDirectoryEnum, super.key});

  final AppDirectoryEnum appDirectoryEnum;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(
        title: appDirectoryEnum.title(),
        onTap: () => Navigator.pop(context),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          children: [
            const Text(
              'Title 1',
              style: AppTextStyles.titleMd,
            ),
            const VerticalSpacing(12),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
              style:
                  AppTextStyles.titleSm.copyWith(color: AppColors.textColor100),
            ),
            const VerticalSpacing(20),
            const Text(
              'Title 2',
              style: AppTextStyles.titleMd,
            ),
            const VerticalSpacing(12),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
              style:
                  AppTextStyles.titleSm.copyWith(color: AppColors.textColor100),
            ),
          ],
        ),
      ),
    );
  }
}

enum AppDirectoryEnum {
  termsAndConditions,
  privacyPolicy,
  faq,
  communityGuidelines
}

extension AppDirectoryExtension on AppDirectoryEnum {
  String title() {
    switch (this) {
      case AppDirectoryEnum.termsAndConditions:
        return 'Terms And Conditions';
      case AppDirectoryEnum.privacyPolicy:
        return 'Privacy Policy';
      case AppDirectoryEnum.faq:
        return 'FAQ';
      case AppDirectoryEnum.communityGuidelines:
        return 'Community guidelines';
    }
  }
}
