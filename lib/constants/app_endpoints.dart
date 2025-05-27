class AppEndpoints {
  static const String baseUrl = 'http://3.27.90.50/api';
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
  static String updateTask(String id) => '/tasks/$id';
  static const String getTask = '/tasks';
  static String delTask(String taskId) => '/tasks/$taskId';
  static String markMainTaskCompleted(String taskId) =>
      '/tasks/$taskId/mark-as-completed';
  static String markSubTaskCompleted(String mainTaskId, String subTaskId) =>
      '/tasks/$mainTaskId/subtasks/$subTaskId/mark-as-completed';
  static const String getTaskEnums = '/tasks/enums';
  static String changeLevel(String taskId) => '/tasks/$taskId/change-level';

  //assessment api
  static const String getAssessmentsUrl = '/user/assessments';
  static const String createUserAssessement = '/user/assessment/';
  static const String scoreQuestionUrl = '/user/question/score';
  static const String assessmentHistoryUrl = '/user/assessments/history';
  static const String deleteAssessmentUrl = '/user/assessments-delete';

  // Journal Api
  static const String getJournalEmotionName = '/journals/emotion-names';
  static const String getJournalWithQuestionsAndAnswers = '/journals/';
  static const String postJournalAnswer = '/journal-answers';
  static const String getJournalLibrary = '/journals-library';
  static const String getSeeJournal = '/user-journals';

  //Reflection Api
  static const String getReflectionByType = '/reflections/type';
  static const String postReflectionAnswer = '/reflection-answers';
  static const String reflectionLibrary = '/reflections-library';
  static const String getUserReflectionBulkDetail = '/user-reflections/details';
  static const String deleteBulkReflection = '/user-reflections';

  //Power Score
  static const String getPowerScoreStats = '/user/power-score-stats';

  //Goals and Target
  static const String getGoalsUrl = '/user/goals';
  static const String getGoalsOverviewUrl = '/user/goal/overview';
  static const String getGoalsChat = '/user/targets/add';
  static const String postGoalsAnswer = '/user/target/answer';
  static const String postAchieveTarget = '/user/goal-answers';
  static const String postMarkOnTrackUrl = '/user/goal';
  static const String getReflection = '/user/goal/reflection/';

  //Dashboard
  static const String myMonthly = '/user/dashboard/targets';
}

class ExternalEndpoints {}
