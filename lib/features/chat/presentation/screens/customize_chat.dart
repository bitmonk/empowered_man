import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/chat/presentation/screens/add_member.dart';
import 'package:empowered/gen/assets.gen.dart';

class CustomizeChat extends StatefulWidget {
  const CustomizeChat({
    super.key,
  });

  @override
  State<CustomizeChat> createState() => _CustomizeChatState();
}

class _CustomizeChatState extends State<CustomizeChat> {
  List<String> members = [];

  @override
  void initState() {
    super.initState();
  }

  void openAddMember() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      builder: (context) => AddMember(
        selectedMembers: members,
        onMembersUpdated: (updatedMembers) {
          setState(() {
            members = updatedMembers;
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: AppColors.bgMedium,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            const VerticalSpacing(12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 24,
                ),
                const Text(
                  'Customize Chat',
                  style: AppTextStyles.textHeadingH3,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.close,
                    color: AppColors.textColor100,
                    size: 24,
                  ),
                ),
              ],
            ),
            const VerticalSpacing(26),

            // Input Fields
            const AppTextFormField(
              labelText: 'Title',
            ),
            const VerticalSpacing(16),
            const AppTextFormField(
              labelText: 'Description',
              minLines: 3,
              maxLines: 5,
              textInputAction: TextInputAction.newline,
              textInputType: TextInputType.multiline,
            ),
            const VerticalSpacing(20),
            Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: openAddMember,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: AppColors.primary500,
                    ),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 30),
                  child: Text(
                    'Add Member',
                    style: AppTextStyles.textBodyB2
                        .copyWith(color: AppColors.primary500),
                  ),
                ),
              ),
            ),

            // Selected Members Display
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: members.map((member) {
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
            ),
            const VerticalSpacing(20),

            // Add Member Button

            // Save & Cancel Buttons
            AppOutlinedButton(
              text: 'Save',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const VerticalSpacing(16),
            AppOutlinedButton.orange(
              text: 'Cancel',
              onPressed: () {
                Navigator.pop(context);
              },
            ),

            // Flexible(
            //   child: Align(
            //     alignment: Alignment.bottomCenter,
            //     child: Padding(
            //       padding: const EdgeInsets.only(bottom: 20),
            //       child: ChatInputField(),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
