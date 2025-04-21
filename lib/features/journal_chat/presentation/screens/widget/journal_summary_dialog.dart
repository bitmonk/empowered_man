import 'package:empowered/features/journal_chat/data/model/user_journals_model.dart';
import 'package:flutter/material.dart';

class JournalSummaryDialog extends StatefulWidget {
  const JournalSummaryDialog({required this.userJournal, super.key});
  final List<UserJournal>? userJournal;

  @override
  State<JournalSummaryDialog> createState() => _JournalSummaryDialogState();
}

class _JournalSummaryDialogState extends State<JournalSummaryDialog> {
  @override
  void initState() {
    super.initState();
    print(
      'Journal Summary Dialog initialized with user journal: >>>>>>>>>>>>${widget.userJournal}',
    );
  }

  final PageController _pageController = PageController();
  int _currentJournalIndex = 0;

  void _nextJournal() {
    if (_currentJournalIndex < (widget.userJournal?.length ?? 0) - 1) {
      setState(() {
        _currentJournalIndex++;
      });
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousJournal() {
    if (_currentJournalIndex > 0) {
      setState(() {
        _currentJournalIndex--;
      });
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.userJournal == null || widget.userJournal!.isEmpty) {
      return const Center(
          child: Text('No journal data available',
              style: TextStyle(color: Colors.white)));
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
              // Top Bar with Journal Title
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      widget.userJournal?[_currentJournalIndex].journal?.emotionName ?? 'Journal Summary',
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

              // Navigation Controls
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: _previousJournal,
                    child: const Text(
                      'Previous',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Text(
                    'Journal ${_currentJournalIndex + 1} of ${widget.userJournal?.length}',
                    style: const TextStyle(color: Colors.white70),
                  ),
                  TextButton(
                    onPressed: _nextJournal,
                    child: const Text(
                      'Next',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              
              // Scrollable Content for Journal Entries
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: widget.userJournal?.length ?? 0,
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (index) {
                    setState(() => _currentJournalIndex = index);
                  },
                  itemBuilder: (context, journalIndex) {
                    final currentJournal = widget.userJournal![journalIndex];
                    final journalAnswers = currentJournal.journalAnswers;

                    if (journalAnswers == null || journalAnswers.isEmpty) {
                      return Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF1B263B),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Text('No answers available',
                              style: TextStyle(color: Colors.white))
                        ),
                      );
                    }

                    // Display all questions and answers for the current journal
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
                              for (final journalAnswer in journalAnswers) ...[
                                if (journalAnswer.mainQuestion != null) ...[
                                  JournalSection(
                                    title: journalAnswer.mainQuestion!.question ?? 'Question',
                                    content: journalAnswer.text ?? 'No answer provided',
                                    isQuestion: true,
                                  ),
                                  const SizedBox(height: 16),
                                ],
                                
                                // Show follow-up questions if they exist
                                if (journalAnswer.followUpQuestion != null) ...[
                                  JournalSection(
                                    title: journalAnswer.followUpQuestion!.question ?? 'Follow-up Question',
                                    content: journalAnswer.text ?? 'No answer provided',
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
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('Share'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class JournalSection extends StatelessWidget {
  const JournalSection({
    required this.title,
    required this.content,
    this.isQuestion = false,
    super.key,
  });

  final String title;
  final String content;
  final bool isQuestion;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Question title with icon
        Row(
          children: [
            if (isQuestion)
              // const Padding(
              //   padding: EdgeInsets.only(right: 6),
              //   child: Icon(Icons.help_outline, color: Colors.white, size: 16),
              // ),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
            content,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),),
        // Answer container
        // Container(
        //   width: double.infinity,
        //   padding: const EdgeInsets.all(12),
        //   decoration: BoxDecoration(
        //     color: const Color(0xFF2A3950),
        //     borderRadius: BorderRadius.circular(8),
        //     border: Border.all(
        //       color: Colors.blueAccent.withOpacity(0.3),
        //       width: 1,
        //     ),
        //   ),
        //   child: Text(
        //     content,
        //     style: const TextStyle(
        //       color: Colors.white,
        //       fontSize: 14,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}