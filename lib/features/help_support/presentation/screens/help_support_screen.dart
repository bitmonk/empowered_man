import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/help/presentation/controller/help_binding.dart';
import 'package:empowered/features/help/presentation/screen/help_screen.dart';
import 'package:empowered/features/help_support/presentation/controllers/help_support_controller.dart';
import 'package:empowered/features/help_support/presentation/screens/widget/container_list.dart';

class HelpSupportScreen extends GetView<HelpSupportController> {
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(
        title: 'HELP',
        onTap: () => Navigator.pop(context),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VerticalSpacing(16),
              ContainerList(
                onTap: () {
                  UrlLauncherUtils.launchContact('0872937862');
                },
                title: 'Call Us On',
                subtitle: '0872937862',
                icon: Assets.images.call.svg(),
              ),
              const VerticalSpacing(16),
              ContainerList(
                title: 'Write Us At',
                subtitle: 'business@gmail.com',
                icon: Assets.images.vector.svg(),
                trailingIcon: Assets.images.arrowRight.svg(),
                onTap: () {
                  HelpInitializer.destroy();
                  HelpInitializer.initialize();
                  NavigationHelper.navigateWithFadeTransition(
                    context,
                    const HelpScreen(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
