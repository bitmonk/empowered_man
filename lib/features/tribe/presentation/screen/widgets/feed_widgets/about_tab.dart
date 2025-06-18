import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/profile/presentation/controllers/profile_controller.dart'; // For AppColors

class AboutTab extends StatelessWidget {
  const AboutTab({super.key});
  bool get isUserCoach {
    return Get.find<ProfileController>().userProfile.value.isCoach ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.feedContainer,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      'About',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  if (isUserCoach)
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'Edit',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 14,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 8),
              const Text(
                'Group Title',
                style: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'This is placeholder text only, intended for visual demonstration purposes only. '
                'The content here is not meant to convey any specific information but to illustrate '
                'how text will appear in the final design. Please note that this text will be replaced '
                'with the approved content at the final stage. For now, it serves to provide a general '
                'idea of layout and formatting.',
                style: TextStyle(color: Colors.white60),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.feedContainer,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Members (23)',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  if (isUserCoach)
                    GestureDetector(
                      onTap: () {
                        // TODO: Open add member modal
                      },
                      child: const Text(
                        '+ Add Member',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 14,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 12),
              ...List.generate(
                9,
                (index) => ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: CircleAvatar(
                    backgroundImage: Assets.images.chatUserPicOne.provider(),
                    radius: 20,
                  ),
                  title: const Text(
                    'Liam Cooper',
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: index == 0
                      ? Text(
                          isUserCoach ? 'Coach' : 'Admin',
                          style: const TextStyle(
                              color: Colors.white70, fontSize: 12,),
                        )
                      : isUserCoach
                          ? GestureDetector(
                              onTap: () {
                                // TODO: Handle remove member
                              },
                              child: const Text(
                                'Remove',
                                style: TextStyle(
                                    color: Colors.redAccent, fontSize: 12,),
                              ),
                            )
                          : null,
                ),
              ),
            ],
          ),
        ),
        const VerticalSpacing(20),
      ],
    );
  }
}
