import 'package:empowered/core/extension/extensions.dart';
import 'package:just_audio/just_audio.dart';

class AudioPlayerBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(
      AudioPlayerController(),
    );
  }
}

class AudioPlayerInitializer {
  static void initialize() {
    Get.put(
      AudioPlayerController(),
    );
  }

  static void destroy() {
    Get.delete<AudioPlayerController>();
  }
}

class AudioPlayerController extends GetxController {
  late AudioPlayer _audioPlayer;
  RxBool isPlaying = false.obs;

  RxnString selectedAudioId = RxnString();
  @override
  void onInit() {
    super.onInit();
    _audioPlayer = AudioPlayer();
    _audioPlayer.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        isPlaying.value = false;
      } else if (state.playing) {
        isPlaying.value = true;
      }
    });
  }

  Future<void> playVoiceMessage(String url) async {
    try {
      await _audioPlayer.setUrl(
          'https://actions.google.com/sounds/v1/alarms/digital_watch_alarm_long.ogg',);
      await _audioPlayer.play();
    } catch (e) {
      debugPrint('Error playing audio: $e');
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(content: Text('Failed to play audio message')),
      // );
    }
  }

  Future<void> stopAudio() async {
    try {
      await _audioPlayer.stop();
      isPlaying.value = false;
    } catch (e) {
      // Handle stop error
    }
  }

  Future<void> closeAudio() async {
    selectedAudioId.value = null;
    try {
      await _audioPlayer.dispose(); // This automatically stops playback too
      isPlaying.value = false;
    } catch (e) {
      // Handle dispose error
    }
  }

  @override
  void onClose() {
    _audioPlayer.dispose();
    super.onClose();
  }
}
