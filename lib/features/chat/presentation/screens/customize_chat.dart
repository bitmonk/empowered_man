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
    scrollController.removeListener(_onScroll);
    scrollController.dispose();
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
    return Obx(
      () => Padding(
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
              const VerticalSpacing(12),
              const GreyDivider(),
              const VerticalSpacing(24),
              // Input Fields
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
              chatController.getMemberListState.value.showWidget(
                loading: () => const LoadingWidget(),
                error: () => CustomErrorWidget(
                  error: chatController.getMemberListError.value,
                ),
                success: () => Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: ListView.builder(
                      controller: scrollController,
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
              ),
              const VerticalSpacing(20),

              // Add Member Button

              // Save & Cancel Buttons
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
      ),
    );
  }
}
