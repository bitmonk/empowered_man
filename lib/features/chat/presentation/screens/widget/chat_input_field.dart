import 'dart:io';
import 'dart:math';

import 'package:agora_chat_sdk/agora_chat_sdk.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/chat/presentation/controllers/audio_player_controller.dart';
import 'package:empowered/features/chat/presentation/controllers/chat_controller.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record/record.dart';

class ChatInputField extends StatefulWidget {
  const ChatInputField({
    super.key,
    this.isNewMessage = false,
    this.isSquad = false,
    this.controller,
    this.onSend,
  });
  final bool isNewMessage;
  final bool isSquad;
  final TextEditingController? controller;
  final Function(String)? onSend;

  @override
  State<ChatInputField> createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<ChatInputField> {
  final controller = Get.find<ChatController>();
  late TextEditingController _textController;
  bool showOptions = false;
  File? selectedFile;
  File? selectedImageFromGallery;
  File? selectedImageFromCamera;
  File? selectedVideoFromCamera;
  final AudioRecorder _audioRecorder = AudioRecorder();
  bool _isRecording = false;
  String? selectedAudioPath;
  Duration? audioDuration;

  void toggleOptions() {
    setState(() {
      showOptions = !showOptions;
    });
  }

  @override
  void initState() {
    super.initState();
    _textController = widget.controller ?? TextEditingController();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _textController.dispose();
    }
    _audioRecorder.dispose();
    super.dispose();
  }

  Future<void> getAudioDuration() async {
    final player = AudioPlayer();
    try {
      await player.setFilePath(selectedAudioPath!);
      setState(() {
        audioDuration = player.duration;
      });
    } finally {
      await player.dispose();
    }
  }

  void clearSelection() {
    setState(() {
      selectedFile = null;
      selectedImageFromCamera = null;
      selectedVideoFromCamera = null;
      selectedImageFromGallery = null;
      selectedAudioPath = null;
      showOptions = false;
      audioDuration = null;
      _isRecording = false;
    });
  }

  Future<void> pickImagesFromGallery() async {
    final picker = ImagePicker();
    final picked = await picker.pickMedia();
    if (picked != null) {
      setState(() {
        selectedImageFromGallery = File(picked.path);
      });
    }
  }

