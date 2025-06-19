import 'package:agora_chat_sdk/agora_chat_sdk.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/chat/presentation/controllers/chat_controller.dart';
import 'package:empowered/features/chat/presentation/screens/chat_coversation_screen.dart';
import 'package:empowered/features/chat/presentation/screens/widget/chat_input_field.dart';
import 'package:empowered/features/chat/presentation/screens/widget/chat_list.dart';
import 'package:empowered/features/chat/presentation/screens/widget/new_message_model.dart';
import 'package:empowered/features/group/presentation/screens/widgets/colored_padded_cotainer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatScreen extends GetView<ChatController> {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Obx(
            () => controller.initializingSdks.value.showWidget(
              loading: () => const LoadingWidget(),
              error: () => CustomErrorWidget(
                error: controller.loginError.value,
                onPressed: () {
                  controller.initSDK();
                },
              ),
              success: () => Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: DrawerHeaderWithBack(title: 'Chats'),
                  ),
                  const VerticalSpacing(24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: AppTextFormField(
                      onChanged: (v) {
                        if (v.length > 2) {
                          controller.fetchConversations(
                            query: v,
                            isInitialLoad: true,
                          );
                        }
                      },
                      enabledBorderSide:
                          const BorderSide(color: AppColors.bgMedium),
                      borderSide: const BorderSide(color: AppColors.bgMedium),
                      fillColor: AppColors.bgMedium,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Assets.images.search.svg(height: 22, width: 22),
                      ),
                      hintText: 'Search...',
                      hintStyle: AppTextStyles.textCaptionC2,
                    ),
                  ),
                  const VerticalSpacing(24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 30.h,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.filterList.length,
                              itemBuilder: (context, index) {
                                var filterList = controller.filterList[index];
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  onTap: () {
                                    controller.selectedFilterindex.value =
                                        index;
                                    if (index == 2) {
                                      controller.fetchGroupChats(
                                        isInitialLoad: true,
                                      );
                                    }
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Obx(() {
                                      var isSelectedFilter = controller
                                              .selectedFilterindex.value ==
                                          index;
                                      return ColoredPaddedCotainer(
                                        color: isSelectedFilter
                                            ? AppColors.textColor50
                                            : AppColors.bgDark,
                                        title: filterList,
                                        textStyle: AppTextStyles.textCaptionC2
                                            .copyWith(
                                          color: isSelectedFilter
                                              ? AppColors.bgDark
                                              : AppColors.textColor50,
                                        ),
                                      );
                                    }),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            controller.selectedUsers.clear();
                            controller.agoraUserList.clear();
                            controller.chatController.clear();
                            showModalBottomSheet(
                              useRootNavigator: true,
                              useSafeArea: true,
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder: (context) => const NewMessageModal(),
                            );
                          },
                          child: Assets.images.addIconWithBackground
                              .svg(width: 30, height: 30),
                        ),
                      ],
                    ),
                  ),
                  const VerticalSpacing(16),
                  if (controller.selectedFilterindex.value == 0)
                    Flexible(
                      child: Obx(
                        () =>
                            controller.fetchConversationState.value.showWidget(
                          loading: () => const LoadingWidget(),
                          error: () => CustomErrorWidget(
                            error: controller.fetchCoversationError.value,
                            onPressed: () {
                              controller.fetchConversations(
                                isInitialLoad: true,
                              );
                            },
                          ),
                          orElse: () => controller.allConversations.isEmpty
                              ? CustomErrorWidget(
                                  error: 'No conversations found.',
                                  onPressed: () {
                                    controller.fetchConversations(
                                      isInitialLoad: true,
                                    );
                                  },
                                )
                              : RefreshIndicator(
                                  onRefresh: () async {
                                    controller.fetchConversations(
                                      isInitialLoad: true,
                                    );
                                  },
                                  child: ListView.builder(
                                    itemCount:
                                        controller.allConversations.length +
                                            (controller.canLoadMore ? 1 : 0),
                                    itemBuilder: (context, index) {
                                      if (index <
                                          controller.allConversations.length) {
                                        final convo =
                                            controller.allConversations[index];
                                        return ChatList(
                                          isSquad: convo.conversation.type ==
                                              ChatConversationType.GroupChat,
                                          convo: convo,
                                        );
                                      }
                                      if (controller
                                              .fetchConversationState.value ==
                                          TheStates.loadingMore) {
                                        return const Padding(
                                          padding: EdgeInsets.all(16),
                                          child: Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                        );
                                      } else {
                                        return const Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 16),
                                          child: Center(
                                            child: Text(
                                              'No more conversations',
                                              style: TextStyle(
                                                  color: AppColors.baseWhite),
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ),
                        ),
                      ),
                    ),
                  // Replace the filter index == 1 section in your ChatScreen with this:

                  if (controller.selectedFilterindex.value == 1)
                    Flexible(
                      child: Obx(
                        () =>
                            controller.fetchConversationState.value.showWidget(
                          loading: () => const LoadingWidget(),
                          error: () => CustomErrorWidget(
                            error: controller.fetchCoversationError.value,
                            onPressed: () {
                              controller.fetchConversations(
                                  isInitialLoad: true);
                            },
                          ),
                          orElse: () => controller.allConversations.isEmpty
                              ? CustomErrorWidget(
                                  error: 'No conversations found.',
                                  onPressed: () {
                                    controller.fetchConversations(
                                        isInitialLoad: true);
                                  },
                                )
                              : RefreshIndicator(
                                  onRefresh: () async {
                                    controller.fetchConversations(
                                        isInitialLoad: true);
                                  },
                                  child: ListView.builder(
                                    itemCount:
                                        controller.allConversations.length +
                                            (controller.canLoadMore ? 1 : 0),
                                    itemBuilder: (context, index) {
                                      if (index <
                                          controller.allConversations.length) {
                                        final convo =
                                            controller.allConversations[index];
                                        controller
                                            .fetchLastMessagesForConversation(
                                          convo.id,
                                          convo.conversation.type,
                                        );

                                        return ChatList(
                                          isSquad: convo.conversation.type ==
                                              ChatConversationType.GroupChat,
                                          convo: convo,
                                          showLastMessage: false,
                                          showShortcutContainer:
                                              true, // Enable unified container
                                        );
                                      }

                                      if (controller
                                              .fetchConversationState.value ==
                                          TheStates.loadingMore) {
                                        return const Padding(
                                          padding: EdgeInsets.all(16),
                                          child: Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                        );
                                      } else {
                                        return const Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 16),
                                          child: Center(
                                            child: Text(
                                              'No more conversations',
                                              style: TextStyle(
                                                  color: AppColors.baseWhite),
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ),
                        ),
                      ),
                    ),
                  if (controller.selectedFilterindex.value == 2)
                    Flexible(
                      child: Obx(
                        () => controller.fetchGroupListState.value.showWidget(
                          loading: () => const LoadingWidget(),
                          error: () => CustomErrorWidget(
                            error: controller.fetchCoversationError.value,
                            onPressed: () {
                              controller.fetchGroupChats(isInitialLoad: true);
                            },
                          ),
                          orElse: () => controller.groupList.isEmpty
                              ? CustomErrorWidget(
                                  error: 'No groups found.',
                                  onPressed: () {
                                    controller.fetchGroupChats(
                                      isInitialLoad: true,
                                    );
                                  },
                                )
                              : RefreshIndicator(
                                  onRefresh: () async {
                                    controller.fetchGroupChats(
                                      isInitialLoad: true,
                                    );
                                  },
                                  child: ListView.builder(
                                    itemCount: controller.groupList.length +
                                        (controller.canLoadMore ? 1 : 0),
                                    itemBuilder: (context, index) {
                                      if (index < controller.groupList.length) {
                                        final convo =
                                            controller.groupList[index];
                                        return ChatList(
                                          isSquad: true,
                                          convo: convo,
                                        );
                                      }
                                      if (controller
                                              .fetchConversationState.value ==
                                          TheStates.loadingMore) {
                                        return const Padding(
                                          padding: EdgeInsets.all(16),
                                          child: Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                        );
                                      } else {
                                        return const Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 16),
                                          child: Center(
                                            child: Text(
                                              'No more conversations',
                                              style: TextStyle(
                                                  color: AppColors.baseWhite),
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
