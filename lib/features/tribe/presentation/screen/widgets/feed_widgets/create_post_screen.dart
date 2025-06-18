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
              const CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/user.jpg'), // Replace with actual image
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Upasana Khatiwada', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Wrap(
                    spacing: 4,
                    children: [
                      _chip('Friends'),
                      _chip('+ Album'),
                      _chip('Off'),
                      _chip('Off'),
                      _chip('+ AI label off'),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text("What's on your mind?", style: TextStyle(color: Colors.grey, fontSize: 18)),
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
      child: Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
    );
  }
}

class PostOptionsSheet extends StatelessWidget {
  const PostOptionsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final options = [
      _Option(icon: Icons.photo, label: 'Photo/video', color: Colors.green),
      _Option(icon: Icons.person_add, label: 'Tag people', color: Colors.blue),
      _Option(icon: Icons.emoji_emotions, label: 'Feeling/activity', color: Colors.yellow),
      _Option(icon: Icons.location_on, label: 'Check in', color: Colors.red),
      _Option(icon: Icons.videocam, label: 'Live video', color: Colors.pink),
      _Option(icon: Icons.text_fields, label: 'Background color', color: Colors.teal),
      _Option(icon: Icons.camera_alt, label: 'Camera', color: Colors.blue),
      _Option(icon: Icons.gif_box, label: 'GIF', color: Colors.teal),
      _Option(icon: Icons.flag, label: 'Life event', color: Colors.blue),
      _Option(icon: Icons.music_note, label: 'Music', color: Colors.orange),
      _Option(icon: Icons.calendar_today, label: 'Tag event', color: Colors.redAccent),
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
            title: Text(item.label, style: const TextStyle(color: Colors.white)),
            onTap: () {},
          );
        },
      ),
    );
  }
}

class _Option {

  _Option({required this.icon, required this.label, required this.color});
  final IconData icon;
  final String label;
  final Color color;
}
