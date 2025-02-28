import 'package:empowered/features/faq/data/model/faq_support_response.dart';
import 'package:empowered/features/faq/data/source/faq_support_remote_source.dart';
import 'package:get/get.dart';

class FaqController extends GetxController {
  FaqController({required this.remoteSource});
  RxInt expandedIndex = 0.obs;

  List<String> items = [
    'General Info',
    'App Features',
    'Support',
  ];

  RxList<FaqItemDetailsModel> faqDataDetailList = <FaqItemDetailsModel>[].obs;

  List<FaqItemDetailsModel> generalInfoList = [
    FaqItemDetailsModel(
      title: 'How do I create a task?',
      titleNumber: '01',
      description:
          'To create a task, navigate to the "Tasks" section and click on the "+" button. Enter the task title, set a due date, and add any additional details or reminders to stay on track.',
    ),
    FaqItemDetailsModel(
      title: 'How do I set reminders for my tasks?',
      titleNumber: '02',
      description:
          'You can set reminders by selecting a task and choosing the "Remind Me" option. Pick a date and time, and the app will notify you when it’s time to complete your task.',
    ),
    FaqItemDetailsModel(
      title: 'Can I create recurring tasks?',
      titleNumber: '03',
      description:
          'Yes! When creating a new task, select the "Repeat" option and choose how often you want the task to recur—daily, weekly, or on custom days.',
    ),
    FaqItemDetailsModel(
      title: 'How do I track my productivity?',
      titleNumber: '04',
      description:
          'The app provides a dashboard where you can see your completed tasks, time spent on projects, and overall progress. You can also set productivity goals and review your performance over time.',
    ),
    FaqItemDetailsModel(
      title: 'Does the app integrate with calendars?',
      titleNumber: '06',
      description:
          'Yes! You can sync your tasks with Google Calendar, Apple Calendar, or Outlook to stay organized across all your devices.',
    ),
    FaqItemDetailsModel(
      title: 'How do I prioritize tasks?',
      titleNumber: '07',
      description:
          'Use the priority setting feature to mark tasks as high, medium, or low priority. You can also drag and reorder tasks in your list to organize them based on urgency.',
    ),
  ];

  final FaqSupportRemoteSource remoteSource;
  @override
  void onInit() {
    super.onInit();

    faqDataDetailList.assignAll(generalInfoList);
  }
}
