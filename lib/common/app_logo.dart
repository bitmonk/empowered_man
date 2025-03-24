import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/gen/assets.gen.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key, this.width = 82});
  final double width;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'app-logo',
      child: Assets.images.appLogo.image(width: width),
    );
  }
}
