import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/chat/presentation/screens/widget/chat_input_field.dart';

class NewMessageModal extends StatefulWidget {
  const NewMessageModal({super.key});

  @override
  State<NewMessageModal> createState() => _NewMessageModalState();
}

class _NewMessageModalState extends State<NewMessageModal> {
  final List<bool> selectedUsers = List.generate(7, (_) => false);
  final List<String> userNames = [
    'Liam Cooper',
    'Sophia Reed',
    'Mason Diaz',
    'Ava Brooks',
    'Noah Clarke',
    'Emma Hayes',
    'Oliver Bennett',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: DraggableScrollableSheet(
        initialChildSize: 0.8,
        maxChildSize: 0.9,
        minChildSize: 0.5,
        builder: (context, scrollController) {
          return Container(
            decoration: const BoxDecoration(
              color: AppColors.bgMedium,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            padding: const EdgeInsets.all(16)
                .copyWith(bottom: context.devicePaddingBottom),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Close Icon and Title
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 24),
                    const Text(
                      'New Message',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 24,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),

                const Divider(color: Color(0xff1B3144)),

                // To: @SelectedUsers
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: RichText(
                    text: TextSpan(
                      style: AppTextStyles.textBodyB3
                          .copyWith(color: Colors.white),
                      children: [
                        const TextSpan(text: 'To: @ '),
                        TextSpan(
                          text: selectedUsers
                              .asMap()
                              .entries
                              .where((entry) => entry.value)
                              .map(
                                (entry) => userNames[entry.key].split(' ')[0],
                              ) // Only first name
                              .join(', '), // Separate names with commas
                          style: AppTextStyles.textBodyB3.copyWith(),
                        ),
                      ],
                    ),
                  ),
                ),

                const Divider(color: Color(0xff1B3144)),

                // User List
                Expanded(
                  child: ListView.builder(
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    controller: scrollController,
                    itemCount: selectedUsers.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          setState(() {
                            selectedUsers[index] = !selectedUsers[index];
                          });
                        },
                        contentPadding: const EdgeInsets.symmetric(vertical: 8),
                        leading: ClipOval(
                          child: Assets.images.profilePic
                              .image(width: 40, height: 40, fit: BoxFit.cover),
                        ),
                        title: Row(
                          children: [
                            Text(
                              userNames[index],
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
                          value: selectedUsers[index],
                          onChanged: (value) {
                            setState(() {
                              selectedUsers[index] = value!;
                            });
                          },
                          side: const BorderSide(color: AppColors.textColor50),
                          activeColor: AppColors.primary500,
                        ),
                      );
                    },
                  ),
                ),
                const ChatInputField(isNewMessage: true),
              ],
            ),
          );
        },
      ),
    );
  }
}
