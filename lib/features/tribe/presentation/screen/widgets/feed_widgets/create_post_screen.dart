import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/tribe/presentation/controller/feed_page_controller.dart';
import 'package:empowered/gen/assets.gen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: CreatePostScreen()));
}

class CreatePostScreen extends StatelessWidget {
  const CreatePostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF18191A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF18191A),
        elevation: 0,
        title: const Text('Create post', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () {},
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Center(
              child: Text('Post', style: TextStyle(color: Colors.grey)),
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
                  const Text('Upasana Khatiwada',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Wrap(
                    spacing: 4,
                    children: [
                      _chip('Friends'),
                      _chip('+ Album'),
                      _chip('Off'),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text("What's on your mind?",
              style: TextStyle(color: Colors.grey, fontSize: 18)),
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
      child: Text(label,
          style: const TextStyle(color: Colors.white, fontSize: 12)),
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

  @override
  Widget build(BuildContext context) {
    final options = [
      _Option(icon: Icons.photo, label: 'Photo/video', color: Colors.green),
      _Option(
          icon: Icons.emoji_emotions,
          label: 'Feeling/activity',
          color: Colors.yellow),
      _Option(icon: Icons.camera_alt, label: 'Camera', color: Colors.blue),
      _Option(icon: Icons.gif_box, label: 'GIF', color: Colors.teal),
    ];

    return Container(
      height: MediaQuery.of(context).size.height * 0.45,
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
            onTap: () {},
          );
        },
      ),
    );
  }

  // Future<void> _pickImage(BuildContext context) async {
  //   // UiHelper.showloaderdialog(context);
  //   try {
  //     setState(() => _isUploading = true);
  //     final pickedImage = await AppUtils.pickImage(context);
  //     if (pickedImage != null) {
  //       setState(() {
  //         controller.selectedImage.value = pickedImage;
  //       });
  //       await controller.uploadMedia();
  //     }
  //   } catch (e) {
  //     AppUtils.showErrorSnackbar(message: 'Failed to pick image');
  //   } finally {
  //     setState(() => _isUploading = false);
  //     // Navigator.pop(Get.overlayContext!);
  //   }
  // }
}

class _Option {
  _Option({required this.icon, required this.label, required this.color});
  final IconData icon;
  final String label;
  final Color color;
}
