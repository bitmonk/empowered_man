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
  static const String getPushNotification = '/notifications';

  // Course Api
  static const String getCourses = '/user/courses';
  static String getModule(String courseId) =>
      '/user/modules?course_id=$courseId';
  static String getChapters(String moduleId) =>
      '/user/modules/$moduleId/chapters';
  static String markChapterCompleted({String? moduleId, String? chapterId}) =>
      '/user/modules/$moduleId/chapters/$chapterId/complete';
  static const String changeCourseStatus = '/user/module-chapter/update-status';

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
  static String getDailyMitList(String date) => '/tasks/mit-lists?date=$date';
  static String mitTaskkNote(String id) => '/tasks/$id/note';
  static const String getDashboardLevel = '/user/level-details';
  static String getDashboardHabit(String date) =>
      '/user/habits-details?date=$date';
  static const String updateDashboardHabit = '/user/habits/update-status';
  static const String dashboardPowerStreak = '/user/weekly-details';

  //Chat
  static const String searchUser = '/agora/users/search';

  //tribe
  static const String createGroup = '/user/tribe-group';
  static const String pinUnpinGroup = '/user/pin-group';
  static const String addMembers = '/user/add-members';
  static const String removeMembers = '/user/remove-member';
  static const String editGroups = '/user/tribe-group';

  //feed post
  static const String getFeedPosts = '/user/post-feed/posts';
  static const String getFeedMedia = '/user/post-feed/medias';
  static const String createPost = '/user/create-post';
  static const String likePost = '/user/post/like';
  static const String commentPost = '/user/post/comment';
  static const String likeComment = '/user/comment/like';
  static const String replyComment = '/user/comment/reply';
  static const String savePost = '/user/post/save';
  static const String hidePost = '/user/post/hide';
  static const String getFeedSavedPost = '/user/post-feed/saved-posts';

  //group section
  static const String getGroupDetailsById = '/user/group/about/';
  static const String getGroupPosts = '/user/group/posts/';
  static const String getGroupMedia = '/user/group/medias/';
  static const String getSavedPosts = '/user/group/saved-posts/';
  static const String getPostComments = '/user/post/comments';
  static const String accessTypes = '/user/access-types';
  static const String userPost = '/user/user-posts';
}

class ExternalEndpoints {}
