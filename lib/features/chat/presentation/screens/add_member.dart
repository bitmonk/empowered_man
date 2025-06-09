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
  
  @override
  void initState() {
    super.initState();
    selectedMembers = List.from(widget.selectedMembers);
    newMembersToAdd = [];
  }

  void toggleMember(String member) {
    setState(() {
      if (newMembersToAdd.contains(member)) {
        newMembersToAdd.remove(member);
      } else {
        newMembersToAdd.add(member);
      }
    });
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
    // Filter out members who are already in the group
    final availableMembers = widget.allMembers
        .where((member) => !selectedMembers.contains(member))
        .toList();

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

          // Add new members section
          if (availableMembers.isNotEmpty) ...[
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Add New Members',
                style: AppTextStyles.textBodyB3,
              ),
            ),
            const VerticalSpacing(16),

            // Show selected members to add
            if (newMembersToAdd.isNotEmpty) ...[
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.primary500.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.primary500.withOpacity(0.3)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Selected to Add (${newMembersToAdd.length})',
                      style: AppTextStyles.textBodyB3.copyWith(
                        color: AppColors.primary500,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const VerticalSpacing(8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 4,
                      children: newMembersToAdd.map((member) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primary500,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                member,
                                style: AppTextStyles.textBodyB3.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                              const HorizontalSpacing(4),
                              GestureDetector(
                                onTap: () => toggleMember(member),
                                child: const Icon(
                                  Icons.close,
                                  size: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              const VerticalSpacing(16),
            ],

            // List of available members to add
            Expanded(
              child: ListView.builder(
                itemCount: availableMembers.length,
                itemBuilder: (context, index) {
                  final member = availableMembers[index];
                  final isSelected = newMembersToAdd.contains(member);
                  
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(vertical: 8),
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
                          member,
                          style: AppTextStyles.textBodyB1,
                        ),
                        const HorizontalSpacing(4),
                        if (index < 2) // Show online indicator for first 2 members
                          const CircleAvatar(
                            radius: 2.5,
                            backgroundColor: AppColors.color5CE0A0,
                          ),
                      ],
                    ),
                    trailing: Checkbox(
                      value: isSelected,
                      onChanged: (_) => toggleMember(member),
                      side: const BorderSide(color: AppColors.textColor50),
                      activeColor: AppColors.primary500,
                    ),
                    onTap: () => toggleMember(member),
                  );
                },
              ),
            ),
          ] else ...[
            // No available members to add
            const Expanded(
              child: Center(
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
              ),
            ),
          ],

          // Action buttons
          if (availableMembers.isNotEmpty) ...[
            const VerticalSpacing(20),
            Row(
              children: [
                Expanded(
                  child: AppOutlinedButton.orange(
                    text: 'Cancel',
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                const HorizontalSpacing(12),
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
        ],
      ),
    );
  }
}