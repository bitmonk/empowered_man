import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/profile/presentation/controllers/profile_controller.dart';
import 'package:empowered/features/tribe/presentation/controller/tribe_group_controller.dart';
import 'package:empowered/features/tribe/presentation/screen/widgets/tribe_widget/add_tribe_member.dart';
import 'package:empowered/features/tribe/presentation/screen/widgets/tribe_widget/customise_group.dart';

class AboutTab extends StatefulWidget {
  const AboutTab({required this.groupId, super.key});
  final String groupId;

  @override
  State<AboutTab> createState() => _AboutTabState();
}

class _AboutTabState extends State<AboutTab> {
  final TribeGroupController tribeController = Get.find<TribeGroupController>();
  List<String> members = [];

  bool get isUserCoach {
    return Get.find<ProfileController>().userProfile.value.isCoach ?? false;
  }

  @override
  void initState() {
    super.initState();
    // Load group details when the widget is initialized
    tribeController.loadGroupDetails(widget.groupId).then((_) {
      setState(() {
        members = tribeController.groupDetailModel.value.data?.about?.members
                ?.map((member) => member.user?.id.toString() ?? '')
                .toList() ??
            [];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final groupDetails = tribeController.groupDetailModel.value.data?.about;
      final isLoading =
          tribeController.groupDetailsState.value == TheStates.loading;
      final hasError =
          tribeController.groupDetailsState.value == TheStates.error;

      if (isLoading) {
        return const Center(child: CircularProgressIndicator());
      }

      if (hasError || groupDetails == null) {
        return const Center(
          child: Text(
            'Failed to load group details',
            style: TextStyle(color: Colors.white),
          ),
        );
      }

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
                        onTap: () => showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (context) => CustomiseGroup(
                            groupId: widget.groupId,
                          ),
                        ),
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
                Text(
                  groupDetails.name ?? 'Group Title',
                  style: const TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  groupDetails.about ?? 'No description available',
                  style: const TextStyle(color: Colors.white60),
                ),
                const SizedBox(height: 8),
                Text(
                  'Access Type: ${groupDetails.accessType ?? 'N/A'}',
                  style: const TextStyle(color: Colors.white60),
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
                    Expanded(
                      child: Text(
                        'Members (${groupDetails.memberCount ?? 0})',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    if (isUserCoach)
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (context) => AddTribeMember(
                              selectedMembers: members,
                              onMembersUpdated: (newMembers) {
                                setState(() {
                                  members = newMembers;
                                  // Update group members via editGroup
                                  tribeController.editGroup(
                                    groupId: widget.groupId,
                                    groupName: groupDetails.name,
                                    about: groupDetails.about,
                                    accessType: groupDetails.accessType,
                                    membersId: newMembers,
                                  );
                                });
                              },
                            ),
                          );
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
                ...groupDetails.members?.asMap().entries.map((entry) {
                      final index = entry.key;
                      final member = entry.value;
                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: CircleAvatar(
                          backgroundImage: member.user?.image != null
                              ? NetworkImage(member.user!.image!)
                              : Assets.images.chatUserPicOne.provider(),
                          radius: 20,
                          onBackgroundImageError: member.user?.image != null
                              ? (_, __) =>
                                  Assets.images.chatUserPicOne.provider()
                              : null,
                        ),
                        title: Text(
                          member.user?.fullName ?? 'Unknown',
                          style: const TextStyle(color: Colors.white),
                        ),
                        trailing: index == 0
                            ? Text(
                                isUserCoach ? 'Coach' : 'Admin',
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12,
                                ),
                              )
                            : isUserCoach
                                ? GestureDetector(
                                    onTap: () {
                                      tribeController.removeMember(
                                        groupId: widget.groupId,
                                        memberId:
                                            member.user?.id.toString() ?? '',
                                      );
                                    },
                                    child: const Text(
                                      'Remove',
                                      style: TextStyle(
                                        color: Colors.redAccent,
                                        fontSize: 12,
                                      ),
                                    ),
                                  )
                                : null,
                      );
                    }).toList() ??
                    [],
              ],
            ),
          ),
          const VerticalSpacing(20),
        ],
      );
    });
  }
}
