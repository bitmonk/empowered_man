import 'package:dio/dio.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/tribe/data/model/add_members_model.dart';
import 'package:empowered/features/tribe/presentation/controller/tribe_group_controller.dart';

class AddTribeMember extends StatefulWidget {
  const AddTribeMember({
    required this.selectedMembers,
    required this.onMembersUpdated,
    super.key,
  });
  final List<String> selectedMembers;
  final Function(List<String>) onMembersUpdated;

  @override
  State<AddTribeMember> createState() => _AddTribeMemberState();
}

class _AddTribeMemberState extends State<AddTribeMember> {
  late List<String> selectedMemberIds;
  final controller = Get.find<TribeGroupController>();
  CancelToken? _cancelToken;

  @override
  void initState() {
    super.initState();
    selectedMemberIds = List.from(widget.selectedMembers);
    _fetchMembers();
  }

  void _fetchMembers() {
    _cancelToken = CancelToken();
    controller.getGroupMembers(cancelToken: _cancelToken);
  }

  void toggleMember(String memberId) {
    setState(() {
      if (selectedMemberIds.contains(memberId)) {
        selectedMemberIds.remove(memberId);
      } else {
        selectedMemberIds.add(memberId);
      }
    });
    widget.onMembersUpdated(selectedMemberIds);
  }

  void saveMembers() {
    widget.onMembersUpdated(selectedMemberIds);
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _cancelToken?.cancel();
    super.dispose();
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 24),
              const Text(
                'Add Member',
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
          if (selectedMemberIds.isNotEmpty) ...[
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Existing Members',
                style: AppTextStyles.textBodyB3,
              ),
            ),
            const VerticalSpacing(12),
            Obx(() {
              final members =
                  controller.groupMembersModel.value.addMembersData?.users ??
                      [];
              return Align(
                alignment: Alignment.centerLeft,
                child: Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: selectedMemberIds.map((memberId) {
                    final member = members.firstWhere(
                      (user) => user.id?.toString() == memberId,
                      orElse: () => const User(fullName: 'Unknown'),
                    );
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ClipOval(
                          child: member.image != null
                              ? Image.network(
                                  member.image!,
                                  width: 30,
                                  height: 30,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Assets.images.profilePic.image(
                                          width: 30,
                                          height: 30,
                                          fit: BoxFit.cover,),
                                )
                              : Assets.images.profilePic.image(
                                  width: 30, height: 30, fit: BoxFit.cover,),
                        ),
                        const HorizontalSpacing(4),
                        Text(
                          member.fullName ?? 'Unknown',
                          style: AppTextStyles.textBodyB3,
                        ),
                      ],
                    );
                  }).toList(),
                ),
              );
            }),
            const VerticalSpacing(12),
            const GreyDivider(),
            const VerticalSpacing(12),
          ],
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Add More Members',
              style: AppTextStyles.textBodyB3,
            ),
          ),
          const VerticalSpacing(16),
          Expanded(
            child: Obx(() {
              final state = controller.getGroupMemberState.value;
              if (state == TheStates.loading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state == TheStates.error) {
                return const Center(child: Text('Failed to load members'));
              }
              final members =
                  controller.groupMembersModel.value.addMembersData?.users ??
                      [];
              return ListView.builder(
                itemCount: members.length,
                itemBuilder: (context, index) {
                  final member = members[index];
                  final memberId = member.id?.toString();
                  if (memberId == null) return const SizedBox.shrink();
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(vertical: 8),
                    leading: ClipOval(
                      child: member.image != null
                          ? Image.network(
                              member.image!,
                              width: 40,
                              height: 40,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  Assets.images.profilePic.image(
                                      width: 40, height: 40, fit: BoxFit.cover,),
                            )
                          : Assets.images.profilePic
                              .image(width: 40, height: 40, fit: BoxFit.cover),
                    ),
                    title: Row(
                      children: [
                        Text(
                          member.fullName ?? 'Unknown',
                          style: AppTextStyles.textBodyB1,
                        ),
                        const HorizontalSpacing(4),
                        if (member.isCoach ?? false)
                          const CircleAvatar(
                            radius: 2.5,
                            backgroundColor: AppColors.color5CE0A0,
                          ),
                      ],
                    ),
                    trailing: Checkbox(
                      value: selectedMemberIds.contains(memberId),
                      onChanged: (_) => toggleMember(memberId),
                      side: const BorderSide(color: AppColors.textColor50),
                      activeColor: AppColors.primary500,
                    ),
                  );
                },
              );
            }),
          ),
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
                  text: selectedMemberIds.isEmpty
                      ? 'Done'
                      : 'Add ${selectedMemberIds.length} Member${selectedMemberIds.length > 1 ? 's' : ''}',
                  onPressed: saveMembers,
                ),
              ),
            ],
          ),
          VerticalSpacing(
            MediaQuery.of(context).viewPadding.bottom + 16,
          ),
        ],
      ),
    );
  }
}
