import 'package:chewie/chewie.dart';
import 'package:empowered/core/extension/extensions.dart';
// import 'package:empowered/features/chat/presentation/screens/widget/media_view_screens.dart';
import 'package:empowered/features/profile/presentation/controllers/profile_controller.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:intl/intl.dart';

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

  @override
  State<ChatBubbleContainer> createState() => _ChatBubbleContainerState();
}

class _ChatBubbleContainerState extends State<ChatBubbleContainer>
    with TickerProviderStateMixin {
  bool isLiked = false; // Internal state for like
  // VideoPlayerController? _videoController;
  ChewieController? _chewieController;
  bool _isVideoInitialized = false;
  // late AudioPlayer _audioPlayer;
  bool _isPlaying = false;
  String? _selectedOption;
  late List<AnimationController> _dotAnimationControllers;
  late List<Animation<double>> _dotAnimations;
  @override
  void initState() {
    super.initState();
    _selectedOption = widget.selectedOption;
    // _audioPlayer = AudioPlayer();
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

  Widget _buildYesNoQuestion() {
    if (widget.isAnswered) {
      return HtmlWidget(
        widget.message,
        textStyle: AppTextStyles.textBodyB2,
      );
    } else {
      return Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.bgBorder),
          color: AppColors.bgMedium,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            HtmlWidget(
              widget.message,
              textStyle: AppTextStyles.textBodyB2,
            ),
            const SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildYesNoOption('Yes', _selectedOption == 'Yes', () {
                  _handleYesNoSelection('Yes');
                }),
                const SizedBox(height: 12),
                _buildYesNoOption('No', _selectedOption == 'No', () {
                  _handleYesNoSelection('No');
                }),
              ],
            ),
            if (_selectedOption != null)
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
          ],
        ),
      );
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
          // Text(
          //   'AI is thinking',
          //   style: AppTextStyles.textBodyB2.copyWith(
          //     color: AppColors.textColor300,
          //     fontStyle: FontStyle.italic,
          //   ),
          // ),
          // const SizedBox(width: 8),
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

  Widget _buildYesNoOption(String text, bool isSelected, Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        child: Row(
          children: [
            Radio<String>(
              value: text,
              groupValue: _selectedOption,
              onChanged: (value) {
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
                fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
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

  // String _extractTextFromHtml(String htmlContent) {
  //   try {
  //     final document = parse(htmlContent);
  //     return document.body?.text ?? '';
  //   } catch (e) {
  //     return htmlContent;
  //   }
  // }

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
                          if (widget.onEditTap != null) {
                            widget.onEditTap!();
                          }
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
    if (widget.isThinking) {
      print(
        '::::::::::::::::::::::::::::::::::::::::::::::::Building thinking indicator',
      );
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
                                    if (widget.isYesNoQuestion)
                                      _buildYesNoQuestion()
                                    else
                                      HtmlWidget(
                                        //  shrinkWrap: true,
                                        widget.message,
                                        textStyle: AppTextStyles.textBodyB2,
                                      ),
                                  ],
                                ),
                              ),
                            // Column(
                            //   children: [
                            //     if (widget.images != null &&
                            //         widget.images!.isNotEmpty)
                            //       InkWell(
                            //         onTap: () {
                            //           Navigator.push(
                            //             context,
                            //             MaterialPageRoute(
                            //               builder: (context) =>
                            //                   FullscreenImageView(
                            //                 imagePath: widget.images!.first,
                            //               ),
                            //             ),
                            //           );
                            //         },
                            //         child: Wrap(
                            //           spacing: 8,
                            //           runSpacing: 8,
                            //           children: widget.images!.map((url) {
                            //             return Container(
                            //               width: 150,
                            //               height: 150,
                            //               clipBehavior: Clip.antiAlias,
                            //               decoration: BoxDecoration(
                            //                 borderRadius:
                            //                     BorderRadius.circular(8),
                            //                 color: Colors.black,
                            //               ),
                            //               child: Image.network(
                            //                 url,
                            //                 fit: BoxFit.cover,
                            //                 loadingBuilder: (
                            //                   context,
                            //                   child,
                            //                   loadingProgress,
                            //                 ) {
                            //                   if (loadingProgress == null) {
                            //                     return child;
                            //                   }
                            //                   return Center(
                            //                     child:
                            //                         CircularProgressIndicator(
                            //                       value: loadingProgress
                            //                                   .expectedTotalBytes !=
                            //                               null
                            //                           ? loadingProgress
                            //                                   .cumulativeBytesLoaded /
                            //                               loadingProgress
                            //                                   .expectedTotalBytes!
                            //                           : null,
                            //                     ),
                            //                   );
                            //                 },
                            //                 errorBuilder:
                            //                     (context, error, stackTrace) =>
                            //                         const ColoredBox(
                            //                   color: Colors.black,
                            //                   child: Icon(
                            //                     Icons.broken_image,
                            //                     color: Colors.white,
                            //                   ),
                            //                 ),
                            //               ),
                            //             );
                            //           }).toList(),
                            //         ),
                            //       ),
                            //     const SizedBox(height: 8),
                            //   ],
                            // ),
                            if (widget
                                .isLoading) // Use widget.isLoading directly
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
    // final displayMessage = _extractTextFromHtml(widget.message);
  }
}
