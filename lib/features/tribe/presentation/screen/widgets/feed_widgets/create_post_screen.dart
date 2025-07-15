import 'dart:io';

import 'package:empowered/core/extension/extensions.dart';
// import 'package:empowered/features/tribe/data/model/group_post_model.dart';
import 'package:empowered/features/tribe/presentation/controller/feed_page_controller.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class CreatePostScreen extends StatelessWidget {
  const CreatePostScreen({required this.groupId, super.key});
  final String groupId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<FeedPageController>();
    return Padding(
      padding: EdgeInsets.only(bottom: context.devicePaddingBottom),
      child: Scaffold(
        backgroundColor: const Color(0xFF18191A),
        appBar: AppBar(
          backgroundColor: const Color(0xFF18191A),
          elevation: 0,
          title:
              const Text('Create post', style: TextStyle(color: Colors.white)),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: () {
              controller.clearPostForm();
              Get.back();
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Center(
                child: Obx(
                  () => TextButton(
                    onPressed:
                        controller.createPostState.value == TheStates.loading
                            ? null
                            : () {
                                final text =
                                    controller.postTextController.text.trim();
                                final media = controller.selectedMedia.toList();
                                // Check if text is empty and no media is selected
                                if (text.isEmpty && media.isEmpty) {
                                  AppUtils.showErrorSnackbar(
                                    message: 'Please add text or media to post',
                                  );
                                  return;
                                }
                                if (text.isEmpty) {
                                  AppUtils.showErrorSnackbar(
                                      message: 'Please add some text to post');
                                  return;
                                }
                                controller.createPost(
                                  context: context,
                                  groupId: groupId,
                                  text: text,
                                  media: media,
                                );
                              },
                    child: Text(
                      'Post',
                      style: TextStyle(
                        color: controller.createPostState.value ==
                                TheStates.loading
                            ? Colors.grey
                            : Colors.blue,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: const PostBody(),
        bottomSheet: const PostOptionsSheet(),
      ),
    );
  }
}

class PostBody extends StatelessWidget {
  const PostBody({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<FeedPageController>();
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipOval(
                child: controller.userProfile != null
                    ? Image.network(
                        controller.userProfile,
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            Assets.images.leaderProfile.image(
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Assets.images.leaderProfile.image(
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.userFullName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          TextField(
            controller: controller.postTextController,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              hintText: "What's on your mind?",
              hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
              border: InputBorder.none,
            ),
            maxLines: null,
            keyboardType: TextInputType.multiline,
          ),
          const SizedBox(height: 16),
          Obx(
            () => Wrap(
              spacing: 6,
              runSpacing: 6,
              children:
                  controller.selectedMedia.asMap().entries.take(3).map((entry) {
                final index = entry.key;
                final url = entry.value;
                final fileType = controller.selectedMediaTypes[url] ?? 'image';
                final isLast =
                    index == 2 && controller.selectedMedia.length > 3;
                final additionalCount = controller.selectedMedia.length - 3;

                return Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: _buildMediaPreview(
                        context,
                        url,
                        fileType,
                        MediaQuery.of(context).size.width / 3 - 15,
                        150,
                      ),
                    ),
                    if (isLast)
                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            '+ $additionalCount',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: IconButton(
                        icon: const Icon(Icons.close, color: Colors.red),
                        onPressed: () {
                          controller.selectedMedia.remove(url);
                          controller.selectedMediaTypes.remove(url);
                        },
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMediaPreview(
    BuildContext context,
    String url,
    String fileType,
    double width,
    double height,
  ) {
    switch (fileType) {
      case 'pdf':
        return Container(
          width: width,
          height: height,
          color: Colors.grey[800],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.picture_as_pdf, color: Colors.white, size: 50),
              Text(
                url.split('/').last,
                style: const TextStyle(color: Colors.white, fontSize: 12),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        );
      case 'gif':
      case 'image':
        return Image.file(
          File(url),
          width: width,
          height: height,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => const Icon(
            Icons.broken_image,
            color: Colors.grey,
            size: 150,
          ),
        );
      case 'video':
        return FutureBuilder<String?>(
          future: VideoThumbnail.thumbnailFile(
            video: url,
            imageFormat: ImageFormat.JPEG,
            maxWidth: width.toInt(),
            quality: 75,
          ),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.data != null) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  Image.file(
                    File(snapshot.data!),
                    width: width,
                    height: height,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => const Icon(
                      Icons.broken_image,
                      color: Colors.grey,
                      size: 150,
                    ),
                  ),
                  Icon(
                    Icons.play_circle_filled,
                    color: Colors.white.withOpacity(0.7),
                    size: 50,
                  ),
                ],
              );
            }
            return Container(
              width: width,
              height: height,
              color: Colors.grey[800],
              child: const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
            );
          },
        );
      default:
        return const Icon(
          Icons.broken_image,
          color: Colors.grey,
          size: 150,
        );
    }
  }

  Widget _chip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: const Color(0xFF3A3B3C),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }
}

class PostOptionsSheet extends StatefulWidget {
  const PostOptionsSheet({super.key});

  @override
  State<PostOptionsSheet> createState() => _PostOptionsSheetState();
}

class _PostOptionsSheetState extends State<PostOptionsSheet> {
  bool _isUploading = false;
  final controller = Get.find<FeedPageController>();
  final ImagePicker _picker = ImagePicker();

  bool _canSelectMedia(String mediaType) {
    if (controller.selectedMedia.isEmpty) return true;
    final currentMediaTypes = controller.selectedMediaTypes.values.toSet();
    if (mediaType == 'pdf') {
      return currentMediaTypes.isEmpty;
    }
    return !currentMediaTypes.contains('pdf');
  }

  @override
  Widget build(BuildContext context) {
    final options = [
      _Option(icon: Icons.photo, label: 'Photo/video', color: Colors.green),
      _Option(
        icon: Icons.file_present,
        label: 'Attachment',
        color: Colors.orangeAccent,
      ),
      _Option(icon: Icons.camera_alt, label: 'Camera', color: Colors.blue),
      _Option(icon: Icons.gif_box, label: 'GIF', color: Colors.teal),
    ];

    Future<void> _pickImage(BuildContext context) async {
      if (_isUploading || !_canSelectMedia('image')) {
        if (!_canSelectMedia('image')) {
          AppUtils.showErrorSnackbar(
              message: 'Cannot add photos when a PDF is selected');
        }
        return;
      }
      try {
        setState(() => _isUploading = true);
        final pickedImages = await _picker.pickMultiImage(
          maxWidth: 1920,
          maxHeight: 1080,
          imageQuality: 85,
        );
        if (pickedImages.isNotEmpty) {
          for (final img in pickedImages) {
            controller.addMedia(img.path, 'image');
          }
        }
      } catch (e) {
        AppUtils.showErrorSnackbar(message: 'Failed to pick photos: $e');
      } finally {
        setState(() => _isUploading = false);
      }
    }

    void _showPhotoVideoPicker(BuildContext context) {
      if (!_canSelectMedia('image') || !_canSelectMedia('video')) {
        AppUtils.showErrorSnackbar(
            message: 'Cannot add photos or videos when a PDF is selected');
        return;
      }
      showModalBottomSheet(
        context: context,
        backgroundColor: const Color(0xFF242526),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        builder: (ctx) => SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.photo, color: Colors.green),
                title:
                    const Text('Photo', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(ctx);
                  _pickImage(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.videocam, color: Colors.blue),
                title:
                    const Text('Video', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(ctx);
                  _pickVideo(context);
                },
              ),
            ],
          ),
        ),
      );
    }

    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      decoration: const BoxDecoration(
        color: Color(0xFF242526),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemCount: options.length,
        itemBuilder: (_, index) {
          final item = options[index];
          return ListTile(
            leading: Icon(item.icon, color: item.color),
            title:
                Text(item.label, style: const TextStyle(color: Colors.white)),
            onTap: () {
              if (_isUploading) return;
              switch (item.label) {
                case 'Photo/video':
                  _showPhotoVideoPicker(context);
                  break;
                case 'Attachment':
                  _pickPDF(context);
                  break;
                case 'Camera':
                  _takePicture(context);
                  break;
                case 'GIF':
                  _pickGIF(context);
                  break;
              }
            },
          );
        },
      ),
    );
  }

  Future<void> _pickVideo(BuildContext context) async {
    if (_isUploading || !_canSelectMedia('video')) {
      if (!_canSelectMedia('video')) {
        AppUtils.showErrorSnackbar(
            message: 'Cannot add videos when a PDF is selected');
      }
      return;
    }
    try {
      setState(() => _isUploading = true);
      final pickedVideos = await FilePicker.platform.pickFiles(
        type: FileType.video,
        allowMultiple: true,
      );
      if (pickedVideos != null && pickedVideos.files.isNotEmpty) {
        for (final file in pickedVideos.files) {
          if (file.path != null) {
            final videoFile = File(file.path!);
            final fileSize = await videoFile.length();
            if (fileSize > 50 * 1024 * 1024) {
              AppUtils.showErrorSnackbar(message: 'A video exceeds 50MB limit');
              continue;
            }
            controller.addMedia(file.path!, 'video');
          }
        }
      }
    } catch (e) {
      AppUtils.showErrorSnackbar(message: 'Failed to pick videos: $e');
    } finally {
      setState(() => _isUploading = false);
    }
  }

  Future<void> _takePicture(BuildContext context) async {
    if (_isUploading || !_canSelectMedia('image')) {
      if (!_canSelectMedia('image')) {
        AppUtils.showErrorSnackbar(
            message: 'Cannot add photos when a PDF is selected');
      }
      return;
    }
    try {
      setState(() => _isUploading = true);
      final pickedImage = await _picker.pickImage(
        source: ImageSource.camera,
        maxWidth: 1920,
        maxHeight: 1080,
        imageQuality: 85,
      );
      if (pickedImage != null) {
        controller.addMedia(pickedImage.path, 'image');
      }
    } catch (e) {
      AppUtils.showErrorSnackbar(message: 'Failed to take picture: $e');
    } finally {
      setState(() => _isUploading = false);
    }
  }

  Future<void> _pickPDF(BuildContext context) async {
    if (_isUploading || !_canSelectMedia('pdf')) {
      if (!_canSelectMedia('pdf')) {
        AppUtils.showErrorSnackbar(
            message: 'Cannot add PDF when other media types are selected');
      }
      return;
    }
    try {
      setState(() => _isUploading = true);
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
        allowMultiple: false, // Restrict to single file selection
      );
      if (result != null && result.files.isNotEmpty) {
        final pdfPath = result.files.single.path;
        if (pdfPath != null) {
          if (!pdfPath.toLowerCase().endsWith('.pdf')) {
            AppUtils.showErrorSnackbar(
                message: 'Only PDF files are allowed for attachments');
            return;
          }
          final file = File(pdfPath);
          final fileSize = await file.length();
          if (fileSize > 10 * 1024 * 1024) {
            AppUtils.showErrorSnackbar(message: 'PDF exceeds 10MB limit');
            return;
          }
          controller.addMedia(pdfPath, 'pdf');
        }
      }
    } catch (e) {
      AppUtils.showErrorSnackbar(message: 'Failed to pick PDF: $e');
    } finally {
      setState(() => _isUploading = false);
    }
  }

  Future<void> _pickGIF(BuildContext context) async {
    if (_isUploading || !_canSelectMedia('gif')) {
      if (!_canSelectMedia('gif')) {
        AppUtils.showErrorSnackbar(
            message: 'Cannot add GIF when a PDF is selected');
      }
      return;
    }
    try {
      setState(() => _isUploading = true);
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['gif'],
      );
      if (result != null && result.files.isNotEmpty) {
        final gifPath = result.files.single.path;
        if (gifPath != null) {
          final file = File(gifPath);
          final fileSize = await file.length();
          if (fileSize > 5 * 1024 * 1024) {
            AppUtils.showErrorSnackbar(message: 'GIF exceeds 5MB limit');
            return;
          }
          controller.addMedia(gifPath, 'gif');
        }
      }
    } catch (e) {
      AppUtils.showErrorSnackbar(message: 'Failed to pick GIF: $e');
    } finally {
      setState(() => _isUploading = false);
    }
  }
}

class _Option {
  _Option({required this.icon, required this.label, required this.color});
  final IconData icon;
  final String label;
  final Color color;
}
