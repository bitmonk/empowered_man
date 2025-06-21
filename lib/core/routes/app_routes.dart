import 'package:empowered/features/assesments/presentation/assesments_screen.dart';
import 'package:empowered/features/assesments/presentation/widgets/assesment_result.dart';
import 'package:empowered/features/assesments/presentation/widgets/assesment_trailer.dart';
import 'package:empowered/features/change_password/presentation/controllers/change_password_bindings.dart';
import 'package:empowered/features/change_password/presentation/screens/change_password_screen.dart';
import 'package:empowered/features/chat/presentation/screens/chat_coversation_screen.dart';
import 'package:empowered/features/contact_us/presentation/controllers/contact_us_bindings.dart';
import 'package:empowered/features/contact_us/presentation/screens/contact_us_screen.dart';
import 'package:empowered/features/forgot_password/presentation/controllers/forgot_password_bindings.dart';
import 'package:empowered/features/forgot_password/presentation/screens/forgot_password_screen.dart';
import 'package:empowered/features/goals/presentation/screens/goals_overview.dart';
import 'package:empowered/features/goals/presentation/screens/reflection_screen.dart';
import 'package:empowered/features/journal_chat/presentation/screens/journal_library.dart';
import 'package:empowered/features/landing/landing_screen.dart';
import 'package:empowered/features/login/presentation/controllers/login_bindings.dart';
import 'package:empowered/features/login/presentation/screens/login_screen.dart';
import 'package:empowered/features/main/presentation/controllers/main_bindings.dart';
import 'package:empowered/features/main/presentation/screens/main_screen.dart';
import 'package:empowered/features/notification/presentation/screen/notification_history_screen.dart';
import 'package:empowered/features/onboarding/presentation/controllers/onboarding_bindings.dart';
import 'package:empowered/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:empowered/features/profile/presentation/controllers/profile_bindings.dart';
import 'package:empowered/features/profile/presentation/screens/profile_screen.dart';
import 'package:empowered/features/reset_password/presentation/controllers/reset_password_bindings.dart';
import 'package:empowered/features/reset_password/presentation/screens/app_success_screen.dart';
import 'package:empowered/features/reset_password/presentation/screens/reset_password_screen.dart';
import 'package:empowered/features/signup/presentation/controller/signup_bindings.dart';
import 'package:empowered/features/signup/presentation/screens/add_your_details_screen.dart';
import 'package:empowered/features/signup/presentation/screens/add_your_occupation.dart';
import 'package:empowered/features/signup/presentation/screens/add_your_photo_screen.dart';
import 'package:empowered/features/signup/presentation/screens/getting_started_screen.dart';
import 'package:empowered/features/signup/presentation/screens/signup_screen.dart';
import 'package:empowered/features/splash/splash_screen.dart';
import 'package:empowered/features/tasks/presentation/screens/add_new_task_screen.dart';
import 'package:empowered/features/tribe/presentation/controller/feed_page_binding.dart';
import 'package:empowered/features/tribe/presentation/screen/widgets/feed_widgets/post_detail_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String splash = '/';
  static const String loginPage = '/login';
  static const String main = '/main';
  static const String onboarding = '/onboarding';
  static const String signup = '/signup';
  static const String forgotPassword = '/forgotPassword';
  static const String resetPassword = '/resetPassword';
  static const String success = '/success';
  // static const String createPassword = '/createPassword';
  static const String changePassword = '/changePassword';
  static const String chatConversationScreen = '/chatConvesationScreen';
  static const String addYourPhotoScreen = '/addYourPhotoScreen';
  static const String addYourDetailsScreen = '/addYourDetailsScreen';
  static const String addYourOccupation = '/addYourOccupation';
  static const String notification = '/notification';
  static const String gettingStartedScreen = '/gettingStartedScreen';
  static const String landingScreen = '/landingScreen';
  static const String assesmentsScreen = '/assesmentsScreen';
  static const String assesmentsTrailer = '/assesmentsTrailer';
  static const String assesmentsResult = '/assesmentsResult';
  static const String notificationHistory = '/notificationHistory';
  static const String goalsOverview = '/goalsOverview';
  static const String profile = '/profile';
  static const String reflectionScreen = '/reflectionScreen';
  static const String journalLibrary = '/journalLibrary';
  static const String addNewTask = '/addNewTask';
  static const String privacyPolicy = '/privacy-policy';
  static const String termsAndConditions = '/terms-and-conditions';
  static const String communityGuidelines = '/community_guide_lines';
  static const String faqs = '/faq';
  static const String contactUs = '/user/contact-us';
  static const String postDetail = '/post-detail';

  static List<GetPage<dynamic>>? appPages = [
    GetPage(
      name: splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: landingScreen,
      page: () => const LandingScreen(),
    ),
    GetPage(
      name: loginPage,
      page: () => const LoginScreen(),
      binding: LoginBindings(),
    ),
    GetPage(
      name: main,
      page: () => const MainScreen(),
      binding: MainBindings(),
    ),
    GetPage(
      name: addYourPhotoScreen,
      page: () => const AddYourPhotoScreen(),
    ),
    GetPage(
      name: addYourDetailsScreen,
      page: () => const AddYourDetailsScreen(),
    ),
    GetPage(
      name: gettingStartedScreen,
      page: () => const GettingStartedScreen(),
    ),
    GetPage(
      name: addYourOccupation,
      page: () => const AddYourOccupation(),
    ),
    GetPage(
      name: onboarding,
      page: () => const OnboardingScreen(),
      binding: OnboardingBindings(),
    ),
    GetPage(
      name: profile,
      page: () => const ProfileScreen(),
      binding: ProfileBindings(),
    ),
    GetPage(
      name: forgotPassword,
      page: () => const ForgotPasswordScreen(),
      binding: ForgotPasswordBindings(),
    ),
    GetPage(
      name: postDetail,
      page: () => const PostDetailScreen(),
      binding: FeedPageBindings(),
    ),
    GetPage(
      name: resetPassword,
      page: () => const ResetPasswordScreen(),
      binding: ResetPasswordBindings(),
    ),
    GetPage(
      name: success,
      page: () => const AppSuccessScreen(),
    ),
    GetPage(
      name: changePassword,
      page: () => const ChangePasswordScreen(),
      binding: ChangePasswordBindings(),
    ),
    GetPage(
      name: signup,
      binding: SignupBindings(),
      page: () => const SignupScreen(),
    ),
    GetPage(
      name: contactUs,
      binding: ContactUsBindings(),
      page: () => ContactUsScreen(
        name: '',
        message: '',
        email: '',
      ),
    ),
    GetPage(
      name: chatConversationScreen,
      page: () => const ChatCoversationScreen(
        isSoloChat: true,
        isGroupChat: false,
      ),
    ),
    GetPage(
      name: assesmentsScreen,
      page: () => const AssessmentsScreen(),
    ),
    GetPage(
      name: assesmentsTrailer,
      page: () => const AssesmentTrailer(),
    ),
    GetPage(
      name: assesmentsResult,
      page: () => const AssesmentResult(),
    ),
    GetPage(
      name: notificationHistory,
      page: () => const NotificationHistoryScreen(),
    ),
    GetPage(
      name: goalsOverview,
      page: () => const GoalsOverview(),
    ),
    GetPage(
      name: reflectionScreen,
      page: () => const ReflectionScreen(),
    ),
    GetPage(
      name: journalLibrary,
      page: () => const JournalLibrary(),
    ),
    GetPage(
      name: addNewTask,
      page: () => const AddNewTaskScreen(),
    ),
  ];
}
