class MessageItem {
  MessageItem({
    required this.type,
    required this.message,
    required this.isMine,
    this.timestamp,
    this.images,
    this.videos,
    this.voices,
    this.isLoading = false,
    this.isYesNoQuestion = false,
    this.selectedOption,
    this.questionId,
    this.answered = false,
    this.isThinking = false,
    this.answerId,
    this.hide = false,
  });
  final MessageType type;
  final String message;
  final String? timestamp;
  final bool isMine;
  final List<String>? images;
  final List<String>? videos;
  final List<String>? voices;
  final bool isLoading;
  final bool isYesNoQuestion;
  final String? selectedOption;
  final String? questionId;
  final bool answered;
  final bool isThinking;
  final String? answerId;
  final bool hide;
}

enum MessageType { question, answer, option, thinking }