  Future<void> pickImagesFromCamera() async {
    final picker = ImagePicker();
    final picked =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 100);
    if (picked != null) {
      setState(() {
        selectedImageFromCamera = File(picked.path);
      });
    }
  }

  Future<void> pickVideoFromCamera() async {
    final picker = ImagePicker();
    final picked = await picker.pickVideo(
      source: ImageSource.camera,
      maxDuration: const Duration(seconds: 20),
    );
    if (picked != null) {
      setState(() {
        selectedVideoFromCamera = File(picked.path);
      });
    }
  }

  Future<void> pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      allowCompression: true,
    );
    if (result != null && result.files.single.path != null) {
      setState(() {
        selectedFile = File(result.files.single.path!);
      });
    }
  }

  Future<void> recordAudio() async {
    final hasPermission = await _audioRecorder.hasPermission();
    if (!hasPermission) {
      await Permission.microphone.request();
    }

    if (_isRecording) {
      final path = await _audioRecorder.stop();
      if (path != null) {
        setState(() {
          _isRecording = false;
          selectedAudioPath = path;
        });
        await getAudioDuration();
      }
    } else {
      var tempDir = '';
      if (Platform.isAndroid) {
        var fp = await getExternalStorageDirectory();
        tempDir = fp!.path;
      } else if (Platform.isIOS) {
        var fp = await getApplicationSupportDirectory();
        tempDir = fp.path;
      }

      final path =
          '$tempDir/recording_${DateTime.now().millisecondsSinceEpoch}.m4a';
      var config = const RecordConfig();
      await _audioRecorder.start(
        config,
        path: path,
      );

      setState(() {
        showOptions = false;
        _isRecording = true;
        selectedAudioPath = null;
      });
    }
  }

  Widget buildSelectedAttachment() {
    if (selectedImageFromCamera != null) {
      return Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: SizedBox(
              height: 100,
              child: Image.file(selectedImageFromCamera!, fit: BoxFit.cover),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white),
              onPressed: clearSelection,
            ),
          ),
        ],
      );
    } else if (selectedVideoFromCamera != null) {
      return Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: SizedBox(
              height: 100,
              child: AppVideoPlayer(
                assets: selectedVideoFromCamera!.path,
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white),
              onPressed: clearSelection,
            ),
          ),
        ],
      );
    } else if (selectedImageFromGallery != null) {
      return Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 8),
            height: 100,
            child: isVideoFile(selectedImageFromGallery!)
                ? AppVideoPlayer(
                    assets: selectedImageFromGallery!.path,
                  )
                : Image.file(selectedImageFromGallery!, fit: BoxFit.cover),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white),
              onPressed: clearSelection,
            ),
          ),
        ],
      );
    } else if (selectedFile != null) {
      return ListTile(
        title: Text(
          selectedFile!.path.split('/').last,
          style: const TextStyle(color: Colors.white),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.close),
          onPressed: clearSelection,
        ),
      );
    } else if (selectedAudioPath != null) {
      return ListTile(
        title: Text(
          'Audio Recorded ${audioDuration?.inSeconds ?? 0} sec',
          style: const TextStyle(color: Colors.white),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.close),
          onPressed: clearSelection,
        ),
      );
    }
    return const SizedBox();
  }

  bool isVideoFile(File file) {
    final ext = file.path.toLowerCase();
    return ext.endsWith('.mp4') || ext.endsWith('.mov') || ext.endsWith('.avi');
  }

  bool get isAnyMediaSelected =>
      selectedFile != null ||
      selectedVideoFromCamera != null ||
      selectedImageFromCamera != null ||
      selectedImageFromGallery != null ||
      selectedAudioPath != null;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: const BoxDecoration(
        color: AppColors.bgBorder,
        borderRadius: BorderRadius.all(Radius.circular(24)),
      ),
      child: Column(
        children: [
          Obx(() {
            final replyMsg = controller.replyToMessage.value;
            if (replyMsg == null) return const SizedBox.shrink();
            final preview = (replyMsg.body is ChatTextMessageBody)
                ? (replyMsg.body as ChatTextMessageBody).content
                : '[${replyMsg.body.runtimeType}]';
            return Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Icon(Icons.reply, color: Colors.blue),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      preview,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: Colors.white70, fontStyle: FontStyle.italic,),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close,
                        color: Colors.white54, size: 20,),
                    onPressed: controller.clearReply,
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    splashRadius: 16,
                  ),
                ],
              ),
            );
          }),
          if (isAnyMediaSelected) buildSelectedAttachment(),
          if (showOptions && !isAnyMediaSelected && !_isRecording)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.camera_alt, color: AppColors.white),
                    onPressed: isAnyMediaSelected ? null : pickImagesFromCamera,
                  ),
                  IconButton(
                    icon: const Icon(Icons.image, color: AppColors.white),
                    onPressed:
                        isAnyMediaSelected ? null : pickImagesFromGallery,
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.video_camera_back,
                      color: AppColors.white,
                    ),
                    onPressed: isAnyMediaSelected ? null : pickVideoFromCamera,
                  ),
                  IconButton(
                    icon: Assets.images.chatAttachment.image(
                      height: 25,
                      width: 25,
                    ),
                    onPressed: isAnyMediaSelected ? null : pickFile,
                  ),
                  IconButton(
                    icon: Assets.images.chatMicrophone.image(
                      height: 25,
                      width: 25,
                    ),
                    onPressed: isAnyMediaSelected ? null : recordAudio,
                  ),
                ],
              ),
            ),
          Row(
            children: [
              if (!_isRecording )
                GestureDetector(
                  onTap: toggleOptions,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Transform.rotate(
                      angle: showOptions ? pi / 4 : 0,
                      child: Assets.images.addIconWithBackground
                          .svg(width: 40, height: 40),
                    ),
                  ),
                ),
              Expanded(
                child: _isRecording
                    ? Text(
                        'Recording...',
                        style: AppTextStyles.textBodyB2
                            .copyWith(color: AppColors.textColor200),
                      )
                    : TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: 4,
                        minLines: 1,
                        textInputAction: TextInputAction.newline,
                        onTap: () async {
                          await Future.delayed(
                            const Duration(milliseconds: 500),
                          );
                          controller.scrollToBottom();
                        },
                        controller: _textController, // Use correct controller
                        decoration: InputDecoration(
                          hintText: 'Message...',
                          hintStyle: AppTextStyles.textBodyB2
                              .copyWith(color: AppColors.textColor200),
                          border: InputBorder.none,
                        ),
                        style: const TextStyle(color: Colors.white),
                      ),
              ),
              if (_isRecording)
                InkWell(
                  onTap: recordAudio,
                  child: Padding(
                    padding: const EdgeInsets.all(8).copyWith(right: 10),
                    child: const Icon(
                      Icons.stop_circle,
                      color: AppColors.appRed,
                      size: 35,
                    ),
                  ),
                ),
              InkWell(
                onTap: () {
                  final text = _textController.text.trim();
                  if (text.isNotEmpty || isAnyMediaSelected) {
                    if (widget.onSend != null && text.isNotEmpty) {
                      // Thread view: Use onSend for text only
                      widget.onSend!(text);
                      _textController.clear();
                      clearSelection();
                    } else if (widget.isNewMessage) {
                      // New message modal
                      Navigator.pop(context);
                      AudioPlayerInitializer.initialize();
                      if (!widget.isSquad) {
                        controller.selectedConversationType.value =
                            ChatConversationType.Chat;
                        for (final e in controller.selectedUsers) {
                          controller.sendMessage(
                            targetID: e.username,
                            chatType: ChatConversationType.Chat,
                            text: text,
                            filePath: getSelectedFilePath(),
                            audioPath: selectedAudioPath,
                            audioDuration: audioDuration?.inSeconds,
                            inputController: _textController,
                          );
                        }
                        clearSelection();
                        controller.fetchConversations(isInitialLoad: true);
                      }
                    } else {
                      // ChatCoversationScreen
                      if (controller.messageToEdit.value != null) {
                        controller
                            .updateMessaage(content: text)
                            .then((_) => clearSelection());
                      } else {
                        controller
                            .sendMessage(
                              targetID:
                                  controller.selectedConversation.value?.id,
                              chatType:
                                  controller.selectedConversationType.value,
                              text: text,
                              filePath: getSelectedFilePath(),
                              audioPath: selectedAudioPath,
                              audioDuration: audioDuration?.inSeconds,
                              inputController: _textController,
                            )
                            .then((_) => clearSelection());
                      }
                    }
                  }
                },
                child: Assets.images.sendMessageIcon.svg(width: 40, height: 40),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String? getSelectedFilePath() {
    if (selectedImageFromCamera != null) {
      return selectedImageFromCamera!.path;
    } else if (selectedImageFromGallery != null) {
      return selectedImageFromGallery!.path;
    } else if (selectedFile != null) {
      return selectedFile!.path;
    } else if (selectedVideoFromCamera != null) {
      return selectedVideoFromCamera!.path;
    } else if (selectedAudioPath != null) {
      return selectedAudioPath!;
    }
    return null;
  }
}
