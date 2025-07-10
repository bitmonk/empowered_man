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

  Widget _buildMediaPreview(BuildContext context, String url, String fileType,
      double width, double height,) {
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
                  _pickVideo(context);
                case 'Attachment':
                  _pickPDF(context);
                case 'Camera':
                  _takePicture(context);
                case 'GIF':
                  _pickGIF(context);
              }
            },
          );
        },
      ),
    );
  }

  Future<void> _pickVideo(BuildContext context) async {
    if (_isUploading) return;

    try {
      setState(() => _isUploading = true);

      final pickedVideo = await _picker.pickVideo(
        source: ImageSource.gallery,
        maxDuration: const Duration(seconds: 60), // Limit to 60 seconds
      );

      if (pickedVideo != null) {
        final file = File(pickedVideo.path);
        final fileSize = await file.length();
        if (fileSize > 50 * 1024 * 1024) {
          // 50MB limit for videos
          AppUtils.showErrorSnackbar(message: 'Video exceeds 50MB limit');
          return;
        }
        controller.addMedia(pickedVideo.path, 'video');
        AppUtils.showSnackbar(message: 'Video selected successfully');
      }
    } catch (e) {
      AppUtils.showErrorSnackbar(message: 'Failed to pick video: $e');
    } finally {
      setState(() => _isUploading = false);
    }
  }

  Future<void> _takePicture(BuildContext context) async {
    if (_isUploading) return;

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
        AppUtils.showSnackbar(message: 'Photo captured successfully');
      }
    } catch (e) {
      AppUtils.showErrorSnackbar(message: 'Failed to take picture: $e');
    } finally {
      setState(() => _isUploading = false);
    }
  }

  Future<void> _pickPDF(BuildContext context) async {
    if (_isUploading) return;

    try {
      setState(() => _isUploading = true);

      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (result != null && result.files.isNotEmpty) {
        final pdfPath = result.files.single.path;
        if (pdfPath != null) {
          final file = File(pdfPath);
          final fileSize = await file.length();
          if (fileSize > 10 * 1024 * 1024) {
            // 10MB limit
            AppUtils.showErrorSnackbar(message: 'PDF exceeds 10MB limit');
            return;
          }
          controller.addMedia(pdfPath, 'pdf');
          AppUtils.showSnackbar(message: 'PDF selected successfully');
        }
      }
    } catch (e) {
      AppUtils.showErrorSnackbar(message: 'Failed to pick PDF: $e');
    } finally {
      setState(() => _isUploading = false);
    }
  }

  Future<void> _pickGIF(BuildContext context) async {
    if (_isUploading) return;

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
            // 5MB limit
            AppUtils.showErrorSnackbar(message: 'GIF exceeds 5MB limit');
            return;
          }
          controller.addMedia(gifPath, 'gif');
          AppUtils.showSnackbar(message: 'GIF selected successfully');
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
