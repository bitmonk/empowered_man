import 'dart:io';

import 'package:empowered/core/device_info/device_info.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/core/preferences/shared_pref.dart';
import 'package:empowered/features/app_directory/presentation/controllers/app_directory_bindings.dart';
import 'package:empowered/features/app_directory/presentation/screens/app_directory_screen.dart';
import 'package:empowered/features/change_password/presentation/controllers/change_password_bindings.dart';
import 'package:empowered/features/change_password/presentation/screens/change_password_screen.dart';
import 'package:empowered/features/contact_us/presentation/controllers/contact_us_bindings.dart';
import 'package:empowered/features/contact_us/presentation/screens/contact_us_screen.dart';
import 'package:empowered/features/delete_account/presentation/controller/delete_account_bindings.dart';
import 'package:empowered/features/delete_account/presentation/screen/delete_account_screen.dart';
import 'package:empowered/features/edit_profile/presentation/controllers/edit_profile_bindings.dart';
import 'package:empowered/features/edit_profile/presentation/screens/edit_profile_screen.dart';
import 'package:empowered/features/faq/presentation/controllers/faq_support_bindings.dart';
import 'package:empowered/features/faq/presentation/screens/faq_support_screen.dart';
import 'package:empowered/features/notification/presentation/controller/notification_bindings.dart';
import 'package:empowered/features/notification/presentation/screen/notification_screen.dart';
import 'package:empowered/features/profile/presentation/controllers/logout_controller.dart';
import 'package:empowered/features/profile/presentation/controllers/profile_controller.dart';
import 'package:empowered/features/profile/presentation/screens/widgets/setting_tile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _profileController = Get.find<ProfileController>();
  final _logoutController = Get.find<LogoutController>();
  bool _isUploading = false;
  @override
  void initState() {
    super.initState();
    _profileController.getUserProfile();
  }

  Future<void> _pickImage(BuildContext context) async {
    // UiHelper.showloaderdialog(context);
    try {
      setState(() => _isUploading = true);
      final pickedImage = await AppUtils.pickImage(context);
      if (pickedImage != null) {
        setState(() {
          _profileController.selectedImage.value = pickedImage;
        });
        await _profileController.uploadProfile();
      }
    } catch (e) {
      AppUtils.showErrorSnackbar(message: 'Failed to pick image');
    } finally {
      setState(() => _isUploading = false);
      // Navigator.pop(Get.overlayContext!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _profileController.cancelRequest();
        Get.back();
        return true;
      },
      child: AppScaffold(
        appBar: const CustomAppBar(),
        body: Obx(
          () => RefreshIndicator(
            onRefresh: () async {
              _profileController.getUserProfile();
            },
            child: Column(
              children: [
                Container(
                  color: AppColors.bgDark,
                  // height: 317,
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.zero,
                    child: Column(
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          alignment: Alignment.bottomRight,
                          children: [
                            Padding(
                              padding: EdgeInsets.zero,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: _profileController.selectedImage.value !=
                                        null
                                    ? Image.file(
                                        File(
                                          _profileController
                                              .selectedImage.value!.path,
                                        ),
                                        width: 120,
                                        height: 120,
                                        fit: BoxFit.cover,
                                      )
                                    : AppCachedImage(
                                        imgUrl: Get.find<ProfileController>()
                                                .userProfile
                                                .value
                                                .image ??
                                            '',
                                        height: 120,
                                        fit: BoxFit.cover,
                                        errorWid: Container(
                                          decoration: const BoxDecoration(
                                              // border: Border.all(
                                              //   color: AppColors.white,
                                              //   width: 2,
                                              // ),
                                              // shape: BoxShape.circle,
                                              ),
                                          child: const Icon(
                                            Icons.person,
                                            color: AppColors.white,
                                            size: 60,
                                          ),
                                        ),
                                        width: 120,
                                      ),
                              ),
                            ),
                            if (_isUploading)
                              Positioned.fill(
                                child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.3),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: const LoadingWidget(),),
                              ),
                            Positioned(
                              right: -10,
                              bottom: -10,
                              child: InkWell(
                                onTap: () => _pickImage(context),
                                child: Assets.images.editProfilePic
                                    .image(width: 46),
                              ),
                            ),
                            const VerticalSpacing(6),
                          ],
                        ),
                        const VerticalSpacing(6),
                        Text(
                          Get.find<ProfileController>()
                                  .userProfile
                                  .value
                                  .fullName ??
                              '',
                          style: AppTextStyles.titleMd.copyWith(fontSize: 20),
                        ),
                        const VerticalSpacing(8),
                        Text(
                          Get.find<ProfileController>()
                                  .userProfile
                                  .value
                                  .email ??
                              '',
                          style: AppTextStyles.titleSm,
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          Get.find<ProfileController>()
                                  .userProfile
                                  .value
                                  .phoneNumber ??
                              '',
                          style: AppTextStyles.titleSm,
                          textAlign: TextAlign.center,
                        ),
                        const VerticalSpacing(24),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: AppColors.bgMedium,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: SafeArea(
                      top: false,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.symmetric(horizontal: 24)
                              .copyWith(bottom: 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Account Settings',
                                style: AppTextStyles.titleMd,
                              ),
                              const VerticalSpacing(18),
                              SettingTile(
                                title: 'Profile',
                                onTap: () {
                                  EditProfileInitializer.destroy();
                                  EditProfileInitializer.initialize();
                                  NavigationHelper.navigateWithFadeTransition(
                                    context,
                                    const EditProfileScreen(),
                                  );
                                },
                              ),
                              SettingTile(
                                title: 'Notification',
                                onTap: () {
                                  NotificationInitializer.destroy();
                                  NotificationInitializer.initialize();
                                  NavigationHelper.navigateWithFadeTransition(
                                    context,
                                    const NotificationScreen(false),
                                  );
                                },
                              ),
                              SettingTile(
                                title: 'Change Password',
                                onTap: () {
                                  ChangePasswordInitializer.destroy();
                                  ChangePasswordInitializer.initialize();
                                  NavigationHelper.navigateWithFadeTransition(
                                    context,
                                    const ChangePasswordScreen(),
                                  );
                                },
                              ),
                              const AppDivider(),
                              const VerticalSpacing(20),
                              const Text(
                                'More',
                                style: AppTextStyles.titleMd,
                              ),
                              const VerticalSpacing(18),
                              SettingTile(
                                title: 'Privacy policy',
                                onTap: () {
                                  AppDirectoryInitializer.initialize();
                                  NavigationHelper.navigateWithFadeTransition(
                                    context,
                                    const AppDirectoryScreen(
                                      appDirectoryEnum:
                                          AppDirectoryEnum.privacyPolicy,
                                    ),
                                  );
                                },
                              ),
                              SettingTile(
                                title: 'Terms and conditions',
                                onTap: () {
                                  AppDirectoryInitializer.initialize();
                                  NavigationHelper.navigateWithFadeTransition(
                                    context,
                                    const AppDirectoryScreen(
                                      appDirectoryEnum:
                                          AppDirectoryEnum.termsAndConditions,
                                    ),
                                  );
                                },
                              ),
                              SettingTile(
                                title: 'FAQ',
                                onTap: () {
                                  FaqInitializer.destroy();
                                  FaqInitializer.initialize();
                                  NavigationHelper.navigateWithFadeTransition(
                                    context,
                                    const FaqScreen(),
                                  );
                                },
                              ),
                              SettingTile(
                                title: 'Community Guidelines',
                                onTap: () {
                                  AppDirectoryInitializer.destroy();
                                  AppDirectoryInitializer.initialize();
                                  NavigationHelper.navigateWithFadeTransition(
                                    context,
                                    const AppDirectoryScreen(
                                      appDirectoryEnum:
                                          AppDirectoryEnum.communityGuidelines,
                                    ),
                                  );
                                },
                              ),
                              SettingTile(
                                title: 'Contact Us',
                                onTap: () {
                                  ContactUsInitializer.destroy();
                                  ContactUsInitializer.initialize();
                                  NavigationHelper.navigateWithFadeTransition(
                                    context,
                                    ContactUsScreen(
                                      email: 'email',
                                      name: 'name',
                                      message: 'message',
                                    ),
                                  );
                                },
                              ),
                              const AppDivider(),
                              const VerticalSpacing(20),
                              ListTile(
                                contentPadding: EdgeInsets.zero,
                                title: Text(
                                  'Logout',
                                  style: AppTextStyles.titleMd
                                      .copyWith(color: AppColors.primary500),
                                ),
                                onTap: () async {
                                  // final controller = Get.find<LoginController>();
                                  final deviceId = await getUniqueDeviceId();

                                  final result =
                                      await _logoutController.logout(deviceId);

                                  if (result) {
                                    await Get.find<AppSharedPref>().removeAll();
                                    Get.offAllNamed(AppRoutes.landingScreen);
                                  }
                                },
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.zero,
                                title: Text(
                                  'Delete Account',
                                  style: AppTextStyles.titleMd.copyWith(
                                    color: AppColors.appRed,
                                  ),
                                ),
                                onTap: () {
                                  DeleteAccountInitializer.destroy();
                                  DeleteAccountInitializer.initialize();
                                  NavigationHelper.navigateWithFadeTransition(
                                    context,
                                    const DeleteAccountScreen(),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
