import 'package:chewie/chewie.dart';
import 'package:empowered/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class AppVideoPlayer extends StatefulWidget {
  const AppVideoPlayer({required this.videoUrl, super.key});
  final String videoUrl;

  @override
  State<AppVideoPlayer> createState() => _AppVideoPlayerState();
}

class _AppVideoPlayerState extends State<AppVideoPlayer> {
  late VideoPlayerController _videoController;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    _initializePlayer();
  }

  Future<void> _initializePlayer() async {
    _videoController = VideoPlayerController.networkUrl(
      Uri.parse(
        widget.videoUrl,
      ),
    );

    await _videoController.initialize();
    _chewieController = ChewieController(
      videoPlayerController: _videoController,

      customControls: const MaterialControls(), // Default material controls
      materialProgressColors: ChewieProgressColors(
        playedColor: AppColors.primary500,
        handleColor: const Color.fromARGB(255, 2, 92, 167),
        bufferedColor: AppColors.textColor300,
      ),
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: AspectRatio(
        aspectRatio: _videoController.value.aspectRatio,
        child: _chewieController != null && _videoController.value.isInitialized
            ? Chewie(controller: _chewieController!)
            : Container(
                color: Colors.black,
                child: const Center(
                  child: CircularProgressIndicator(color: Colors.white),
                ),
              ),
      ),
    );
  }

  @override
  void dispose() {
    _videoController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }
}
