import 'package:empowered/constants/app_colors.dart';
import 'package:empowered/features/common/app_spacing.dart';
import 'package:empowered/gen/assets.gen.dart';
import 'package:empowered/utlis/app_text_styles.dart';
import 'package:flutter/material.dart';

class AddMember extends StatefulWidget {

  const AddMember({
    required this.selectedMembers, required this.onMembersUpdated, super.key,
  });
  final List<String> selectedMembers;
  final Function(List<String>) onMembersUpdated;

  @override
  State<AddMember> createState() => _AddMemberState();
}

class _AddMemberState extends State<AddMember> {
  final List<String> allMembers = [
    'Liam Cooper',
    'Emma Johnson',
    'Noah Brown',
    'Olivia Smith',
    'Ava Williams',
    'Sophia Jones',
  ];
  late List<String> selectedMembers;

  @override
  void initState() {
    super.initState();
    selectedMembers = List.from(widget.selectedMembers);
  }

  void toggleMember(String member) {
    setState(() {
      if (selectedMembers.contains(member)) {
        selectedMembers.remove(member);
      } else {
        selectedMembers.add(member);
      }
    });
  }

  void saveMembers() {
    widget.onMembersUpdated(selectedMembers);
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
          const VerticalSpacing(24),

          // Display already selected members
          if (selectedMembers.isNotEmpty) ...[
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Existing Members',
                style: AppTextStyles.textBodyB3,
              ),
            ),
            const VerticalSpacing(12),
            Align(
              alignment: Alignment.centerLeft,
              child: Wrap(
                spacing: 12,
                runSpacing: 12,
                children: selectedMembers.map((member) {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ClipOval(
                        child: Assets.images.profilePic
                            .image(width: 30, height: 30, fit: BoxFit.cover),
                      ),
                      const HorizontalSpacing(4),
                      Text(
                        member,
                        style: AppTextStyles.textBodyB3,
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
            const VerticalSpacing(24),
          ],

          // Add More Members Section
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Add More Members',
              style: AppTextStyles.textBodyB3,
            ),
          ),
          const VerticalSpacing(16),

          // List of members with checkboxes
          Expanded(
            child: ListView.builder(
              itemCount: allMembers.length,
              itemBuilder: (context, index) {
                final member = allMembers[index];
                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(vertical: 8),
                  leading: ClipOval(
                    child: Assets.images.profilePic
                        .image(width: 40, height: 40, fit: BoxFit.cover),
                  ),
                  title: Row(
                    children: [
                      Text(
                        member,
                        style: AppTextStyles.textBodyB1,
                      ),
                      const HorizontalSpacing(4),
                      if (index <
                          2) // Just for example, adding green dot for first two users
                        const CircleAvatar(
                          radius: 2.5,
                          backgroundColor: AppColors.color5CE0A0,
                        ),
                    ],
                  ),
                  trailing: Checkbox(
                    value: selectedMembers.contains(member),
                    onChanged: (_) {
                      toggleMember(member);
                      saveMembers();
                    },
                    side: const BorderSide(color: AppColors.textColor50),
                    activeColor: AppColors.primary500,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
