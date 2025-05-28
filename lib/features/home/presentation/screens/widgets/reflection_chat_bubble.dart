import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/home/presentation/controllers/reflection_journal_chat_controller.dart';
import 'package:empowered/features/profile/presentation/controllers/profile_controller.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:intl/intl.dart';

class ReflectionChatBubbleContainer extends StatefulWidget {
  const ReflectionChatBubbleContainer({
    required this.isMine,
    required this.message,
    required this.timeStamp,
    required this.onLike,
    super.key,
    this.isLiked = false,
    this.isJournal = false,
    this.isAnotherUser = false,
    this.images,
    this.videos,
    this.voices,
    this.isLoading = false,
    this.isYesNoQuestion = false,
    this.selectedOption,
    this.onYesNoOptionSelected,
    this.isAnswered = false,
    this.isThinking = false,
    this.answerId,
    this.onEditTap,
    this.questionId,
    this.isEditMode = false,
    this.onYesNoEdit,
  });

  final bool isMine;
  final bool isJournal;
  final bool isLiked;
  final bool isAnotherUser;
  final String message;
  final String timeStamp;
  final List<String>? images;
  final List<String>? videos;
  final List<String>? voices;
  final bool isLoading;
  final VoidCallback onLike;
  final bool isYesNoQuestion;
  final String? selectedOption;
  final Function(String)? onYesNoOptionSelected;
  final bool isAnswered;
  final bool isThinking;
  final String? answerId;
  final VoidCallback? onEditTap;
  final String? questionId;
  final bool isEditMode;
  final Function(String, String, String)? onYesNoEdit;

  @override
  State<ReflectionChatBubbleContainer> createState() =>
      _ReflectionChatBubbleContainerState();
}

