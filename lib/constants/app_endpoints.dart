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
  static const String deleteAccount =  '/user/delete';


  // Journal Api
  static const String getJournalEmotionName = '/journals/emotion-names';
  static const String getJournalWithQuestionsAndAnswers = '/journals/';
  static const String postJournalAnswer = '/journal-answers';
  static const String getJournalLibrary = '/journals-library';
  static const String getSeeJournal = '/user-journals';
}

class ExternalEndpoints {}
