import 'package:empowered/core/extension/extensions.dart';

class GettingStartedScreen extends StatelessWidget {
  const GettingStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const CustomAppBar(
        title: 'Getting Started',
      ),
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.7,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: const AppVideoPlayer(
                    videoUrl:
                        'https://media.istockphoto.com/id/1465360965/video/group-of-people-learning-computer-programming.mp4?s=mp4-640x640-is&k=20&c=-B6Zbhm18GfPEA-WSOLwZn1B60NYjsnbaeaey6oLVMQ=',
                  ),
                ),
                const VerticalSpacing(16),
                AppOutlinedButton(
                  safePadding: true,
                  text: 'Get Started',
                  onPressed: () {
                    Get.offAllNamed(AppRoutes.main);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
