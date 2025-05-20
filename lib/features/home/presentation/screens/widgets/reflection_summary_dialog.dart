import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/export_pdf/custom_pdf.dart';
import 'package:empowered/features/home/data/model/see_user_reflection_response_model.dart';
import 'package:empowered/features/journal_chat/presentation/screens/widget/journal_summary_dialog.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class ReflectionSummaryDialog extends StatefulWidget {
  const ReflectionSummaryDialog({required this.userReflection, super.key});
  final List<SeeUserReflection>? userReflection;

  @override
  State<ReflectionSummaryDialog> createState() =>
      _ReflectionSummaryDialogState();
}

class _ReflectionSummaryDialogState extends State<ReflectionSummaryDialog> {
  final PageController _pageController = PageController();
  int _currentReflectionIndex = 0;
  void _nextReflection() {
    if (_currentReflectionIndex < (widget.userReflection?.length ?? 0) - 1) {
      setState(() {
        _currentReflectionIndex++;
      });
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousReflection() {
    if (_currentReflectionIndex > 0) {
      setState(() {
        _currentReflectionIndex--;
      });
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  String formatDateTime(String? dateTimeStr) {
    if (dateTimeStr == null) return 'N/A';
    try {
      final dateTime = DateTime.parse(dateTimeStr);
      return DateFormat.yMd().format(dateTime.toLocal());
    } catch (e) {
      return 'N/A';
    }
  }

  Future<void> _shareReflection() async {
    try {
      if (widget.userReflection == null || widget.userReflection!.isEmpty) {
        // Show error if no Reflection data available
        AppUtils.showErrorSnackbar(
          message: 'No Reflection data available for sharing',
        );
        return;
      }

      // Create a list of Reflection IDs to export
      final reflectionIds =
          widget.userReflection!.map((reflection) => reflection.id.toString()).toList();

      if (reflectionIds.isEmpty) {
        AppUtils.showErrorSnackbar(
          message: 'No valid reflections found for export',
        );
        return;
      }

      // Format data for PDF
      var formattedData = '';
      var fromToDate = '';

      // Format reflection data for PDF
      if (widget.userReflection!.isNotEmpty) {
        // Format data based on Reflection questions and answers
        formattedData = _formatReflectionDataForPdf();

        // Generate date range for PDF header
        if (widget.userReflection!.length == 1 &&
            widget.userReflection!.first.createdAt != null) {
          fromToDate = widget.userReflection!.first.createdAt!.toString();
        } else {
          // Find oldest and newest entries
          final dates = widget.userReflection!
              .where((j) => j.createdAt != null)
              .map((j) => j.createdAt!)
              .toList();

          if (dates.isNotEmpty) {
            dates.sort();
            fromToDate = '${dates.first} - ${dates.last}';
          } else {
            fromToDate = 'Reflection Export';
          }
        }
      }

      // Export the PDF with sharing enabled
      await exportPdf(
        context,
        data: formattedData,
        fromToDate: fromToDate,
        shouldShare: true, // Enable sharing
      );
    } catch (e) {
      print('Error sharing Reflections to PDF: $e');
      AppUtils.showErrorSnackbar(message: 'Failed to share Reflections: $e');
    }
  }

  String _formatReflectionDataForPdf() {
    final buffer = StringBuffer();

    for (final reflection in widget.userReflection!) {
      // Add Reflection emotion/title
      buffer
        ..writeln(reflection.reflection?.emotionName ?? 'Untitled Reflection')
        ..writeln('-------------------------------------------');

      final reflectionAnswers = reflection.reflectionAnswers;
      if (reflectionAnswers != null && reflectionAnswers.isNotEmpty) {
        for (final answer in reflectionAnswers) {
          // Add main question and answer
          if (answer.mainQuestion != null) {
            buffer
              ..writeln('Q: ${answer.mainQuestion!.question ?? "Question"}')
              ..writeln('A: ${answer.text ?? "No answer provided"}')
              ..writeln();
          }

          // Add follow-up question and answer if available
          if (answer.followUpQuestion != null) {
            buffer
              ..writeln(
                'Q: ${answer.followUpQuestion!.question ?? "Follow-up Question"}',
              )
              ..writeln('A: ${answer.text ?? "No answer provided"}')
              ..writeln();
          }
        }
      } else {
        buffer.writeln('No answers available for this Reflection.');
      }

      buffer.writeln('\n\n');
    }

    return buffer.toString();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.userReflection == null || widget.userReflection!.isEmpty) {
      return const Center(
        child: Text(
          'No Reflection data available',
          style: TextStyle(color: Colors.white),
        ),
      );
    }
    return SafeArea(
      child: Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(16),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF0D1B2A),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.blueAccent),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Top Bar with Reflection Title
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      widget.userReflection?[_currentReflectionIndex].reflection
                              ?.emotionName ??
                          'Reflection Summary',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),

              const SizedBox(height: 12),
              //display date here
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  formatDateTime(
                    widget.userReflection?[_currentReflectionIndex].createdAt.toString(),
                  ),
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ),
              // Navigation Controls
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: _previousReflection,
                    child: const Text(
                      'Previous',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Text(
                    'Reflection ${_currentReflectionIndex + 1} of ${widget.userReflection?.length}',
                    style: const TextStyle(color: Colors.white70),
                  ),
                  TextButton(
                    onPressed: _nextReflection,
                    child: const Text(
                      'Next',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Scrollable Content for Reflection Entries
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: widget.userReflection?.length ?? 0,
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (index) {
                    setState(() => _currentReflectionIndex = index);
                  },
                  itemBuilder: (context, reflectionIndex) {
                    final currentReflection =
                        widget.userReflection![reflectionIndex];
                    final reflectionAnswers =
                        currentReflection.reflectionAnswers;

                    if (reflectionAnswers == null ||
                        reflectionAnswers.isEmpty) {
                      return Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF1B263B),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Text(
                            'No answers available',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                    }

                    // Display all questions and answers for the current Reflection
                    return Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF1B263B),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Show all main questions and their answers
                              for (final reflectionAnswer
                                  in reflectionAnswers) ...[
                                if (reflectionAnswer.mainQuestion != null) ...[
                                  JournalSection(
                                    title: reflectionAnswer
                                            .mainQuestion!.question ??
                                        'Question',
                                    content: reflectionAnswer.text ??
                                        'No answer provided',
                                    isQuestion: true,
                                  ),
                                  const SizedBox(height: 16),
                                ],

                                // Show follow-up questions if they exist
                                if (reflectionAnswer.followUpQuestion !=
                                    null) ...[
                                  JournalSection(
                                    title: reflectionAnswer
                                            .followUpQuestion!.question ??
                                        'Follow-up Question',
                                    content: reflectionAnswer.text ??
                                        'No answer provided',
                                    isQuestion: true,
                                  ),
                                  // const SizedBox(height: 16),

                                  // Display additional metadata for follow-up questions
                                  // Column(
                                  //   crossAxisAlignment: CrossAxisAlignment.start,
                                  //   children: [
                                  //     if (journalAnswer.followUpQuestion?.questionType != null)
                                  //       Padding(
                                  //         padding: const EdgeInsets.only(bottom: 4),
                                  //         child: Text(
                                  //           'Type: ${journalAnswer.followUpQuestion!.questionType}',
                                  //           style: const TextStyle(color: Colors.white70, fontSize: 12),
                                  //         ),
                                  //       ),
                                  //     if (journalAnswer.followUpQuestion?.options != null)
                                  //       Text(
                                  //         'Options: ${journalAnswer.followUpQuestion!.options}',
                                  //         style: const TextStyle(color: Colors.white70, fontSize: 12),
                                  //       ),
                                  //   ],
                                  // ),
                                  const SizedBox(height: 16),
                                ],
                              ],
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              // Share Button
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                  onPressed: () {
                    _shareReflection();
                  },
                  child: const Text('Share'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
