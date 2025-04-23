class AppEndpoints {
  static const String baseUrl = 'http://54.253.13.54/api';
  static const String login = '/login';
  static const String logout = '/user/logout';
  static const String signUp = '/register';
  static const String forgotPassword = '/forgot-password';
  static const String getNotification = '/settings/notifications';
  static const String updateProfileImage = '/user/update/image';
  static const String deleteProfileImage = '/user/delete/image';
  static const String getUserProfile = '/user/profile';
  static const String updateProfile = '/user/update/profile';
  static const String changePassword = '/user/update/password';
  static const String deleteAccount = '/user/delete';

  // Course Api
  static const String getCourses = '/user/courses';
  static String getChapters(String courseId) =>
      '/user/courses/$courseId/chapters';
  static String markChapterCompleted({String? courseId, String? chapterId}) =>
      '/user/courses/$courseId/chapters/$chapterId/complete';
  static const String changeCourseStatus = '/user/course-chapter/update-status';

  static const String habits = '/user/habits';
  static const String updateHabit = '/user/habit/update-status';

  // Task Api
  static const String addTask = '/tasks';
  static const String getTask = '/tasks';
  static String delTask(String taskId) => '/tasks/$taskId';
  static String markMainTaskCompleted(String taskId) =>
      '/tasks/$taskId/mark-as-completed';
  static String markSubTaskCompleted(String mainTaskId, String subTaskId) =>
      '/tasks/$mainTaskId/subtasks/$subTaskId/mark-as-completed';
  static const String getTaskEnums = '/tasks/enums';
  static String changeLevel(String taskId) => '/tasks/$taskId/change-level';

  // Journal Api
  static const String getJournalEmotionName = '/journals/emotion-names';
  static const String getJournalWithQuestionsAndAnswers = '/journals/';
  static const String postJournalAnswer = '/journal-answers';
  static const String getJournalLibrary = '/journals-library';
  static const String getSeeJournal = '/user-journals';
}

class ExternalEndpoints {}
