import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/app_directory/presentation/controllers/app_directory_controller.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class AppDirectoryScreen extends StatefulWidget {
  const AppDirectoryScreen({required this.appDirectoryEnum, super.key});

  final AppDirectoryEnum appDirectoryEnum;

  @override
  State<AppDirectoryScreen> createState() => _AppDirectoryScreenState();
}

class _AppDirectoryScreenState extends State<AppDirectoryScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AppDirectoryController>();

    if (widget.appDirectoryEnum == AppDirectoryEnum.termsAndConditions) {
      controller.getTermsAndConditions();
    } else if (widget.appDirectoryEnum == AppDirectoryEnum.privacyPolicy) {
      controller.getPrivacyPolicy();
    } else if (widget.appDirectoryEnum ==
        AppDirectoryEnum.communityGuidelines) {
      controller.getCommunityGuide();
    }

    void fetchContent() {
      if (widget.appDirectoryEnum == AppDirectoryEnum.termsAndConditions) {
        controller.getTermsAndConditions();
      } else if (widget.appDirectoryEnum == AppDirectoryEnum.privacyPolicy) {
        controller.getPrivacyPolicy();
      } else if (widget.appDirectoryEnum ==
          AppDirectoryEnum.communityGuidelines) {
        controller.getCommunityGuide();
      }
    }

    return AppScaffold(
      appBar: CustomAppBar(
        title: widget.appDirectoryEnum.title(),
        onTap: () => Navigator.pop(context),
      ),
      body: SafeArea(
        child: Obx(
          () {
            final content = switch (widget.appDirectoryEnum) {
              AppDirectoryEnum.termsAndConditions =>
                controller.termsAndConditions.value,
              AppDirectoryEnum.privacyPolicy => controller.privacyPolicy.value,
              AppDirectoryEnum.communityGuidelines =>
                controller.communityGuidelines.value,
              AppDirectoryEnum.faq => throw UnimplementedError(),
            };

            return RefreshIndicator(
              onRefresh: () async {
                if (widget.appDirectoryEnum ==
                    AppDirectoryEnum.termsAndConditions) {
                  await controller.getTermsAndConditions();
                } else if (widget.appDirectoryEnum ==
                    AppDirectoryEnum.privacyPolicy) {
                  await controller.getPrivacyPolicy();
                } else if (widget.appDirectoryEnum ==
                    AppDirectoryEnum.communityGuidelines) {
                  await controller.getCommunityGuide();
                }
              },
              child: controller.privacyPolicyState.value.showWidget(
                loading: () => const AppLoadingWidget.small(
                  color: AppColors.colorWhite,
                ),
                error: () => AppOutlinedButton(
                  onPressed: fetchContent,
                  text: 'Retry',
                ),
                orElse: () => ListView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                  children: [
                    HtmlWidget(
                      content.content ?? '',
                      textStyle: AppTextStyles.titleSm
                          .copyWith(color: AppColors.textColor100),
                    ),
                    const VerticalSpacing(20),
                  ],
                ),
              ),
            );
          },
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
