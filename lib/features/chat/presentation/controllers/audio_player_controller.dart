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
  late AudioPlayer audioPlayer;
  RxBool isPlaying = false.obs;

  RxnString selectedAudioId = RxnString();
  @override
  void onInit() {
    super.onInit();
    audioPlayer = AudioPlayer();
    audioPlayer.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        isPlaying.value = false;
        selectedAudioId.value = null;
      } else if (state.playing) {
        isPlaying.value = true;
      } else {
        isPlaying.value = false;
      }
    });
  }

  Future<void> playVoiceMessage(String url, {String? audioId}) async {
    try {
      if (isPlaying.value) {
        await audioPlayer.stop();
      }
      selectedAudioId.value = audioId;
      await audioPlayer.setUrl(url);
      await audioPlayer.play();
    } catch (e) {
      debugPrint('Error playing audio: $e');
    }
  }

  Future<void> stopAudio() async {
    try {
      await audioPlayer.stop();
      isPlaying.value = false;
      selectedAudioId.value = null;
    } catch (e) {
      //
    }
  }

  Future<void> closeAudio() async {
    selectedAudioId.value = null;
    try {
      await audioPlayer.dispose(); // This automatically stops playback too
      isPlaying.value = false;
    } catch (e) {
      // Handle dispose error
    }
  }

  @override
  void onClose() {
    audioPlayer.dispose();
    super.onClose();
  }
}
