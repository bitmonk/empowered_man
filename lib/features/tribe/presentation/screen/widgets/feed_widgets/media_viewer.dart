import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter_gif/flutter_gif.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gif/gif.dart';
import 'package:video_player/video_player.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MediaViewer extends StatefulWidget {
  final List<Map<String, dynamic>> mediaList;
  final int initialIndex;

  const MediaViewer({
    required this.mediaList,
    required this.initialIndex,
    super.key,
  });

  @override
  State<MediaViewer> createState() => _MediaViewerState();
}

class _MediaViewerState extends State<MediaViewer>
    with TickerProviderStateMixin {
  late PageController _pageController;
  late int _currentIndex;
  late GifController gifController;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: _currentIndex);
    gifController = GifController(vsync: this);
  }

  @override
  void dispose() {
    _pageController.dispose();
    gifController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: widget.mediaList.length,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
          if (widget.mediaList[index]['type'] == 'gif') {
            gifController.reset();
            gifController.forward();
          }
        },
        itemBuilder: (context, index) {
          final item = widget.mediaList[index];
          final url = item['url'] as String;
          final type = item['type'] as String;

          switch (type) {
            case 'image':
              return CachedNetworkImage(
                imageUrl: url,
                fit: BoxFit.contain,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ),
                errorWidget: (context, url, error) => const Center(
                  child:
                      Icon(Icons.broken_image, color: Colors.white54, size: 64),
                ),
              );
            case 'gif':
              return Gif(
                image: NetworkImage(url),
                controller: gifController,
                autostart: Autostart.loop,
                placeholder: (context) => const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ),
                onFetchCompleted: () {
                  gifController.reset();
                  gifController.forward();
                },
              );
            case 'video':
              return VideoPlayerWidget(videoUrl: url);
            case 'document':
              return WebViewWidget(
                controller: WebViewController()
                  ..setJavaScriptMode(JavaScriptMode.unrestricted)
                  ..loadRequest(Uri.parse(url)),
              );
            default:
              return const Center(
                child: Text(
                  'Unsupported media type',
                  style: TextStyle(color: Colors.white),
                ),
              );
          }
        },
      ),
    );
  }
}

class VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerWidget({required this.videoUrl, super.key});

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
      ..initialize().then((_) {
        if (mounted) {
          setState(() {
            _isInitialized = true;
          });
          _controller.play();
        }
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _isInitialized
        ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          )
        : const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          );
  }
}
