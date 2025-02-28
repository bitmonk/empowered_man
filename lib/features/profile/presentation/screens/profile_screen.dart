import 'dart:io';
import 'package:empowered/constants/app_colors.dart';
import 'package:empowered/core/routes/app_routes.dart';
import 'package:empowered/features/app_directory/presentation/screens/app_directory_screen.dart';
import 'package:empowered/features/change_password/presentation/controllers/change_password_bindings.dart';
import 'package:empowered/features/change_password/presentation/screens/change_password_screen.dart';
import 'package:empowered/features/common/app_divider.dart';
import 'package:empowered/features/common/app_scaffold.dart';
import 'package:empowered/features/common/app_spacing.dart';
import 'package:empowered/features/common/custom_app_bar.dart';
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
import 'package:empowered/features/profile/presentation/screens/widgets/setting_tile.dart';
import 'package:empowered/gen/assets.gen.dart';
import 'package:empowered/utlis/app_text_styles.dart';
import 'package:empowered/utlis/app_utils.dart';
import 'package:empowered/utlis/navigation_helper.dart';
import 'package:empowered/utlis/uihelper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _image;

  Future<void> _pickImage(BuildContext context) async {
    UiHelper.showloaderdialog(context);
    final pickedImage = await AppUtils.pickImage(context);
    Navigator.pop(Get.overlayContext!);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const CustomAppBar(),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                color: AppColors.bgDark,
                height: 317,
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.zero,
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 20,
                              bottom: 5,
                              left: 20,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: _image != null
                                  ? Image.file(
                                      _image!,
                                      width: 120,
                                      height: 120,
                                      fit: BoxFit.cover,
                                    )
                                  : Assets.images.profilePic.image(
                                      width: 120,
                                      height: 120,
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                          InkWell(
                            onTap: () => _pickImage(context),
                            child:
                                Assets.images.editProfilePic.image(width: 46),
                          ),
                        ],
                      ),
                      Text(
                        'James Goldie',
                        style: AppTextStyles.titleMd.copyWith(fontSize: 20),
                      ),
                      const VerticalSpacing(8),
                      const Text(
                        'james@gmail.com | +01 234 567 89',
                        style: AppTextStyles.titleSm,
                      ),
                      const VerticalSpacing(24),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .65,
              decoration: const BoxDecoration(
                color: AppColors.bgMedium,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: SafeArea(
                top: false,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
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
                          NavigationHelper.navigateWithFadeTransition(
                            context,
                            const AppDirectoryScreen(
                              appDirectoryEnum: AppDirectoryEnum.privacyPolicy,
                            ),
                          );
                        },
                      ),
                      SettingTile(
                        title: 'Terms and conditions',
                        onTap: () {
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
                            const ContactUsScreen(),
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
                        onTap: () {
                          Get.offAllNamed(AppRoutes.loginPage);
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
        ],
      ),
    );
  }
}
