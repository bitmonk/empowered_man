import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/chat/presentation/controllers/chat_controller.dart';
import 'package:empowered/features/chat/presentation/screens/chat_coversation_screen.dart';
import 'package:empowered/features/chat/presentation/screens/widget/chat_input_field.dart';
import 'package:empowered/features/profile/presentation/controllers/profile_controller.dart';

class NewMessageModal extends StatefulWidget {
  const NewMessageModal({super.key});

  @override
  State<NewMessageModal> createState() => _NewMessageModalState();
}

class _NewMessageModalState extends State<NewMessageModal> {
  final controller = Get.find<ChatController>();
  TextEditingController groupNameCont = TextEditingController();
  TextEditingController groupDescpCont = TextEditingController();
  TextEditingController searchUserController = TextEditingController();

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
          return Obx(
            () => Container(
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
                  AppTextFormField(
                    controller: searchUserController,
                    hintText: 'Enter name to search...',
                    onChanged: (v) {
                      controller.searchUserAndChat(query: v);
                    },
                  ),
                  const VerticalSpacing(10),
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
                            text: controller.selectedUsers
                                .map(
                                  (entry) => entry.nickname!.split(' ')[0],
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
                  if (controller.agoraUserList.isEmpty)
                    const CustomErrorWidget(
                      error: 'No user found',
                    )
                  else
                    controller.searchUserState.value.showWidget(
                      error: () => CustomErrorWidget(
                        error: controller.searchUserError.value,
                      ),
                      loading: () => const LoadingWidget(),
                      success: () => Expanded(
                        child: ListView.builder(
                          keyboardDismissBehavior:
                              ScrollViewKeyboardDismissBehavior.onDrag,
                          controller: scrollController,
                          itemCount: controller.agoraUserList.length,
                          itemBuilder: (context, index) {
                            final user = controller.agoraUserList[index];
                            return ListTile(
                              onTap: () {
                                if (controller.selectedUsers.contains(user)) {
                                  controller.selectedUsers.remove(user);
                                } else {
                                  controller.selectedUsers.add(user);
                                }
                              },
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 8),
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
                                    user.nickname ?? '',
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
                                value: controller.selectedUsers.contains(user),
                                onChanged: (value) {
                                  if (controller.selectedUsers.contains(user)) {
                                    controller.selectedUsers.remove(user);
                                  } else {
                                    controller.selectedUsers.add(user);
                                  }
                                },
                                side: const BorderSide(
                                  color: AppColors.textColor50,
                                ),
                                activeColor: AppColors.primary500,
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                  if (controller.selectedUsers.isNotEmpty)
                    const ChatInputField(
                      isNewMessage: true,
                    ),
                  if (controller.selectedUsers.length > 1 &&
                      (Get.find<ProfileController>()
                              .userProfile
                              .value
                              .isCoach ??
                          false))
                    Column(
                      children: [
                        AppTextFormField(
                          controller: groupNameCont,
                          hintText: 'Enter Group Name',
                        ),
                        const VerticalSpacing(10),
                        AppTextFormField(
                          controller: groupDescpCont,
                          hintText: 'Group Description',
                        ),
                        const VerticalSpacing(10),
                        AppOutlinedButton(
                          text: 'Create Group',
                          onPressed: () async {
                            await Get.find<ChatController>().createGroupAndChat(
                              groupName: groupNameCont.text,
                              desc: groupDescpCont.text,
                              members: controller.selectedUsers
                                  .map((e) => e.username!)
                                  .toList(),
                            );
                            Get.to(
                              () => const ChatCoversationScreen(
                                isGroupChat: true,
                                isSoloChat: false,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
