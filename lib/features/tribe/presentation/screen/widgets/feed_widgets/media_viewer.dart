import 'package:cached_network_image/cached_network_image.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

class MediaViewer extends StatefulWidget {
  const MediaViewer({required this.mediaList, required this.initialIndex, super.key});
  final List<Map<String, dynamic>> mediaList;
  final int initialIndex;

  @override
  State<MediaViewer> createState() => _MediaViewerState();
}

class _MediaViewerState extends State<MediaViewer> {
  late PageController _pageController;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: context.devicePaddingBottom),
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: () => Get.back(),
          ),
          title: Text(
            '${_currentIndex + 1} / ${widget.mediaList.length}',
            style: const TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: PageView.builder(
          controller: _pageController,
          itemCount: widget.mediaList.length,
          onPageChanged: (i) {
            setState(() => _currentIndex = i);
          },
          itemBuilder: (context, index) {
            final item = widget.mediaList[index];
            final url = item['url'] as String;
            final type = item['type'] as String;
            switch (type) {
              case 'image':
                return InteractiveViewer(
                  child: SizedBox.expand(
                    child: CachedNetworkImage(
                      imageUrl: url,
                      fit: BoxFit.contain,
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      ),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.broken_image,
                        color: Colors.white,
                        size: 80,
                      ),
                    ),
                  ),
                );
              case 'gif':
                return InteractiveViewer(
                  child: SizedBox.expand(
                    child: CachedNetworkImage(
                      imageUrl: url,
                      fit: BoxFit.contain,
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      ),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.broken_image,
                        color: Colors.white,
                        size: 80,
                      ),
                    ),
                  ),
                );
              case 'video':
                return LayoutBuilder(
                  builder: (context, constraints) {
                    return Container(
                      width: constraints.maxWidth,
                      height: constraints.maxHeight,
                      color: Colors.black,
                      child: _VideoPlayerWidget(url: url, key: ValueKey(url)),
                    );
                  },
                );
              case 'document':
                return Container(
                  width: double.infinity,
                  height: double.infinity,
                  alignment: Alignment.center,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.picture_as_pdf,
                            color: Colors.white, size: 80,),
                        const SizedBox(height: 16),
                        Text(
                          url.split('/').last,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 18,),
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton.icon(
                          icon: const Icon(Icons.open_in_new),
                          label: const Text('Open PDF'),
                          onPressed: () async {
                            await launchUrl(Uri.parse(url));
                          },
                        ),
                      ],
                    ),
                  ),
                );
              default:
                return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}

class _VideoPlayerWidget extends StatefulWidget {
  const _VideoPlayerWidget({required this.url, super.key});
  final String url;

  @override
  State<_VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<_VideoPlayerWidget> {
  late VideoPlayerController _controller;
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.url)
      ..initialize().then((_) {
        setState(() => _initialized = true);
        _controller.play();
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_initialized) {
      return const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    }
    return GestureDetector(
      onTap: () {
        setState(() {
          _controller.value.isPlaying
              ? _controller.pause()
              : _controller.play();
        });
      },
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Center(
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio > 0
                  ? _controller.value.aspectRatio
                  : 16 / 9,
              child: VideoPlayer(_controller),
            ),
          ),
          VideoProgressIndicator(_controller, allowScrubbing: true),
          Positioned(
            bottom: 16,
            right: 16,
            child: FloatingActionButton(
              mini: true,
              backgroundColor: Colors.black54,
              onPressed: () {
                setState(() {
                  _controller.value.isPlaying
                      ? _controller.pause()
                      : _controller.play();
                });
              },
              child: Icon(
                _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
