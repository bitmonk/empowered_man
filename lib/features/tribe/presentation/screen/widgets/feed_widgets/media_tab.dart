import 'package:empowered/enum/the_states.dart';
import 'package:empowered/features/tribe/presentation/controller/tribe_group_controller.dart';
import 'package:empowered/features/tribe/presentation/screen/widgets/feed_widgets/media_viewer.dart';
import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter_gif/flutter_gif.dart';
import 'package:gif/gif.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MediaTab extends StatefulWidget {
  const MediaTab({required this.groupId, super.key});
  final String groupId;

  @override
  State<MediaTab> createState() => _MediaTabState();
}

class _MediaTabState extends State<MediaTab> with TickerProviderStateMixin {
  final TribeGroupController controller = Get.find<TribeGroupController>();
  late GifController gifController;

  @override
  void initState() {
    super.initState();
    gifController = GifController(vsync: this);
    controller.loadGroupMedia(widget.groupId);
  }

  @override
  void dispose() {
    gifController.dispose();
    super.dispose();
  }

  String _getMediaType(String url) {
    final extension = url.split('.').last.toLowerCase();
    switch (extension) {
      case 'jpg':
      case 'jpeg':
      case 'png':
      case 'webp':
        return 'image';
      case 'gif':
        return 'gif';
      case 'mp4':
      case 'mov':
      case 'avi':
      case 'mkv':
        return 'video';
      case 'pdf':
        return 'document';
      default:
        return 'image';
    }
  }

  Widget _buildMedia(List<Map<String, dynamic>> mediaList) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 1,
      ),
      itemCount: mediaList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => _openMediaViewer(mediaList, index),
          child: _buildSingleMedia(mediaList[index]),
        );
      },
    );
  }

  void _openMediaViewer(
      List<Map<String, dynamic>> mediaList, int initialIndex) {
    Get.to(() => MediaViewer(mediaList: mediaList, initialIndex: initialIndex));
  }

  Widget _buildSingleMedia(Map<String, dynamic> item) {
    final url = item['url'] as String;
    final type = item['type'] as String;

    switch (type) {
      case 'image':
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: CachedNetworkImage(
            imageUrl: url,
            fit: BoxFit.cover,
            placeholder: (context, url) => Container(
              color: Colors.grey[800],
              child: const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
            ),
            errorWidget: (context, url, error) => Container(
              color: Colors.grey[800],
              child: const Center(
                child: Icon(
                  Icons.broken_image,
                  color: Colors.white54,
                  size: 40,
                ),
              ),
            ),
          ),
        );
      case 'gif':
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Gif(
            image: NetworkImage(url),
            controller: gifController,
            autostart: Autostart.loop,
            placeholder: (context) => Container(
              color: Colors.grey[800],
              child: const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
            ),
            onFetchCompleted: () {
              gifController.reset();
              gifController.forward();
            },
          ),
        );
      case 'document':
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Container(
            color: Colors.grey[800],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.picture_as_pdf,
                  color: Colors.white,
                  size: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    url.split('/').last,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        );
      case 'video':
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            alignment: Alignment.center,
            children: [
              FutureBuilder<Uint8List?>(
                future: VideoThumbnail.thumbnailData(
                  video: url,
                  imageFormat: ImageFormat.PNG,
                  maxWidth: 400,
                  quality: 60,
                ),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container(
                      color: Colors.black,
                      child: const Center(
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      ),
                    );
                  } else if (snapshot.hasData && snapshot.data != null) {
                    return Image.memory(
                      snapshot.data!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    );
                  } else {
                    return Container(
                      color: Colors.black,
                      child: const Center(
                        child: Icon(Icons.videocam,
                            color: Colors.white38, size: 48),
                      ),
                    );
                  }
                },
              ),
              const Icon(Icons.play_circle_fill, color: Colors.white, size: 48),
              Positioned(
                bottom: 8,
                left: 0,
                right: 0,
                child: Text(
                  url.split('/').last,
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        );
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final mediaData = controller.groupMediaModel.value.data;
      final isLoading = controller.groupMediaState.value == TheStates.loading;
      final hasError = controller.groupMediaState.value == TheStates.error;

      if (isLoading) {
        return const Center(child: CircularProgressIndicator());
      }

      if (hasError || mediaData == null) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Failed to load media',
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => controller.loadGroupMedia(widget.groupId),
                child: const Text('Retry'),
              ),
            ],
          ),
        );
      }

      final mediaList = mediaData.medias ?? [];
      final totalMedia = mediaData.meta?.total ?? 0;

      final formattedMediaList = mediaList
          .map((media) => {
                'url': media.url,
                'type': _getMediaType(media.url!),
              })
          .toList();

      return ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Media ($totalMedia)',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          if (formattedMediaList.isEmpty)
            const Center(
              child: Text(
                'No media available',
                style: TextStyle(color: Colors.white60),
              ),
            )
          else
            _buildMedia(formattedMediaList),
        ],
      );
    });
  }
}
