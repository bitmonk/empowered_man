import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AppProfileAvatar extends StatelessWidget {

  const AppProfileAvatar({
    super.key,
    this.imageUrl,
    this.size = 40,
    this.border,
    this.backgroundColor,
  });
  final String? imageUrl;
  final double size;
  final BoxBorder? border;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: border,
        color: backgroundColor ?? Colors.transparent,
      ),
      child: ClipOval(
        child: (imageUrl != null && imageUrl!.isNotEmpty)
            ? CachedNetworkImage(
                imageUrl: imageUrl!,
                width: size,
                height: size,
                fit: BoxFit.cover,
                placeholder: (context, url) => Center(
                  child: SizedBox(
                    width: size * 0.5,
                    height: size * 0.5,
                    child: const CircularProgressIndicator(strokeWidth: 2),
                  ),
                ),
                errorWidget: (context, url, error) => Icon(
                  Icons.person,
                  size: size,
                  color: Colors.white,
                ),
              )
            : Icon(
                Icons.person,
                size: size,
                color: Colors.white,
              ),
      ),
    );
  }
}
