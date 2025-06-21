import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/tribe/presentation/controller/feed_page_controller.dart';
import 'package:empowered/features/tribe/presentation/screen/widgets/feed_widgets/feed_post.dart';

class PostDetailScreen extends StatelessWidget {
  final Map<String, dynamic>? post;

  const PostDetailScreen({ this.post, super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<FeedPageController>();
    final postIndex = controller.posts.indexWhere((p) => p['id'] == post!['id']);

    return Scaffold(
      appBar: AppBar(
        title: Text('Post by ${post!['userName']}'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FeedPost(
            post: post!,
            postIndex: postIndex != -1 ? postIndex : 0,
          ),
        ),
      ),
    );
  }
}
