import 'package:chewie/chewie.dart';
import 'package:empowered/core/extension/extensions.dart';

import 'package:video_player/video_player.dart';

class AppVideoPlayer extends StatefulWidget {
  const AppVideoPlayer({
    this.videoUrl,
    super.key,
    this.showListener = false,
    this.onProgressUpdate,
    this.assets,
  });
  final String? videoUrl;
  final String? assets;
  final bool showListener;
  final ValueChanged<double>? onProgressUpdate;

  @override
  State<AppVideoPlayer> createState() => _AppVideoPlayerState();
}

class _AppVideoPlayerState extends State<AppVideoPlayer> {
  late VideoPlayerController _videoController;
  ChewieController? _chewieController;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _initializePlayer();
  }

  Future<void> _initializePlayer() async {
    try {
      setState(() {
        _errorMessage = null;
      });
      _videoController = widget.assets != null
          ? VideoPlayerController.asset(
              widget.assets!,
            )
          : VideoPlayerController.networkUrl(
              Uri.parse(widget.videoUrl!),
            );

      await _videoController.initialize();

      if (widget.showListener) {
        _videoController.addListener(() {
          final duration = _videoController.value.duration;
          final position = _videoController.value.position;

          if (duration.inMilliseconds == 0) return;

          final progress = position.inMilliseconds / duration.inMilliseconds;
          widget.onProgressUpdate?.call(progress);

          if (mounted) {
            setState(() {
              // _isVideoEnded = position >= duration;
            });
          }
        });
      }

      _chewieController = ChewieController(
        videoPlayerController: _videoController,
        errorBuilder: (context, errorMessage) => CustomErrorWidget(
          error: errorMessage,
        ),
        autoPlay: true,
        customControls: const MaterialControls(),
        materialProgressColors: ChewieProgressColors(
          playedColor: AppColors.primary500,
          handleColor: const Color.fromARGB(255, 2, 92, 167),
          bufferedColor: AppColors.textColor300,
        ),
      );

      setState(() {});
    } catch (e) {
      print(e);
      setState(() {
        _errorMessage = 'Failed to load video.\n$e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: _errorMessage != null
          ? Padding(
              padding: const EdgeInsets.all(8),
              child: CustomErrorWidget(
                error: _errorMessage,
                onPressed: _initializePlayer,
                verticlePadding: const EdgeInsets.symmetric(vertical: 100),
              ),
            )
          : ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: AspectRatio(
                aspectRatio: _videoController.value.aspectRatio,
                child: _chewieController != null &&
                        _chewieController!
                            .videoPlayerController.value.isInitialized
                    ? Chewie(controller: _chewieController!)
                    : const ColoredBox(
                        color: Colors.black,
                        child: LoadingWidget(),
                      ),
              ),
            ),
    ),);
  }

  @override
  void dispose() {
    _videoController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }
}