class _ReflectionChatBubbleContainerState extends State<ReflectionChatBubbleContainer>
    with TickerProviderStateMixin {
  bool isLiked = false; // Internal state for like
  String? _selectedOption;
  String? _editingSelectedOption; // For edit mode
  late List<AnimationController> _dotAnimationControllers;
  late List<Animation<double>> _dotAnimations;

  @override
  void initState() {
    super.initState();
    _selectedOption = widget.selectedOption;
    _editingSelectedOption = widget.selectedOption;
    isLiked = widget.isLiked;

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

  @override
  void didUpdateWidget(ReflectionChatBubbleContainer oldWidget) {
    super.didUpdateWidget(oldWidget);
    
    // Update local state when widget properties change
    if (oldWidget.selectedOption != widget.selectedOption) {
      _selectedOption = widget.selectedOption;
      _editingSelectedOption = widget.selectedOption;
    }
    
    if (oldWidget.isLiked != widget.isLiked) {
      isLiked = widget.isLiked;
    }
  }

  Widget _buildYesNoQuestion() {
    final controller = Get.find<ReflectionJournalChatController>();
    
    return Obx(() {
      final isInEditMode = controller.isYesNoEditMode.value &&
          controller.editingYesNoQuestionId.value == widget.questionId;

      if (widget.isMine) {
        return HtmlWidget(
          widget.message,
          textStyle: AppTextStyles.textBodyB2,
        );
      }

      // Check if question is answered and not in edit mode
      if (widget.isAnswered && !isInEditMode) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HtmlWidget(
              widget.message,
              textStyle: AppTextStyles.textBodyB2,
            ),
          ],
        );
      }

      return Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
            color: isInEditMode ? AppColors.primary500 : AppColors.bgBorder,
            width: isInEditMode ? 2 : 1,
          ),
          color: AppColors.bgMedium,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (isInEditMode)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  'Edit your response:',
                  style: AppTextStyles.textBodyB2.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary500,
                  ),
                ),
              ),
            HtmlWidget(
              widget.message,
              textStyle: AppTextStyles.textBodyB2,
            ),
            const SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildYesNoOption(
                  'Yes',
                  isInEditMode
                      ? _editingSelectedOption == 'Yes'
                      : _selectedOption == 'Yes',
                  () {
                    if (isInEditMode) {
                      setState(() {
                        _editingSelectedOption = 'Yes';
                      });
                    } else if (!widget.isAnswered) {
                      _handleYesNoSelection('Yes');
                    }
                  },
                  isInEditMode,
                  false,
                ),
                const SizedBox(height: 12),
                _buildYesNoOption(
                  'No',
                  isInEditMode
                      ? _editingSelectedOption == 'No'
                      : _selectedOption == 'No',
                  () {
                    if (isInEditMode) {
                      setState(() {
                        _editingSelectedOption = 'No';
                      });
                    } else if (!widget.isAnswered) {
                      _handleYesNoSelection('No');
                    }
                  },
                  isInEditMode,
                  false, 
                ),
              ],
            ),
            if (!isInEditMode && !widget.isAnswered && _selectedOption != null)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  'Selected: $_selectedOption',
                  style: AppTextStyles.textBodyB2.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.primary500,
                  ),
                ),
              ),
            if (isInEditMode)
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _editingSelectedOption = widget.selectedOption;
                        });
                        controller.resetEditMode();
                      },
                      child: Text(
                        'Cancel',
                        style: AppTextStyles.textBodyB2.copyWith(
                          color: AppColors.textColor300,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Obx(() {
                      final isLoading = controller.updateMessageState.value ==
                          TheStates.loading;

                      return ElevatedButton(
                        onPressed: _editingSelectedOption != null && !isLoading
                            ? () async {
                                // Save the edit
                                if (widget.onYesNoEdit != null &&
                                    controller.editingYesNoAnswerId.value != null &&
                                    widget.questionId != null) {
                                  
                                  // Call the edit function and wait for completion
                                  await widget.onYesNoEdit!(
                                    _editingSelectedOption!,
                                    controller.editingYesNoAnswerId.value!,
                                    widget.questionId!,
                                  );
                                }
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary500,
                          foregroundColor: Colors.white,
                        ),
                        child: isLoading
                            ? const SizedBox(
                                width: 16,
                                height: 16,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.white,
                                  ),
                                ),
                              )
                            : Text(
                                'Save',
                                style: AppTextStyles.textBodyB2.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                      );
                    }),
                  ],
                ),
              ),
          ],
        ),
      );
    });
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

  Widget _buildYesNoOption(
    String text,
    bool isSelected,
    Function() onTap,
    bool isEditMode, [
    bool isDisabled = false,
  ]) {
    return InkWell(
      onTap: isDisabled ? null : onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        child: Row(
          children: [
            Radio<String>(
              value: text,
              groupValue: isEditMode ? _editingSelectedOption : _selectedOption,
              onChanged: isDisabled
                  ? null
                  : (value) {
                      if (value != null) {
                        onTap();
                      }
                    },
              activeColor: AppColors.primary500,
            ),
            const SizedBox(width: 12),
            Text(
              text,
              style: AppTextStyles.textBodyB2.copyWith(
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                color: isDisabled
                    ? AppColors.textColor300
                    : isEditMode && isSelected
                        ? AppColors.primary500
                        : AppColors.textColor100,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleYesNoSelection(String option) {
    setState(() {
      _selectedOption = option;
    });

    widget.onYesNoOptionSelected?.call(option);
  }

  @override
  void dispose() {
    for (final controller in _dotAnimationControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  String _formatTimestamp(String timestamp) {
    try {
      // Parse the ISO 8601 timestamp
      final dateTime = DateTime.parse(timestamp).timeZoneName == 'UTC'
          ? DateTime.parse(timestamp).toLocal()
          : DateTime.parse(timestamp);

      // Format based on how long ago the message was sent
      final now = DateTime.now();
      final difference = now.difference(dateTime);

      if (difference.inDays == 0) {
        // Same day - show time only
        return DateFormat('hh:mm a').format(dateTime);
      } else if (difference.inDays == 1) {
        // Yesterday - show "Yesterday at HH:MM"
        return 'Yesterday at ${DateFormat('hh:mm a').format(dateTime)}';
      } else if (difference.inDays < 7) {
        // Within last week - show weekday
        return DateFormat('EEEE').format(dateTime);
      } else {
        // Older than a week - show date
        return DateFormat('MMM d, yyyy').format(dateTime);
      }
    } catch (e) {
      // Fallback to original timestamp if parsing fails
      return timestamp;
    }
  }

  void _showPopupMenu(BuildContext context, Offset position) {
    final left = position.dx - 80;
    final top = position.dy - 60;

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
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      if (widget.onEditTap != null) {
                        widget.onEditTap!();
                      }
                    },
                    child: Assets.images.chatEdit.svg(width: 20),
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
                        _formatTimestamp(widget.timeStamp),
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
      final formattedTimestamp = _formatTimestamp(widget.timeStamp);

      return Align(
        alignment: widget.isMine ? Alignment.centerRight : Alignment.centerLeft,
        child: Column(
          crossAxisAlignment:
              widget.isMine ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            const VerticalSpacing(16),
            GestureDetector(
              onLongPressStart: (details) {
                widget.isMine
                    ? _showPopupMenu(context, details.globalPosition)
                    : null;
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
                            if (widget.message.isNotEmpty)
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
                                    // Show yes/no question UI for questions (answered or unanswered) or when in edit mode
                                    if (widget.isYesNoQuestion &&
                                        !widget.isMine)
                                      _buildYesNoQuestion()
                                    else
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
                            if (isLiked)
                              Positioned(
                                right: -10,
                                bottom: -10,
                                child: Assets.images.chatBubbleLike
                                    .image(width: 32),
                              ),
                          ],
                        ),
                        Text(
                          formattedTimestamp,
                          style: AppTextStyles.textCaptionC2,
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
            ),
          ],
        ),
      );
    }
  }
}