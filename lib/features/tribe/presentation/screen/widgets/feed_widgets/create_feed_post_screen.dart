import 'package:empowered/core/extension/extensions.dart';
// import 'package:empowered/features/tribe/data/model/group_post_model.dart';
import 'package:empowered/features/tribe/presentation/controller/feed_page_controller.dart';
import 'package:image_picker/image_picker.dart';

class CreatePostScreen extends StatelessWidget {
  const CreatePostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<FeedPageController>();
    return Scaffold(
      backgroundColor: const Color(0xFF18191A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF18191A),
        elevation: 0,
        title: const Text('Create post', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () {
            controller.selectedMedia.clear();
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
                              // controller.createPost(
                              //   groupId: groupId,
                              //   text: text,
                              //   media: media,
                              // );
                            },
                  child: Text(
                    'Post',
                    style: TextStyle(
                      color:
                          controller.createPostState.value == TheStates.loading
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
                child: Assets.images.leaderProfile.image(
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
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Wrap(
                  //   spacing: 4,
                  //   children: [
                  //     _chip('Friends'),
                  //     _chip('+ Album'),
                  //     _chip('Off'),
                  //   ],
                  // ),
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
                final isLast =
                    index == 2 && controller.selectedMedia.length > 3;
                final additionalCount = controller.selectedMedia.length - 3;

                return Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        url,
                        width: MediaQuery.of(context).size.width / 3 - 15,
                        height: 150,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(
                          Icons.broken_image,
                          color: Colors.grey,
                          size: 150,
                        ),
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
                            '+ ${additionalCount}',
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
        icon: Icons.emoji_emotions,
        label: 'Feeling/activity',
        color: Colors.yellow,
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
            onTap: item.label == 'Photo/video'
                ? () => _pickMultipleImages(context)
                : item.label == 'Camera'
                    ? () => _takePicture(context)
                    : () {},
          );
        },
      ),
    );
  }

  Future<void> _pickMultipleImages(BuildContext context) async {
    if (_isUploading) return;

    try {
      setState(() => _isUploading = true);

      // Pick multiple images from gallery
      final pickedImages = await _picker.pickMultiImage(
        maxWidth: 1920,
        maxHeight: 1080,
        imageQuality: 85,
      );

      if (pickedImages.isNotEmpty) {
        var imagePaths = pickedImages.map((image) => image.path).toList();

        controller.selectedMedia.addAll(imagePaths);

        // AppUtils.showSnackbar(
        //   message: '${pickedImages.length} image(s) selected successfully',
        // );
      }
    } catch (e) {
      AppUtils.showErrorSnackbar(message: 'Failed to pick images: $e');
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
        controller.selectedMedia.add(pickedImage.path);

        AppUtils.showSnackbar(message: 'Photo captured successfully');
      }
    } catch (e) {
      AppUtils.showErrorSnackbar(message: 'Failed to take picture: $e');
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
