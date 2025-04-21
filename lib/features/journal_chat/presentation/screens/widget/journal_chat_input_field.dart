import 'dart:async';
import 'dart:io';

import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/journal_chat/presentation/controllers/journal_chat_controller.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:just_audio/just_audio.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:video_player/video_player.dart';

class JournalChatInputField extends StatefulWidget {
  const JournalChatInputField({
    required this.focusNode,
    required this.journalId,
    this.mainQuestionId,
    this.followupQuestionId,
    super.key,
  });
  final FocusNode focusNode;
  final String journalId;
  final String? mainQuestionId;
  final String? followupQuestionId;

  @override
  State<JournalChatInputField> createState() => _JournalChatInputFieldState();
}

class _JournalChatInputFieldState extends State<JournalChatInputField> {
  final controller = Get.find<JournalChatController>();
  final quill.QuillController _controller = quill.QuillController.basic();
  bool showEditor = false;
  List<String> _selectedMediaPaths = [];
  bool isVoiceRecording = false;
  bool isRecordingPlaying = false;
  String? recordingPath;
  String playbackTime = '0:00';

  final AudioRecorder audioRecord = AudioRecorder();
  final AudioPlayer audioPlayer = AudioPlayer();
  late final StreamSubscription<Duration> _positionSubscription;
  Duration _recordingDuration = Duration.zero;
  Timer? _recordingTimer;
  String recordingHint = 'Recording... 0:00';
  @override
  void dispose() {
    _controller.dispose();
    audioPlayer.dispose();
    _positionSubscription.cancel();
    super.dispose();
  }

