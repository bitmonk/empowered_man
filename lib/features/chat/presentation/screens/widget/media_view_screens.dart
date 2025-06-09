import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:chewie/chewie.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:just_audio/just_audio.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:video_player/video_player.dart';

class FullscreenImageView extends StatelessWidget {
  const FullscreenImageView({
    required this.imagePath,
    super.key,
    this.color = Colors.grey,
  });
  final String imagePath;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      body: Stack(
        children: [
          PhotoViewGallery.builder(
            itemCount: 1,
            builder: (context, index) {
              return PhotoViewGalleryPageOptions(
                imageProvider: NetworkImage(imagePath),
                minScale: PhotoViewComputedScale.contained,
                maxScale: PhotoViewComputedScale.covered * 3, // Zoom up to 3x
                heroAttributes: PhotoViewHeroAttributes(tag: imagePath),
              );
            },
            scrollPhysics: const BouncingScrollPhysics(),
            backgroundDecoration: const BoxDecoration(color: Colors.grey),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 16,
            right: 16,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.close, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FullscreenVideoView extends StatefulWidget {
  const FullscreenVideoView({required this.videoPath, super.key});
  final String videoPath;

  @override
  State<FullscreenVideoView> createState() => _FullscreenVideoViewState();
}

class _FullscreenVideoViewState extends State<FullscreenVideoView> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  Future<void> _initializeVideo() async {
    try {
      _videoPlayerController =
          VideoPlayerController.networkUrl(Uri.parse(widget.videoPath));
      await _videoPlayerController.initialize();

      _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController,
        autoPlay: true,
        aspectRatio: _videoPlayerController.value.aspectRatio,
      );

      if (mounted) {
        setState(() {
          _isInitialized = true;
        });
      }
    } catch (e) {
      debugPrint('Error initializing fullscreen video: $e');
    }
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: _isInitialized && _chewieController != null
              ? Chewie(controller: _chewieController!)
              : const LoadingWidget(),
        ),
      ),
    );
  }
}
// class FullscreenImageView extends StatelessWidget {
//   const FullscreenImageView({
//     required this.imagePath,
//     super.key,
//     this.color = Colors.grey,
//   });
//   final String imagePath;
//   final Color? color;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: color,
//       body: Stack(
//         children: [
//           PhotoViewGallery.builder(
//             itemCount: 1,
//             builder: (context, index) {
//               return PhotoViewGalleryPageOptions(
//                 imageProvider: NetworkImage(imagePath),
//                 minScale: PhotoViewComputedScale.contained,
//                 maxScale: PhotoViewComputedScale.covered * 3, // Zoom up to 3x
//                 heroAttributes: PhotoViewHeroAttributes(tag: imagePath),
//               );
//             },
//             scrollPhysics: const BouncingScrollPhysics(),
//             backgroundDecoration: const BoxDecoration(color: Colors.grey),
//           ),
//           Positioned(
//             top: MediaQuery.of(context).padding.top + 16,
//             right: 16,
//             child: GestureDetector(
//               onTap: () => Navigator.pop(context),
//               child: const CircleAvatar(
//                 backgroundColor: Colors.white,
//                 child: Icon(Icons.close, color: Colors.black),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class FullscreenVideoView extends StatefulWidget {
//   const FullscreenVideoView({required this.videoPath, super.key});
//   final String videoPath;

//   @override
//   State<FullscreenVideoView> createState() => _FullscreenVideoViewState();
// }

// class _FullscreenVideoViewState extends State<FullscreenVideoView> {
//   late VideoPlayerController _videoPlayerController;
//   ChewieController? _chewieController;
//   bool _isInitialized = false;

//   @override
//   void initState() {
//     super.initState();
//     _initializeVideo();
//   }

//   Future<void> _initializeVideo() async {
//     try {
//       _videoPlayerController =
//           VideoPlayerController.networkUrl(Uri.parse(widget.videoPath));
//       await _videoPlayerController.initialize();

//       _chewieController = ChewieController(
//         videoPlayerController: _videoPlayerController,
//         autoPlay: true,
//         aspectRatio: _videoPlayerController.value.aspectRatio,
//       );

