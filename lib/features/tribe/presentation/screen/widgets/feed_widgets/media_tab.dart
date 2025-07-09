import 'package:empowered/enum/the_states.dart';
import 'package:empowered/features/tribe/presentation/controller/tribe_group_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MediaTab extends StatefulWidget {
  const MediaTab({required this.groupId, super.key});
  final String groupId;

  @override
  State<MediaTab> createState() => _MediaTabState();
}

class _MediaTabState extends State<MediaTab> {
  final TribeGroupController controller = Get.find<TribeGroupController>();

  @override
  void initState() {
    super.initState();
    // Load group media when the widget is initialized
    controller.loadGroupMedia(widget.groupId);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final mediaData = controller.groupMediaModel.value.data;
      final isLoading = controller.groupMediaState.value == TheStates.loading;
      final hasError = controller.groupMediaState.value == TheStates.error;

      if (isLoading) {
        return const Center(child: CircularProgressIndicator());
      }

      if (hasError || mediaData == null) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Failed to load media',
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => controller.loadGroupMedia(widget.groupId),
                child: const Text('Retry'),
              ),
            ],
          ),
        );
      }

      final mediaList = mediaData.medias ?? [];
      final totalMedia = mediaData.meta?.total ?? 0;

      return ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Media ($totalMedia)', // Dynamic count from meta.total
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          if (mediaList.isEmpty)
            const Center(
              child: Text(
                'No media available',
                style: TextStyle(color: Colors.white60),
              ),
            )
          else
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: mediaList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemBuilder: (context, index) {
                final mediaUrl = mediaList[index];
                return ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    mediaUrl,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Center(child: CircularProgressIndicator());
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[300],
                        child: const Icon(Icons.error, color: Colors.red),
                      );
                    },
                  ),
                );
              },
            ),
        ],
      );
    });
  }
}
