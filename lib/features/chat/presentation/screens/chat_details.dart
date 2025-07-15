import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/chat/presentation/controllers/chat_controller.dart';
import 'package:empowered/features/chat/presentation/screens/add_member.dart';
import 'package:empowered/features/profile/presentation/controllers/profile_controller.dart'; // Import the AddMember screen

class ChatDetails extends StatefulWidget {
  const ChatDetails({super.key});

  @override
  State<ChatDetails> createState() => _ChatDetailsState();
}

class _ChatDetailsState extends State<ChatDetails> {
  bool isExpanded = false; // Track the "See More" state
  final controller = Get.find<ChatController>();
  List<String> members = [];
  @override
  void initState() {
    super.initState();
    // Fetch the latest member list when the screen opens
    controller.getMemberList(isInitialLoad: true);
  }

  void openAddMember() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      builder: (context) => AddMember(
        selectedMembers: controller.groupMembers,
        onMembersUpdated: (newMembers) {
          setState(() {
            members = newMembers;
            // controller.fetchGroupInfo();
          });
        },
        allMembers: const [],
        // allMembers: chatController.allPossibleMembers,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 1,
      minChildSize: 0.5,
      builder: (context, scrollController) {
        return Obx(
          () => Container(
            decoration: const BoxDecoration(
              color: AppColors.bgMedium,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    controller: scrollController,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const VerticalSpacing(24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(width: 24),
                            const Text(
                              'Chat Details',
                              style: AppTextStyles.textHeadingH3,
                            ),
                            InkWell(
                              onTap: () => Navigator.pop(context),
                              child: const Icon(
                                Icons.close,
                                color: AppColors.textColor100,
                                size: 24,
                              ),
                            ),
                          ],
                        ),
                        const VerticalSpacing(12),
                        const Divider(color: AppColors.bgBorderVLight),
                        const VerticalSpacing(20),
                        controller.fetchGroupInfoState.value.showWidget(
                          error: () => CustomErrorWidget(
                            error: controller.fetchGroupInfoError.value,
                          ),
                          loading: () => const LoadingWidget(),
                          success: () {
                            final details = controller.groupDetails.value!;
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const VerticalSpacing(6),
                                Text(
                                  details.name ?? '',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.textColor50,
                                  ),
                                ),
                                const VerticalSpacing(12),
                                Text(
                                  details.description ?? '',
                                  maxLines: isExpanded ? null : 5,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: AppColors.textColor100,
                                  ),
                                ),
                                const VerticalSpacing(6),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 6, 6, 6),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        isExpanded = !isExpanded;
                                      });
                                    },
                                    child: Text(
                                      isExpanded ? 'See Less' : 'See dsg',
                                      style: AppTextStyles.textBodyB3.copyWith(
                                        color: AppColors.primary500,
                                      ),
                                    ),
                                  ),
                                ),
                                const Divider(
                                  color: AppColors.bgBorderVLight,
                                ),

                                // Members Section
                                const VerticalSpacing(16),
                                const Text(
                                  'Members',
                                  style: AppTextStyles.textBodyB1,
                                ),
                                const VerticalSpacing(12),
                                Text(
                                  'Total Members (${details.memberCount ?? 0})',
                                  style: AppTextStyles.textBodyB4,
                                ),
                                const VerticalSpacing(8),

                                // Add Member Button
                                TextButton(
                                  onPressed: openAddMember,
                                  child: Text(
                                    '+ Add Member',
                                    style: AppTextStyles.textBodyB3.copyWith(
                                      color: AppColors.primary500,
                                    ),
                                  ),
                                ),
                                Column(
                                  children: details.adminList?.map((member) {
                                        return ListTile(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                            vertical: 8,
                                          ),
                                          leading: ClipOval(
                                            child:
                                                Assets.images.profilePic.image(
                                              width: 40,
                                              height: 40,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          title: Row(
                                            children: [
                                              Text(
                                                member,
                                                style: AppTextStyles.textBodyB1,
                                              ),
                                              const HorizontalSpacing(6),
                                              // if (member == 'Liam Cooper')
                                              //   const CircleAvatar(
                                              //     radius: 2.5,
                                              //     backgroundColor:
                                              //         AppColors.color5CE0A0,
                                              //   ),
                                            ],
                                          ),
                                          trailing: const Text(
                                            'Admin',
                                            style: AppTextStyles.textSmallS2,
                                          ),
                                        );
                                      }).toList() ??
                                      [
                                        ListTile(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                            vertical: 8,
                                          ),
                                          leading: ClipOval(
                                            child:
                                                Assets.images.profilePic.image(
                                              width: 40,
                                              height: 40,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          title: Row(
                                            children: [
                                              Text(
                                                details.owner ?? '',
                                                style: AppTextStyles.textBodyB1,
                                              ),
                                              const HorizontalSpacing(6),
                                              // if (member == 'Liam Cooper')
                                              //   const CircleAvatar(
                                              //     radius: 2.5,
                                              //     backgroundColor:
                                              //         AppColors.color5CE0A0,
                                              //   ),
                                            ],
                                          ),
                                          trailing: const Padding(
                                            padding: EdgeInsets.only(
                                              right: 8,
                                            ),
                                            child: Text(
                                              'Admin',
                                              style: AppTextStyles.textSmallS2,
                                            ),
                                          ),
                                        ),
                                      ],
                                ),

                                // Members List
                                Column(
                                  children: details.memberList?.map((member) {
                                        return ListTile(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                            vertical: 8,
                                          ),
                                          leading: ClipOval(
                                            child:
                                                Assets.images.profilePic.image(
                                              width: 40,
                                              height: 40,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          title: Row(
                                            children: [
                                              Text(
                                                member,
                                                style: AppTextStyles.textBodyB1,
                                              ),
                                              const HorizontalSpacing(6),
                                              // if (member == 'Liam Cooper')
                                              //   const CircleAvatar(
                                              //     radius: 2.5,
                                              //     backgroundColor:
                                              //         AppColors.color5CE0A0,
                                              //   ),
                                            ],
                                          ),
                                          trailing:
                                              (Get.find<ProfileController>()
                                                      .userProfile
                                                      .value
                                                      .isCoach!)
                                                  ? IconButton(
                                                      onPressed: () {
                                                        controller
                                                            .removeMemberFromGroup(
                                                          members: [member],
                                                        );
                                                      },
                                                      icon: const Icon(
                                                        Icons.remove,
                                                        size: 20,
                                                        color: AppColors.appRed,
                                                      ),
                                                    )
                                                  : null,
                                        );
                                      }).toList() ??
                                      [const SizedBox.shrink()],
                                ),

                                const VerticalSpacing(20),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const VerticalSpacing(40),
              ],
            ),
          ),
        );
      },
    );
  }
}