//       if (mounted) {
//         setState(() {
//           _isInitialized = true;
//         });
//       }
//     } catch (e) {
//       debugPrint('Error initializing fullscreen video: $e');
//     }
//   }

//   @override
//   void dispose() {
//     _videoPlayerController.dispose();
//     _chewieController?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: SafeArea(
//         child: Center(
//           child: _isInitialized && _chewieController != null
//               ? Chewie(controller: _chewieController!)
//               : const LoadingWidget(),
//         ),
//       ),
//     );
//   }
// }

// class CustomAudioPlayer extends StatefulWidget {
//   const CustomAudioPlayer({
//     required this.url,
//     super.key,
//     this.isMine = false,
//   });
//   final String url;
//   final bool isMine;

//   @override
//   State<CustomAudioPlayer> createState() => _CustomAudioPlayerState();
// }

// class _CustomAudioPlayerState extends State<CustomAudioPlayer> {
//   late AudioPlayer _audioPlayer;

//   @override
//   void initState() {
//     super.initState();
//     _audioPlayer = AudioPlayer()..setUrl(widget.url);
//   }

//   @override
//   void dispose() {
//     _audioPlayer.dispose();
//     super.dispose();
//   }

//   Widget _buildControls() {
//     return StreamBuilder<PlayerState>(
//       stream: _audioPlayer.playerStateStream,
//       builder: (context, snapshot) {
//         final playerState = snapshot.data;
//         final processingState = playerState?.processingState;
//         final playing = playerState?.playing;

//         if (processingState == ProcessingState.loading ||
//             processingState == ProcessingState.buffering) {
//           return const Padding(
//             padding: EdgeInsets.all(8),
//             child: SizedBox(
//               width: 20,
//               height: 20,
//               child: CircularProgressIndicator(
//                 strokeWidth: 2,
//                 color: Colors.white,
//               ),
//             ),
//           );
//         } else if (playing != true) {
//           return IconButton(
//             icon: const Icon(
//               Icons.play_arrow,
//               color: AppColors.white,
//             ),
//             iconSize: 32,
//             onPressed: _audioPlayer.play,
//           );
//         } else if (processingState != ProcessingState.completed) {
//           return IconButton(
//             icon: const Icon(
//               Icons.pause,
//               color: AppColors.white,
//             ),
//             iconSize: 32,
//             onPressed: _audioPlayer.pause,
//           );
//         } else {
//           return IconButton(
//             icon: const Icon(
//               Icons.replay,
//               color: AppColors.white,
//             ),
//             iconSize: 32,
//             onPressed: () => _audioPlayer.seek(Duration.zero),
//           );
//         }
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Wrap(
//       spacing: 8,
//       runSpacing: 8,
//       children: [
//         Container(
//           width: 200,
//           // padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
//           decoration: BoxDecoration(
//             color: widget.isMine ? AppColors.primary500 : Colors.grey[200],
//             borderRadius: BorderRadius.circular(20),
//           ),
//           child: Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               _buildControls(),
//               const SizedBox(width: 4),
//               Expanded(
//                 child: StreamBuilder<Duration>(
//                   stream: _audioPlayer.positionStream,
//                   builder: (context, snapshot) {
//                     final position = snapshot.data ?? Duration.zero;
//                     return StreamBuilder<Duration?>(
//                       stream: _audioPlayer.durationStream,
//                       builder: (context, snapshot) {
//                         final total = snapshot.data ?? Duration.zero;
//                         return ProgressBar(
//                           progress: position,
//                           total: total,
//                           onSeek: _audioPlayer.seek,
//                           timeLabelTextStyle: const TextStyle(fontSize: 12),
//                           baseBarColor: Colors.grey[400],
//                           progressBarColor: Colors.white,
//                           thumbColor: Colors.white,
//                         );
//                       },
//                     );
//                   },
//                 ),
//               ),
//               const SizedBox(width: 8),
//               const Icon(
//                 Icons.volume_up,
//                 color: AppColors.baseWhite,
//               ),
//               const SizedBox(width: 8),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
