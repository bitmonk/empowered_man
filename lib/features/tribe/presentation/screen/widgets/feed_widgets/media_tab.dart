import 'dart:math';
import 'package:empowered/core/extension/extensions.dart';
import 'package:flutter/material.dart';

class MediaTab extends StatelessWidget {
  const MediaTab({super.key});

  static final List<String> _mediaImages = [
    'assets/images/feed_post_image1.jpg',
    'assets/images/feed_post_image2.jpg',
    'assets/images/feed_post_image3.jpg',
    'assets/images/feed_post_image4.jpg',
    'assets/images/feed_post_image5.jpg',
    'assets/images/feed_post_image6.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final random = Random();
    const mediaCount = 18;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'Media (130)',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white,),
        ),
        const SizedBox(height: 12),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: mediaCount,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemBuilder: (context, index) {
            final imagePath = _mediaImages[random.nextInt(_mediaImages.length)];
            return ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            );
          },
        ),
      ],
    );
  }
}
