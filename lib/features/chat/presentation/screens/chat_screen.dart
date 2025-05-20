import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/chat/presentation/controllers/chat_controller.dart';
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
            () => Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: DrawerHeaderWithBack(title: 'Chats'),
                ),
                const VerticalSpacing(24),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: AppTextFormField(
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
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
                                  controller.selectedFilterindex.value = index;
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Obx(() {
                                    var isSelectedFilter =
                                        controller.selectedFilterindex.value ==
                                            index;
                                    return ColoredPaddedCotainer(
                                      color: isSelectedFilter
                                          ? AppColors.textColor50
                                          : AppColors.bgDark,
                                      title: filterList,
                                      textStyle:
                                          AppTextStyles.textCaptionC2.copyWith(
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
                // AppOutlinedButton(
                //     onPressed: () {
                //       controller.createGroupAndChat('Uno Techoz', []);
                //     },
                //     text: "test"),
                Flexible(
                  child: Obx(
                    () => controller.fetchConversationState.value.showWidget(
                      loading: () => const LoadingWidget(),
                      error: () => CustomErrorWidget(
                        error: controller.fetchCoversationError.value,
                        onPressed: () {
                          controller.fetchConversations(isInitialLoad: true);
                        },
                      ),
                      orElse: () => RefreshIndicator(
                        onRefresh: () async {
                          controller.fetchConversations(isInitialLoad: true);
                        },
                        // onNotification: (scrollNotification) {
                        //   if (scrollNotification.metrics.pixels >=
                        //           scrollNotification.metrics.maxScrollExtent -
                        //               100 &&
                        //       controller.canLoadMore &&
                        //       controller.fetchConversationState.value !=
                        //           TheStates.loadingMore) {
                        //     // Near bottom and can load more
                        //     controller.fetchConversations();
                        //   }
                        //   return false;
                        // },
                        child: ListView.separated(
                          itemCount: controller.allConversations.length +
                              (controller.canLoadMore
                                  ? 1
                                  : 0), // Extra for loading
                          separatorBuilder: (_, __) => const Divider(height: 1),
                          itemBuilder: (context, index) {
                            if (index < controller.allConversations.length) {
                              final convo = controller.allConversations[index];
                              return ChatList(isSquad: false, convo: convo);
                            }
                            if (controller.fetchConversationState.value ==
                                TheStates.loadingMore) {
                              return const Padding(
                                padding: EdgeInsets.all(16),
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            } else {
                              return const Padding(
                                padding: EdgeInsets.symmetric(vertical: 16),
                                child: Center(
                                  child: Text('No more conversations'),
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
    );
  }
}
