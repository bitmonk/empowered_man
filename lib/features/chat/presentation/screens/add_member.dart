import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/chat/presentation/controllers/chat_controller.dart';

class AddMember extends StatefulWidget {
  const AddMember({
    required this.selectedMembers,
    required this.onMembersUpdated,
    required this.allMembers,
    super.key,
  });
  final List<String> selectedMembers;
  final Function(List<String>) onMembersUpdated;
  final List<String> allMembers;

  @override
  State<AddMember> createState() => _AddMemberState();
}

class _AddMemberState extends State<AddMember> {
  final chatController = Get.find<ChatController>();
  late List<String> selectedMembers;
  late List<String> newMembersToAdd;
  TextEditingController searchUserController = TextEditingController();

  @override
  void initState() {
    super.initState();
    selectedMembers = List.from(widget.selectedMembers);
    newMembersToAdd = [];

    // Clear previous search results and controller
    WidgetsBinding.instance.addPostFrameCallback((_) {
      searchUserController.clear();
      // Clear existing results first
      chatController.agoraUserList.clear();
      chatController.searchUserAndChat(query: '');
    });
  }

  @override
  void dispose() {
    // Clear search when leaving the screen
    searchUserController.dispose();
    super.dispose();
  }

  void toggleMember(dynamic user) {
    setState(() {
      // Check if user is already in newMembersToAdd by username
      final username = user.username ?? user.toString();
      final existingIndex =
          newMembersToAdd.indexWhere((member) => member == username);

      if (existingIndex != -1) {
        newMembersToAdd.removeAt(existingIndex);
      } else {
        newMembersToAdd.add(username);
      }
    });
  }

  bool isUserSelected(dynamic user) {
    final username = user.username ?? user.toString();
    return newMembersToAdd.contains(username);
  }

  bool isUserAlreadyInGroup(dynamic user) {
    final username = user.username ?? user.toString();
    return selectedMembers.contains(username);
  }

  Future<void> addMembersToGroup() async {
    if (newMembersToAdd.isEmpty) {
      Navigator.pop(context);
      return;
    }

    try {
      // Use Agora's addUsersToGroup method
      await chatController.addMembersToGroup(members: newMembersToAdd);

      // Update the local state
      final updatedMembers = [...selectedMembers, ...newMembersToAdd];
      widget.onMembersUpdated(updatedMembers);

      // Refresh the member list in the parent
      await chatController.getMemberList(isInitialLoad: true);

      Navigator.pop(context);

      AppUtils.showSnackbar(
        message: '${newMembersToAdd.length} member(s) added successfully!',
      );
    } catch (e) {
      AppUtils.showErrorSnackbar(
        message: 'Failed to add members: $e',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: AppColors.bgMedium,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header with close button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 24),
              const Text(
                'Add Members',
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
          const GreyDivider(),
          const VerticalSpacing(12),

          // Display current group members
          if (selectedMembers.isNotEmpty) ...[
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Current Group Members',
                style: AppTextStyles.textBodyB3,
              ),
            ),
            const VerticalSpacing(12),
            Container(
              constraints: const BoxConstraints(maxHeight: 120),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: selectedMembers.length,
                itemBuilder: (context, index) {
                  final member = selectedMembers[index];
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(vertical: 4),
                    leading: ClipOval(
                      child: Assets.images.profilePic.image(
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      member,
                      style: AppTextStyles.textBodyB3,
                    ),
                    trailing: Icon(
                      Icons.group,
                      color: AppColors.primary500,
                      size: 20,
                    ),
                  );
                },
              ),
            ),
            const VerticalSpacing(12),
            const GreyDivider(),
            const VerticalSpacing(12),
          ],

          Expanded(
            child: SingleChildScrollView(
              controller: chatController.chatScreenScrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTextFormField(
                    controller: searchUserController,
                    hintText: 'Enter name to search...',
                    onChanged: (v) {
                      chatController.searchUserAndChat(query: v);
                    },
                  ),
                  const VerticalSpacing(10),
                  const Divider(color: Color(0xff1B3144)),

                  // To: @SelectedUsers - Only show if there are selected users
                  if (newMembersToAdd.isNotEmpty) ...[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: RichText(
                        text: TextSpan(
                          style: AppTextStyles.textBodyB3
                              .copyWith(color: Colors.white),
                          children: [
                            const TextSpan(text: 'To: @ '),
                            TextSpan(
                              text: newMembersToAdd.join(', '),
                              style: AppTextStyles.textBodyB3.copyWith(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Divider(color: Color(0xff1B3144)),
                  ],

                  // User List
                  Obx(() {
                    if (chatController.agoraUserList.isEmpty)
                      return const CustomErrorWidget(error: 'No user found');

                    return chatController.searchUserState.value.showWidget(
                      error: () => CustomErrorWidget(
                        error: chatController.searchUserError.value,
                      ),
                      loading: () => const LoadingWidget(),
                      success: () {
                        final availableUsers = chatController.agoraUserList
                            .where((user) => !isUserAlreadyInGroup(user))
                            .toList();
                        if (availableUsers.isEmpty) {
                          return const Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.group_add,
                                  size: 64,
                                  color: AppColors.textColor50,
                                ),
                                VerticalSpacing(16),
                                Text(
                                  'No new members available to add',
                                  style: AppTextStyles.textBodyB2,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          );
                        }
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: availableUsers.length,
                          itemBuilder: (context, index) {
                            final user = availableUsers[index];
                            final isSelected = isUserSelected(user);
                            return ListTile(
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 8,
                              ),
                              leading: ClipOval(
                                child: Assets.images.profilePic.image(
                                  width: 40,
                                  height: 40,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              title: Row(
                                children: [
                                  Text(
                                    user.nickname ?? user.username ?? '',
                                    style: AppTextStyles.textBodyB1,
                                  ),
                                  const HorizontalSpacing(4),
                                  if (index < 2)
                                    const CircleAvatar(
                                      radius: 2.5,
                                      backgroundColor: AppColors.color5CE0A0,
                                    ),
                                ],
                              ),
                              trailing: Checkbox(
                                value: isSelected,
                                onChanged: (_) => toggleMember(user),
                                side: const BorderSide(
                                    color: AppColors.textColor50),
                                activeColor: AppColors.primary500,
                              ),
                              // Removed onTap to prevent unwanted navigation
                              onTap: () => toggleMember(user),
                            );
                          },
                        );
                      },
                    );
                  }),
                  // Action buttons

                  const VerticalSpacing(20),
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const VerticalSpacing(20),
              Row(
                children: [
                  // Cancel button
                  Expanded(
                    child: AppOutlinedButton(
                      text: 'Cancel',
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  const HorizontalSpacing(10),
                  // Add Members button
                  Expanded(
                    child: AppOutlinedButton(
                      text: newMembersToAdd.isEmpty
                          ? 'Done'
                          : 'Add ${newMembersToAdd.length} Member${newMembersToAdd.length > 1 ? 's' : ''}',
                      onPressed: addMembersToGroup,
                    ),
                  ),
                ],
              ),
            ],
          ),
          VerticalSpacing(40),
        ],
      ),
    );
  }
}
