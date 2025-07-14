import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/profile/presentation/controllers/profile_controller.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:intl/intl.dart';

class GoalsChatBubbleContainer extends StatefulWidget {
  const GoalsChatBubbleContainer({
    required this.isMine,
    required this.message,
    required this.onLike,
    super.key,
    this.isLiked = false,
    this.isJournal = false,
    this.isAnotherUser = false,
    this.isLoading = false,
    this.selectedOption,
    this.isAnswered = false,
    this.isThinking = false,
    this.answerId,
    this.onEditTap,
    this.questionId,
    this.isEditMode = false,
    this.createdAt,
    this.updatedAt,
    this.isEdited = false,
  });

  final bool isMine;
  final bool isJournal;
  final bool isLiked;
  final bool isAnotherUser;
  final String message;

  final bool isLoading;
  final VoidCallback onLike;
  final String? selectedOption;
  final bool isAnswered;
  final bool isThinking;
  final String? answerId;
  final VoidCallback? onEditTap;
  final String? questionId;
  final bool isEditMode;
  final String? createdAt;
  final String? updatedAt;
  final bool isEdited;

  @override
  State<GoalsChatBubbleContainer> createState() =>
      _GoalsChatBubbleContainerState();
}

class _GoalsChatBubbleContainerState extends State<GoalsChatBubbleContainer>
    with TickerProviderStateMixin {
  late List<AnimationController> _dotAnimationControllers;
  late List<Animation<double>> _dotAnimations;
  bool _showEditIcon = false;
  @override
  void initState() {
    super.initState();

    _dotAnimationControllers = List.generate(
      5,
      (index) => AnimationController(
        duration: const Duration(milliseconds: 600),
        vsync: this,
      ),
    );

    _dotAnimations = _dotAnimationControllers.map((controller) {
      return Tween<double>(begin: 0.5, end: 1).animate(
        CurvedAnimation(
          parent: controller,
          curve: Curves.easeInOut,
        ),
      );
    }).toList();

    // Start animations with a slight delay for a wave effect
    for (var i = 0; i < _dotAnimationControllers.length; i++) {
      Future.delayed(Duration(milliseconds: i * 200), () {
        if (mounted) {
          _dotAnimationControllers[i].repeat(reverse: true);
        }
      });
    }
  }

  Widget _buildThinkingIndicator() {
    return Container(
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.bgBorder,
        ),
        color: AppColors.bgMedium,
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(14),
          bottomLeft: Radius.circular(14),
          topRight: Radius.circular(14),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: List.generate(5, (index) {
              return AnimatedBuilder(
                animation: _dotAnimationControllers[index],
                builder: (context, child) {
                  return Transform.scale(
                    scale: _dotAnimations[index].value,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: AppColors.textColor300,
                        shape: BoxShape.circle,
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    for (final controller in _dotAnimationControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  String _formatTimestamp(String? timestamp) {
    try {
      DateTime dateTime;

      // If no timestamp provided, use current time
      if (timestamp == null || timestamp.isEmpty) {
        dateTime = DateTime.now();
      } else {
        // Parse the ISO 8601 timestamp
        dateTime = DateTime.parse(timestamp).timeZoneName == 'UTC'
            ? DateTime.parse(timestamp).toLocal()
            : DateTime.parse(timestamp);
      }

      // Format based on how long ago the message was sent
      final now = DateTime.now();
      final difference = now.difference(dateTime);

      if (difference.inDays == 0) {
        // Same day - show time only (e.g., "2:30 PM")
        return DateFormat('h:mm a').format(dateTime);
      } else if (difference.inDays == 1) {
        // 1 day passed - show "Yesterday at HH:MM"
        return 'Yesterday at ${DateFormat('h:mm a').format(dateTime)}';
      } else if (difference.inDays > 1 && difference.inDays < 7) {
        // 2-6 days passed - show "Day at HH:MM" (e.g., "Monday at 2:30 PM")
        return '${DateFormat('EEEE').format(dateTime)} at ${DateFormat('h:mm a').format(dateTime)}';
      } else {
        // 7+ days passed - check if same year
        if (dateTime.year == now.year) {
          // Same year - show month, date and time (e.g., "Jan 15 at 2:30 PM")
          return '${DateFormat('MMM d').format(dateTime)} at ${DateFormat('h:mm a').format(dateTime)}';
        } else {
          // Different year - show full date and time (e.g., "Jan 15, 2024 at 2:30 PM")
          return '${DateFormat('MMM d, yyyy').format(dateTime)} at ${DateFormat('h:mm a').format(dateTime)}';
        }
      }
    } catch (e) {
      // Fallback to current time if parsing fails
      return DateFormat('h:mm a').format(DateTime.now());
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isThinking) {
      return Align(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const VerticalSpacing(16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile picture for AI
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ClipOval(
                    child: widget.isJournal
                        ? Assets.images.appIcon.image(height: 25, width: 25)
                        : Assets.images.chatUserPicTwo
                            .image(height: 25, width: 25),
                  ),
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      _buildThinkingIndicator(),
                      Text(
                        _formatTimestamp(widget.createdAt),
                        style: AppTextStyles.textCaptionC2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    } else {
      final displayTimestamp = widget.createdAt;
      final formattedTimestamp = _formatTimestamp(displayTimestamp);

      return Align(
        alignment: widget.isMine ? Alignment.centerRight : Alignment.centerLeft,
        child: Column(
          crossAxisAlignment:
              widget.isMine ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            const VerticalSpacing(16),
            Row(
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
                          if (widget.message.isNotEmpty)
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    // Show edit icon on tap for user's own messages
                                    if (widget.isMine &&
                                        widget.onEditTap != null) {
                                      setState(() {
                                        _showEditIcon = !_showEditIcon;
                                      });

                                      // Hide edit icon after 3 seconds
                                      Future.delayed(const Duration(seconds: 3),
                                          () {
                                        if (mounted) {
                                          setState(() {
                                            _showEditIcon = false;
                                          });
                                        }
                                      });
                                    }
                                  },
                                  child: Container(
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        // Show yes/no question UI for questions (answered or unanswered) or when in edit mode

                                        HtmlWidget(
                                          widget.message,
                                          textStyle: widget.isMine
                                              ? AppTextStyles.textBodyB2
                                                  .copyWith(color: Colors.white)
                                              : AppTextStyles.textBodyB2,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                if (widget.isMine &&
                                    widget.onEditTap != null &&
                                    _showEditIcon)
                                  Positioned(
                                    top: -8,
                                    left: -8,
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _showEditIcon = false;
                                        });
                                        widget.onEditTap!();
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(6),
                                        decoration: BoxDecoration(
                                          color: AppColors.bgMedium,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: AppColors.bgBorder,
                                          ),
                                        ),
                                        child: Assets.images.chatEdit.svg(
                                          width: 16,
                                          height: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          if (widget.isLoading)
                            Positioned(
                              bottom: -10,
                              right: widget.isMine ? -10 : null,
                              left: widget.isMine ? null : -10,
                              child: SizedBox(
                                width: 16,
                                height: 16,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    widget.isMine
                                        ? Theme.of(context).primaryColor
                                        : Colors.grey[600]!,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (widget.isEdited)
                            Padding(
                              padding: const EdgeInsets.only(right: 4),
                              child: Text(
                                'edited',
                                style: AppTextStyles.textCaptionC2.copyWith(
                                  fontStyle: FontStyle.italic,
                                  color: AppColors.textColor300,
                                ),
                              ),
                            ),
                          Text(
                            formattedTimestamp,
                            style: AppTextStyles.textCaptionC2,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                if (widget.isMine)
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: ClipOval(
                      child: AppCachedImage(
                        width: 25,
                        height: 25,
                        fit: BoxFit.cover,
                        errorWid: const Icon(Icons.person),
                        imgUrl: Get.find<ProfileController>()
                                .userProfile
                                .value
                                .image ??
                            '',
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      );
    }
  }
}
