import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/signup/presentation/controller/signup_controller.dart';
import 'package:empowered/features/signup/presentation/widgets/dots_indicator.dart';
import 'package:empowered/utlis/uihelper.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class AddYourPhotoScreen extends StatefulWidget {
  const AddYourPhotoScreen({super.key});

  @override
  State<AddYourPhotoScreen> createState() => _AddYourPhotoScreenState();
}

class _AddYourPhotoScreenState extends State<AddYourPhotoScreen> {
  final ImagePicker _picker = ImagePicker();
  final controller = Get.find<SignupController>();

  Future<void> _takePhoto() async {
    UiHelper.showloaderdialog(context);
    var photo = await _picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      photo = await cropImage(photo);
      setState(() {
        controller.selectedImage.value = photo;
      });
    }
    Navigator.pop(Get.overlayContext!);
  }

  Future<void> _uploadFromLibrary() async {
    UiHelper.showloaderdialog(context);
    var photo = await _picker.pickImage(source: ImageSource.gallery);

    if (photo != null) {
      photo = await cropImage(photo);
      setState(() {
        controller.selectedImage.value = photo;
      });
    }
    Navigator.pop(Get.overlayContext!);
  }

  Future<XFile> cropImage(XFile pickedImage) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: pickedImage.path,
      compressQuality: 100,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Cropper',
          toolbarColor: AppColors.primaryDark,
          toolbarWidgetColor: Colors.white,
          aspectRatioPresets: [
            CropAspectRatioPreset.ratio16x9,
            CropAspectRatioPreset.square,
          ],
        ),
        IOSUiSettings(
          title: 'Cropper',
          aspectRatioPresets: [
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.square,
          ],
        ),
      ],
    );
    if (croppedFile == null) {
      return pickedImage;
    } else {
      return XFile(croppedFile.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const CustomAppBar(
        title: 'Add your photo 2 / 4',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const DotsIndicator(itemCount: 4, currentIndex: 1),
            const VerticalSpacing(32),
            DottedBorder(
              color: AppColors.color3E4953,
              strokeWidth: 2,
              radius: const Radius.circular(9),
              borderType: BorderType.RRect,
              padding: EdgeInsets.zero,
              dashPattern: const [5],
              child: GestureDetector(
                onTap: _takePhoto, // Take photo on tap
                child: Container(
                  padding: const EdgeInsets.all(24),
                  width: double.infinity,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (controller.selectedImage.value != null)
                        Container(
                          width: 91, // Circular width
                          height: 91, // Circular height
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            // border: Border.all(
                            //   color: Colors.grey, // Optional border color
                            //   width: 2, // Optional border width
                            // ),
                          ),
                          child: ClipOval(
                            child: Image.file(
                              File(controller.selectedImage.value!.path),
                              fit: BoxFit.cover,
                              width: 91,
                              height: 91,
                            ),
                          ),
                        )
                      else
                        Assets.images.uploadImage.image(width: 91),
                      const VerticalSpacing(8),
                      const Text(
                        'Tap above to take photo',
                        style: AppTextStyles.textBodyB2,
                      ),
                      const VerticalSpacing(4),
                      const Text(
                        'Or',
                        style: AppTextStyles.textBodyB2,
                      ),
                      AppTextButton(
                        color: AppColors.primary500,
                        label: 'Upload from library',
                        onTap: _uploadFromLibrary, // Upload from library
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const VerticalSpacing(16),
            AppOutlinedButton(
              text: 'Next',
              onPressed: controller.selectedImage.value != null
                  ? () {
                      if (controller.selectedImage.value != null) {
                        Get.toNamed(AppRoutes.addYourDetailsScreen);
                      } else {
                        AppUtils.showErrorSnackbar(message: 'Email required');
                      }
                    }
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
