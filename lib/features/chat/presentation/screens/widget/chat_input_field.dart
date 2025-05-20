import 'dart:io';
import 'dart:math';

import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/chat/presentation/controllers/chat_controller.dart';
import 'package:empowered/features/chat/presentation/screens/chat_coversation_screen.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

class ChatInputField extends StatefulWidget {
  const ChatInputField({super.key, this.isNewMessage = false});
  final bool isNewMessage;

  @override
  State<ChatInputField> createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<ChatInputField> {
  final controller = Get.find<ChatController>();
  bool showOptions = false;
  File? selectedFile;
  File? selectedImageFromGallery;
  File? selectedImageFromCamera;
  String? selectedAudioPath;
  void toggleOptions() {
    setState(() {
      showOptions = !showOptions;
    });
  }

  void clearSelection() {
    setState(() {
      selectedFile = null;
      selectedImageFromCamera = null;
      selectedImageFromGallery = null;
      selectedAudioPath = null;
    });
  }

  Future<void> pickImagesFromGallery() async {
    final picker = ImagePicker();
    final picked =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 100);
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

  Future<void> pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null && result.files.single.path != null) {
      setState(() {
        selectedFile = File(result.files.single.path!);
      });
    }
  }

  Future<void> recordAudio() async {
    // Placeholder: show dialog or start recording
    setState(() {
      selectedAudioPath = 'path/to/audio.m4a';
    });
  }

  Widget buildSelectedAttachment() {
    if (selectedImageFromCamera != null) {
      return Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: SizedBox(
              // margin: const EdgeInsets.only(bottom: 8),
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
    } else if (selectedImageFromGallery != null) {
      return Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 8),
            height: 100,
            child: Image.file(selectedImageFromGallery!, fit: BoxFit.cover),
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
        title: Text(selectedFile!.path.split('/').last),
        trailing: IconButton(
          icon: const Icon(Icons.close),
          onPressed: clearSelection,
        ),
      );
    } else if (selectedAudioPath != null) {
      return ListTile(
        title: const Text('Audio Recorded'),
        trailing: IconButton(
          icon: const Icon(Icons.close),
          onPressed: clearSelection,
        ),
      );
    }
    return const SizedBox();
  }

  bool get isAnyMediaSelected =>
      selectedFile != null ||
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
          if (selectedFile != null ||
              selectedImageFromCamera != null ||
              selectedImageFromGallery != null ||
              selectedAudioPath != null)
            buildSelectedAttachment(),
          if (showOptions && !isAnyMediaSelected)
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
              GestureDetector(
                onTap: () {
                  toggleOptions();
                },
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
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 4,
                  minLines: 1,
                  textInputAction: TextInputAction.newline,
                  onTap: () async {
                    await Future.delayed(const Duration(milliseconds: 500));
                    controller.scrollToBottom();
                  },
                  controller: controller.chatController,
                  decoration: InputDecoration(
                    hintText: 'Message...',
                    hintStyle: AppTextStyles.textBodyB2
                        .copyWith(color: AppColors.textColor200),
                    border: InputBorder.none,
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              InkWell(
                onTap: () {
                  if (widget.isNewMessage) {
                    Navigator.pop(context);
                    Get.to(
                      () => const ChatCoversationScreen(
                        isSoloChat: false,
                        isGroupChat: true,
                      ),
                    );
                  } else {
                    controller
                        .sendMessage(
                            text: controller.chatController.text,
                            filePath: getSelectedFilePath(),
                            audioPath: selectedAudioPath,)
                        .then((_) => clearSelection());
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
    }
    return null;
  }
}
