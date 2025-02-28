import 'package:empowered/constants/app_colors.dart';
import 'package:empowered/features/chat/presentation/controllers/chat_controller.dart';
import 'package:empowered/features/common/app_spacing.dart';
import 'package:empowered/gen/assets.gen.dart';
import 'package:empowered/utlis/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatBubbleContainer extends StatefulWidget {
  const ChatBubbleContainer({
    required this.isMine,
    required this.message,
    required this.timeStamp,
    required this.onLike,
    super.key,
    this.isLiked = false,
    this.isJournal = false,
    this.isAnotherUser = false,
  });

  final bool isMine;
  final bool isJournal;
  final bool isLiked;
  final bool isAnotherUser;
  final String message;
  final String timeStamp;

  final VoidCallback onLike;

  @override
  State<ChatBubbleContainer> createState() => _ChatBubbleContainerState();
}

class _ChatBubbleContainerState extends State<ChatBubbleContainer> {
  bool isLiked = false; // Internal state for like

  @override
  void initState() {
    super.initState();
    isLiked = widget.isLiked; // Initialize with the passed value
  }

  void _showPopupMenu(BuildContext context, Offset position) {
    final left = position.dx - 60; // Adjust for alignment
    final top = position.dy - 130; // Position above the bubble

    showDialog(
      context: context,
      barrierColor: AppColors.transparent,
      builder: (context) {
        return Stack(
          children: [
            Positioned(
              left: left,
              top: top,
              child: Material(
                color: Colors.transparent,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.bgMedium,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            isLiked = !isLiked; // Toggle like state
                          });
                          widget.onLike.call();
                          Navigator.pop(context);
                        },
                        child: Assets.images.chatLike.svg(width: 20),
                      ),
                      const HorizontalSpacing(16),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Assets.images.chatUndo.svg(width: 20),
                      ),
                      const HorizontalSpacing(16),
                      InkWell(
                        onTap: () {
                          Get.find<ChatController>().chatController.text =
                              widget.message;
                          Navigator.pop(context);
                        },
                        child: Assets.images.chatEdit.svg(width: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: widget.isMine ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment:
            widget.isMine ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          const VerticalSpacing(16),
          GestureDetector(
            onLongPressStart: (details) {
              _showPopupMenu(context, details.globalPosition);
            },
            child: Row(
              mainAxisAlignment: widget.isMine
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!widget.isMine)
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ClipOval(
                      child: widget.isAnotherUser
                          ? Assets.images.chatUserPic
                              .image(height: 25, width: 25)
                          : widget.isJournal
                              ? Assets.images.appIcon
                                  .image(height: 25, width: 25)
                              : Assets.images.chatUserPicTwo
                                  .image(height: 25, width: 25),
                    ),
                  ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Stack(
                        alignment: Alignment.bottomRight,
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            margin: const EdgeInsets.all(4),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: !widget.isMine
                                    ? AppColors.bgBorder
                                    : Colors.transparent,
                              ),
                              color: widget.isMine
                                  ? AppColors.primary500
                                  : AppColors.bgMedium,
                              borderRadius: BorderRadius.only(
                                bottomRight: const Radius.circular(14),
                                topLeft: !widget.isMine
                                    ? Radius.zero
                                    : const Radius.circular(14),
                                bottomLeft: const Radius.circular(14),
                                topRight: widget.isMine
                                    ? Radius.zero
                                    : const Radius.circular(14),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  widget.message,
                                  style: AppTextStyles.textBodyB2,
                                  softWrap: true,
                                ),
                              ],
                            ),
                          ),
                          if (isLiked)
                            Positioned(
                              right: -10,
                              bottom: -10,
                              child:
                                  Assets.images.chatBubbleLike.image(width: 32),
                            ),
                        ],
                      ),
                      Text(
                        widget.timeStamp,
                        style: AppTextStyles.textCaptionC2,
                      ),
                    ],
                  ),
                ),
                if (widget.isMine)
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: ClipOval(
                      child: Assets.images.chatUserPicOne
                          .image(height: 25, width: 25),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
