import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/chat/presentation/controllers/chat_controller.dart';
import 'package:empowered/features/chat/presentation/screens/add_member.dart';
import 'package:empowered/features/profile/presentation/controllers/profile_controller.dart';

class CustomizeChat extends StatefulWidget {
  const CustomizeChat({
    super.key,
  });

  @override
  State<CustomizeChat> createState() => _CustomizeChatState();
}

class _CustomizeChatState extends State<CustomizeChat> {
  final chatController = Get.find<ChatController>();
  List<String> members = [];
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(
      text: chatController.selectedConversation.value?.userName,
    );
    descriptionController = TextEditingController(
      text: chatController.selectedConversation.value?.description,
    );
    scrollController.addListener(_onScroll);
  }

  Future<void> _onScroll() async {
    if (scrollController.position.pixels >=
            scrollController.position.maxScrollExtent - 100 &&
        chatController.hasMoreGroupMembers &&
        chatController.getMemberListState.value != TheStates.loadingMore) {
      chatController.getMemberList();
    }
  }

  @override
  void dispose() {
    scrollController
      ..removeListener(_onScroll)
      ..dispose();
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  void openAddMember() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      builder: (context) => AddMember(
        selectedMembers: chatController.groupMembers,
        onMembersUpdated: (updatedMembers) {
          setState(() {
            members = updatedMembers;
          });
        },
        allMembers: chatController.agoraUserList
            .map((user) => user.username ?? user.nickname ?? '')
            .toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final keyboardHeight = mediaQuery.viewInsets.bottom;
    final isKeyboardVisible = keyboardHeight > 0;

    final bottomPadding = isKeyboardVisible
        ? keyboardHeight
        : keyboardHeight + mediaQuery.viewPadding.bottom;

    return Obx(
      () => Padding(
        padding: EdgeInsets.only(bottom: bottomPadding),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: AppColors.bgMedium,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Add this line!
            children: [
              const VerticalSpacing(12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 24),
                  const Text(
                    'Customize Chat',
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

              // Everything else wrapped in Flexible + SingleChildScrollView for scrolling
              Flexible(
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    children: [
                      const VerticalSpacing(12),

                      AppTextFormField(
                        labelText: 'Title',
                        controller: titleController,
                        hintText: 'Enter Title',
                      ),
                      const VerticalSpacing(16),
                      AppTextFormField(
                        labelText: 'Description',
                        hintText: 'Enter Description',
                        controller: descriptionController,
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
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 30),
                            child: Text(
                              'Add Member',
                              style: AppTextStyles.textBodyB2
                                  .copyWith(color: AppColors.primary500),
                            ),
                          ),
                        ),
                      ),
                      chatController.getMemberListState.value.showWidget(
                        loading: () => const LoadingWidget(),
                        error: () => CustomErrorWidget(
                          error: chatController.getMemberListError.value,
                        ),
                        success: () => Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: ListView.builder(
                            // Remove controller: scrollController,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: chatController.groupMembers.length +
                                (chatController.hasMoreGroupMembers ? 1 : 0),
                            itemBuilder: (context, i) {
                              if (i == chatController.groupMembers.length) {
                                return const Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                              }
                              final memberId = chatController.groupMembers[i];
                              return ListTile(
                                contentPadding: const EdgeInsets.symmetric(),
                                leading: ClipOval(
                                  child: Assets.images.profilePic.image(
                                    width: 30,
                                    height: 30,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                title: Text(
                                  memberId,
                                  style: AppTextStyles.textBodyB3,
                                ),
                                trailing: (Get.find<ProfileController>()
                                        .userProfile
                                        .value
                                        .isCoach!)
                                    ? IconButton(
                                        onPressed: () {
                                          chatController.removeMemberFromGroup(
                                            members: [memberId],
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
                            },
                          ),
                        ),
                      ),
                      const VerticalSpacing(20),
                      // Save & Cancel Buttons always visible at bottom
                      AppOutlinedButton(
                        text: 'Save',
                        onPressed: () {
                          chatController.updateGroupInfo(
                            newName: titleController.text,
                            newDescription: descriptionController.text,
                          );
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
