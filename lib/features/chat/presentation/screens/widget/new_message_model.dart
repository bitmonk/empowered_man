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

  bool showChatInput = false;
  bool showGroupForm = false;

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
            () => GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => FocusScope.of(context).unfocus(),
              child: Container(
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
                    const VerticalSpacing(10),
                    // The rest of the content should be scrollable!
                    Expanded(
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                                            (entry) =>
                                                entry.nickname!.split(' ')[0],
                                          )
                                          .join(', '),
                                      style:
                                          AppTextStyles.textBodyB3.copyWith(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Divider(color: Color(0xff1B3144)),
                            // User List
                            if (controller.agoraUserList.isEmpty)
                              const CustomErrorWidget(error: 'No user found')
                            else
                              controller.searchUserState.value.showWidget(
                                error: () => CustomErrorWidget(
                                  error: controller.searchUserError.value,
                                ),
                                loading: () => const LoadingWidget(),
                                success: () => ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: controller.agoraUserList.length,
                                  itemBuilder: (context, index) {
                                    final user =
                                        controller.agoraUserList[index];
                                    return ListTile(
                                      onTap: () {
                                        if (controller.selectedUsers
                                            .contains(user)) {
                                          controller.selectedUsers.remove(user);
                                        } else {
                                          controller.selectedUsers.add(user);
                                        }
                                        // Reset the UI state when user selection changes
                                        setState(() {
                                          showChatInput = false;
                                          showGroupForm = false;
                                        });
                                      },
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 8,),
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
                                              backgroundColor:
                                                  AppColors.color5CE0A0,
                                            ),
                                        ],
                                      ),
                                      trailing: Checkbox(
                                        value: controller.selectedUsers
                                            .contains(user),
                                        onChanged: (value) {
                                          if (controller.selectedUsers
                                              .contains(user)) {
                                            controller.selectedUsers
                                                .remove(user);
                                          } else {
                                            controller.selectedUsers.add(user);
                                          }
                                          // Reset the UI state when user selection changes
                                          setState(() {
                                            showChatInput = false;
                                            showGroupForm = false;
                                          });
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

                            // Show buttons when users are selected but no option is chosen
                            if (controller.selectedUsers.isNotEmpty &&
                                !showChatInput &&
                                !showGroupForm)
                              Column(
                                children: [
                                  const VerticalSpacing(20),
                                  // Send Separately Button
                                  SizedBox(
                                    width: double.infinity,
                                    child: AppOutlinedButton(
                                      text: 'Send Separately',
                                      onPressed: () {
                                        setState(() {
                                          showChatInput = true;
                                          showGroupForm = false;
                                        });
                                      },
                                    ),
                                  ),
                                  const VerticalSpacing(10),
                                  // Create Group Button (only show if multiple users selected and user is coach)
                                  if (controller.selectedUsers.length > 1 &&
                                      (Get.find<ProfileController>()
                                              .userProfile
                                              .value
                                              .isCoach ??
                                          false))
                                    SizedBox(
                                      width: double.infinity,
                                      child: AppOutlinedButton(
                                        text: 'Create Group',
                                        onPressed: () {
                                          setState(() {
                                            showChatInput = false;
                                            showGroupForm = true;
                                          });
                                        },
                                      ),
                                    ),
                                ],
                              ),

                            // Show Chat Input Field when "Send Separately" is selected
                            if (showChatInput)
                              Column(
                                children: [
                                  const VerticalSpacing(10),
                                  const ChatInputField(isNewMessage: true),
                                  const VerticalSpacing(10),
                                  // Back button to return to button selection
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        showChatInput = false;
                                      });
                                    },
                                    child: const Text(
                                      'Back to options',
                                      style: TextStyle(
                                          color: AppColors.primary500,),
                                    ),
                                  ),
                                ],
                              ),

                            // Show Group Form when "Create Group" is selected
                            if (showGroupForm)
                              Column(
                                children: [
                                  const VerticalSpacing(20),
                                  AppTextFormField(
                                    controller: groupNameCont,
                                    hintText: 'Enter Group Name',
                                  ),
                                  const VerticalSpacing(10),
                                  AppTextFormField(
                                    controller: groupDescpCont,
                                    hintText: 'Group Description',
                                  ),
                                  const VerticalSpacing(20),
                                  Row(
                                    children: [
                                      // Back button
                                      Expanded(
                                        child: AppOutlinedButton(
                                          text: 'Back',
                                          onPressed: () {
                                            setState(() {
                                              showGroupForm = false;
                                            });
                                          },
                                        ),
                                      ),
                                      const HorizontalSpacing(10),
                                      // Create Group button
                                      Expanded(
                                        child: AppOutlinedButton(
                                          isLoading:
                                              controller.isCreatingGroup.value,
                                          text: 'Create Group',
                                          onPressed: () async {
                                            await Get.find<ChatController>()
                                                .createGroupAndChat(
                                              groupName: groupNameCont.text,
                                              desc: groupDescpCont.text,
                                              members: controller.selectedUsers
                                                  .map((e) => e.username!)
                                                  .toList(),
                                            );
                                            await controller.fetchConversations(
                                              isInitialLoad: true,
                                            );
                                            await controller.fetchGroupChats(
                                              isInitialLoad: true,
                                            );
                                            Navigator.pop(context);

                                            Get.to(
                                              () => const ChatCoversationScreen(
                                                isGroupChat: true,
                                                isSoloChat: false,
                                              ),
                                            );
                                            groupNameCont.clear();
                                            groupDescpCont.clear();
                                            controller.selectedUsers.clear();
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            const VerticalSpacing(
                              20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
