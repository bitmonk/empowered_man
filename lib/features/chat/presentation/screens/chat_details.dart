import 'package:empowered/constants/app_colors.dart';
import 'package:empowered/features/chat/presentation/screens/add_member.dart'; // Import the AddMember screen
import 'package:empowered/features/common/app_spacing.dart';
import 'package:empowered/gen/assets.gen.dart';
import 'package:empowered/utlis/app_text_styles.dart';
import 'package:flutter/material.dart';

class ChatDetails extends StatefulWidget {
  const ChatDetails({super.key});

  @override
  State<ChatDetails> createState() => _ChatDetailsState();
}

class _ChatDetailsState extends State<ChatDetails> {
  bool isExpanded = false; // Track the "See More" state
  List<String> selectedMembers = [
    'Liam Cooper',
    'Emma Johnson',
    'Sophia Jones',
  ]; // Initially selected members

  void openAddMember() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      builder: (context) => AddMember(
        selectedMembers: selectedMembers,
        onMembersUpdated: (newMembers) {
          setState(() {
            selectedMembers = newMembers;
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 1,
      minChildSize: 0.5,
      builder: (context, scrollController) {
        return Container(
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
                      const Text(
                        'About',
                        style: AppTextStyles.textBodyB1,
                      ),
                      const VerticalSpacing(6),
                      const Text(
                        'Message Title',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: AppColors.textColor50,
                        ),
                      ),
                      const VerticalSpacing(12),
                      Text(
                        isExpanded
                            ? 'This space is designed to empower individuals to share their thoughts, offer support, and build a positive community.\n\n'
                                'Our focus is on personal growth, mutual respect, and meaningful connections. This space is designed to empower individuals to share their thoughts, offer support, and build a positive community.\n\n'
                                'Our focus is on personal growth, mutual respect, and meaningful connections.'
                            : 'This space is designed to empower individuals to share their thoughts, offer support, and build a positive community.\n\n'
                                'Our focus is on personal growth, mutual respect, and meaningful connections...',
                        style: const TextStyle(
                            fontSize: 12, color: AppColors.textColor100,),
                      ),
                      const VerticalSpacing(6),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 6, 6, 6),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              isExpanded = !isExpanded;
                            });
                          },
                          child: Text(
                            isExpanded ? 'See Less' : 'See More',
                            style: AppTextStyles.textBodyB3
                                .copyWith(color: AppColors.primary500),
                          ),
                        ),
                      ),
                      const Divider(color: AppColors.bgBorderVLight),

                      // Members Section
                      const VerticalSpacing(16),
                      const Text(
                        'Members',
                        style: AppTextStyles.textBodyB1,
                      ),
                      const VerticalSpacing(12),
                      Text('Total Members (${selectedMembers.length})',
                          style: AppTextStyles.textBodyB4,),
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

                      // Members List
                      Column(
                        children: selectedMembers.map((member) {
                          return ListTile(
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 8),
                            leading: ClipOval(
                              child: Assets.images.profilePic.image(
                                  width: 40, height: 40, fit: BoxFit.cover,),
                            ),
                            title: Row(
                              children: [
                                Text(member, style: AppTextStyles.textBodyB1),
                                const HorizontalSpacing(6),
                                if (member == 'Liam Cooper')
                                  const CircleAvatar(
                                    radius: 2.5,
                                    backgroundColor: AppColors.color5CE0A0,
                                  ),
                              ],
                            ),
                            trailing: member == 'Liam Cooper'
                                ? const Text(
                                    'Admin',
                                    style: AppTextStyles.textSmallS2,
                                  )
                                : null,
                          );
                        }).toList(),
                      ),

                      const VerticalSpacing(20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