  VideoPlayerController? _videoController;
  @override
  void initState() {
    super.initState();
    _positionSubscription = audioPlayer.positionStream.listen((position) {
      debugPrint('Playback position: $position');
      final minutes = position.inMinutes;
      final seconds = position.inSeconds % 60;
      setState(() {
        playbackTime =
            '${minutes.toString().padLeft(1, '0')}:${seconds.toString().padLeft(2, '0')}';
      });
    });
    audioPlayer.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        setState(() {
          isRecordingPlaying = false;
          _resetPlayBacktime();
        });
        audioPlayer.stop(); // Ensure playback stops
      }
    });
  }

  // void _startRecordingTimer() {
  //   _recordingDuration = Duration.zero;
  //   _recordingTimer?.cancel();
  //   _recordingTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
  //     setState(() {
  //       _recordingDuration += const Duration(seconds: 1);
  //       final minutes = _recordingDuration.inMinutes.toString().padLeft(1, '0');
  //       final seconds =
  //           (_recordingDuration.inSeconds % 60).toString().padLeft(2, '0');
  //       recordingHint = 'Recording... $minutes:$seconds';
  //     });
  //   });
  // }
  Future<void> _startRecording() async {
    if (!await audioRecord.hasPermission()) {
      // Handle permission denied case
      return;
    }

    final appDocumentsDir = await getApplicationDocumentsDirectory();
    final filePath = p.join(
      appDocumentsDir.path,
      'voice_message_${DateTime.now().millisecondsSinceEpoch}.wav',
    );

    const recordConfig = RecordConfig(
      encoder: AudioEncoder.wav,
    );

    await audioRecord.start(recordConfig, path: filePath);
    setState(() {
      isVoiceRecording = true;
      _recordingDuration = Duration.zero;
      _recordingTimer?.cancel();
      _recordingTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          _recordingDuration += const Duration(seconds: 1);
          recordingHint = 'Recording... ${_formatDuration(_recordingDuration)}';
        });
      });
    });
  }

  Future<void> _stopRecording() async {
    if (isVoiceRecording) {
      final filePath = await audioRecord.stop();
      setState(() {
        isVoiceRecording = false;
        recordingPath = filePath;
        _recordingTimer?.cancel();
      });
    }
  }
  // void _stopRecording() {
  //   _recordingTimer?.cancel();
  //   _recordingDuration = Duration.zero;
  //   setState(() {
  //     recordingHint = 'Recording... 0:00';
  //   });
  // }

  void _resetPlayBacktime() {
    playbackTime = '0:00';
  }
  // String getFormattedHtml() {
  //   final document = _controller.document;
  //   final delta = document.toDelta().toJson();

  //   // return parse(delta).documentElement?.outerHtml ?? '';
  //   return parse(delta).documentElement?.innerHtml ?? '';
  // }
  String getFormattedHtml() {
    final document = _controller.document;

    // Create an HTML representation of the Quill document
    var html = '';

    // Process each operation in the Delta
    for (final op in document.toDelta().operations) {
      if (op.data is String) {
        var text = op.data! as String;
        var attributes = op.attributes;

        if (attributes == null || attributes.isEmpty) {
          html += text;
        } else {
          // Start with the raw text
          var formattedText = text;

          // Apply formatting based on attributes
          if (attributes.containsKey('bold') && attributes['bold'] == true) {
            formattedText = '<strong>$formattedText</strong>';
          }
          if (attributes.containsKey('italic') &&
              attributes['italic'] == true) {
            formattedText = '<em>$formattedText</em>';
          }
          if (attributes.containsKey('underline') &&
              attributes['underline'] == true) {
            formattedText = '<u>$formattedText</u>';
          }
          if (attributes.containsKey('strike') &&
              attributes['strike'] == true) {
            formattedText = '<s>$formattedText</s>';
          }
          if (attributes.containsKey('code') && attributes['code'] == true) {
            formattedText = '<code>$formattedText</code>';
          }

          html += formattedText;
        }
      }
    }

    return html;
  }

  void sendMessageWithFormatting() {
    final htmlContent = getFormattedHtml();
    print('htmlContent: >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>$htmlContent');
    if (htmlContent.trim().isNotEmpty || _selectedMediaPaths.isNotEmpty) {
      // Send HTML content wrapped in a div to preserve structure
      controller.sendMessage(
        widget.journalId,
        null,
        htmlContent,
        widget.mainQuestionId,
        widget.followupQuestionId,
      );

      // Send any attached media
      for (final filePath in _selectedMediaPaths) {
        controller.sendMessage(
          widget.journalId,
          filePath,
          null,
          widget.mainQuestionId,
          widget.followupQuestionId,
        );
      }
      setState(() {
        _selectedMediaPaths = []; // Reset selection
        if (showEditor) {
          _controller.clear();
        } else {
          controller.chatController.clear();
          recordingPath = null; // Reset recording state
        }
      });
    }
  }

  Future<void> _loadVideo(String filePath) async {
    if (_videoController != null) {
      await _videoController!.dispose();
    }

    final controller = VideoPlayerController.file(File(filePath));
    await controller.initialize();

    setState(() {
      _videoController = controller;
      _videoController!.pause(); // Ensure it is paused
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        color: AppColors.bgBorder,
        borderRadius: BorderRadius.all(Radius.circular(24)),
      ),
      child: Column(
        children: [
          if (showEditor)
            DefaultTextStyle(
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.textColor100,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: quill.QuillEditor.basic(
                  focusNode: widget.focusNode,
                  controller: _controller,
                  configurations: quill.QuillEditorConfigurations(
                    minHeight: showEditor ? 120 : 50,
                  ),
                ),
              ),
            )
          else if (isVoiceRecording)
            TextField(
              readOnly: true,
              // focusNode: widget.focusNode,
              onTap: () async {
                await Future.delayed(const Duration(milliseconds: 500));
                controller.scrollToBottom();
              },
              controller: controller.chatController,
              decoration: InputDecoration(
                hintText: recordingHint,
                hintStyle: AppTextStyles.textBodyB2
                    .copyWith(color: AppColors.textColor200),
                border: InputBorder.none,
              ),
              style: const TextStyle(color: Colors.white),
            )
          else if (recordingPath != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: _buildAudioUI(),
            )
          else
            TextField(
              focusNode: widget.focusNode,
              onTap: () async {
                await Future.delayed(const Duration(milliseconds: 500));
                controller.scrollToBottom();
              },
              controller: controller.chatController,
              decoration: InputDecoration(
                hintText: 'Message...',
                hintStyle: AppTextStyles.textBodyB2
                    .copyWith(color: AppColors.textColor200),
                border: InputBorder.none,
              ),
              style: const TextStyle(color: Colors.white),
            ),
          Row(
            children: [
              if (showEditor)
                InkWell(
                  onTap: () {
                    setState(() {
                      showEditor = false;
                    });
                  },
                  child: const Icon(
                    Icons.close,
                    color: AppColors.primary500,
                  ).paddingOnly(right: 4),
                ),
              if (showEditor)
                Expanded(
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      iconTheme: const IconThemeData(
                        color: Colors.white,
                      ), // Set tool icons to white
                      buttonTheme: const ButtonThemeData(
                        buttonColor: Colors.white,
                      ), // For buttons, if applicable
                    ),
                    child: quill.QuillSimpleToolbar(
                      controller: _controller,
                      configurations:
                          const quill.QuillSimpleToolbarConfigurations(
                        toolbarSectionSpacing: 2,
                        showJustifyAlignment: false,
                        showListBullets: false,
                        showCenterAlignment: false,
                        showClearFormat: false,
                        showFontFamily: false,
                        showFontSize: false,
                        showBackgroundColorButton: false,
                        showColorButton: false,
                        showHeaderStyle: false,
                        showLink: false,
                        showUndo: false,
                        showRedo: false,
                        showListCheck: false,
                        showIndent: false,
                        showSubscript: false,
                        showSuperscript: false,
                        showSearchButton: false,
                        showClipboardCut: false,
                        showClipboardCopy: false,
                        showClipboardPaste: false,
                        multiRowsDisplay: false,
                        color: AppColors.transparent,
                      ),
                    ),
                  ),
                )
              else
                buildControls(),
              const HorizontalSpacing(8),
              InkWell(
                onTap: () async {
                  if (showEditor) {
                    sendMessageWithFormatting();
                  } else {
                    if (_selectedMediaPaths.isNotEmpty ||
                        controller.chatController.text.trim().isNotEmpty ||
                        recordingPath != null) {
                      // Send text if available
                      if (controller.chatController.text.trim().isNotEmpty) {
                        controller.sendMessage(
                          widget.journalId,
                          null,
                          controller.chatController.text,
                          widget.mainQuestionId,
                          widget.followupQuestionId,
                        );
                      }

                      // Send any attached media
                      for (final filePath in _selectedMediaPaths) {
                        controller.sendMessage(
                          widget.journalId,
                          filePath,
                          null,
                          widget.mainQuestionId,
                          widget.followupQuestionId,
                        );
                      }

                      // Send audio recording if exists
                      if (recordingPath != null) {
                        await controller.sendMessage(
                          widget.journalId,
                          recordingPath,
                          null,
                          widget.mainQuestionId,
                          widget.followupQuestionId,
                        );
                      }

                      setState(() {
                        _selectedMediaPaths = []; // Reset selection
                        if (showEditor) {
                          _controller.clear();
                        } else {
                          controller.chatController.clear();
                          recordingPath = null; // Reset recording state
                        }
                      });
                    }
                  }
                },
                child: Assets.images.sendMessageIcon.svg(width: 40, height: 40),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Expanded buildControls() {
    return Expanded(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child:
                Assets.images.addIconWithBackground.svg(width: 40, height: 40),
          ),
          // InkWell(
          //   onTap: () =>
          //       isVoiceRecording ? _stopRecording() : _startRecording(),
          //   // onTap: () async {
          //   //   if (isVoiceRecording) {
          //   //     var filePath = await audioRecord.stop();
          //   //     if (filePath != null) {
          //   //       _stopRecordingTimer();
          //   //       setState(() {
          //   //         isVoiceRecording = false;
          //   //         recordingPath = filePath;
          //   //       });
          //   //     }
          //   //   } else {
          //   //     if (await audioRecord.hasPermission()) {
          //   //       final appDocumentsDir =
          //   //           await getApplicationDocumentsDirectory();
          //   //       final filePath = p.join(
          //   //         appDocumentsDir.path,
          //   //         'message.wav',
          //   //       );
          //   //       await audioRecord.start(const RecordConfig(), path: filePath);
          //   //       setState(() {
          //   //         isVoiceRecording = true;
          //   //         debugPrint('isVoiceRecording: $isVoiceRecording');
          //   //         recordingPath = null;
          //   //         _startRecordingTimer();
          //   //       });
          //   //     }
          //   //   }
          //   // },
          //   child: isVoiceRecording
          //       ? Container(
          //           height: 25,
          //           width: 25,
          //           decoration: const BoxDecoration(
          //             shape: BoxShape.circle,
          //             color: Colors.red, // Background color of the circle
          //           ),
          //           padding: const EdgeInsets.all(
          //             4,
          //           ), // Optional: controls the size of the circle
          //           child: Assets.images.chatMicrophone.image(width: 20),
          //         )
          //       : Assets.images.chatMicrophone.image(width: 20),
          // ),
         // const HorizontalSpacing(20),
          InkWell(
            onTap: () {
              setState(() {
                showEditor = true;
              });
            },
            child: Assets.images.chatText.image(width: 20),
          ),
          const HorizontalSpacing(20),
          // InkWell(
          //   onTap: () async {
          //     try {
          //       final result = await FilePicker.platform.pickFiles(
          //         allowMultiple: true,
          //         // type: FileType.custom,
          //         // type: FileType.any,
          //       );

          //       if (result != null && result.files.isNotEmpty) {
          //         for (final file in result.files) {
          //           if (file.path != null) {
          //             final filePath = file.path!;
          //             if (filePath.endsWith('.mp4') ||
          //                 filePath.endsWith('.mov')) {
          //               await _loadVideo(filePath);
          //             } else {
          //               await controller.sendMessage(
          //                 widget.journalId,
          //                 filePath,
          //                 null,
          //                 widget.mainQuestionId,
          //                 widget.followupQuestionId,
          //               );
          //             }
          //           } else {
          //             debugPrint('File path is null for a selected file');
          //           }
          //         }
          //       } else {
          //         debugPrint('No files selected or result is null');
          //       }
          //     } catch (e) {
          //       debugPrint('File picking error: $e');
          //       ScaffoldMessenger.of(context).showSnackBar(
          //         SnackBar(content: Text('Error selecting files: $e')),
          //       );
          //     }
          //   },
          //   child: Assets.images.chatAttachment.image(width: 20),
          // ),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _buildAudioUI() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.color324E65,
        borderRadius: BorderRadius.circular(20),
      ),
      width: 180,
      // width: Get.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (recordingPath != null)
            GestureDetector(
              onTap: () {
                setState(() {
                  recordingPath = null;
                  isRecordingPlaying = false;
                  _resetPlayBacktime();
                });
                audioPlayer.stop();
              },
              child: Container(
                height: 35,
                width: 35,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
                child: const Icon(Icons.close_rounded),
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Text(
              isRecordingPlaying
                  ? playbackTime
                  : _formatDuration(_recordingDuration),
              style: AppTextStyles.textBodyB2,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () async {
                  if (audioPlayer.playing) {
                    audioPlayer.stop();
                    await audioPlayer.seek(Duration.zero);
                    _resetPlayBacktime();
                    setState(() {
                      isRecordingPlaying = false;
                    });
                  } else {
                    await audioPlayer.setFilePath(recordingPath!);
                    await audioPlayer.seek(Duration.zero);
                    audioPlayer.play();

                    setState(() {
                      isRecordingPlaying = true;
                    });
                  }
                },
                child: Container(
                  height: 35,
                  width: 35,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                  ),
                  child: isRecordingPlaying
                      ? const Icon(Icons.stop)
                      : const Icon(Icons.play_arrow),
                ),
              ),
              // const HorizontalSpacing(8),
              // InkWell(
              //   onTap: () async {
              //     await controller.sendMessage(
              //       widget.journalId,
              //       recordingPath,
              //       null,
              //       widget.mainQuestionId,
              //       widget.followupQuestionId,
              //     );
              //   },
              //   child: Assets.images.sendMessageIcon.svg(width: 40, height: 40),
              // ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}
