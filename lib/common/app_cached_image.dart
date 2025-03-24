import 'package:cached_network_image/cached_network_image.dart';
import 'package:empowered/core/extension/extensions.dart';

class AppCachedImage extends StatelessWidget {
  const AppCachedImage({
    required this.imgUrl,
    super.key,
    this.height,
    this.width,
    this.fit,
  });
  final String imgUrl;
  final double? height;
  final double? width;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imgUrl,
      height: height,
      width: width,
      fit: fit,
      progressIndicatorBuilder: (context, url, progress) =>
          const AppLoadingWidget.small(),
      errorWidget: (context, url, error) => const Center(
        child: Text(
          'No Image',
        ),
      ),
    );
  }
}
