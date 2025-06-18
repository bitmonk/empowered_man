import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/tribe/presentation/controller/tribe_group_controller.dart';
import 'package:empowered/features/tribe/presentation/screen/widgets/tribe_widget/add_tribe_member.dart';
import 'package:image_picker/image_picker.dart';

class CreateTribeGroup extends StatefulWidget {
  const CreateTribeGroup({super.key});

  @override
  State<CreateTribeGroup> createState() => _CreateTribeGroupState();
}

class _CreateTribeGroupState extends State<CreateTribeGroup> {
  List<String> members = [];

  Future<void> _pickImageFromGallery(
    TribeGroupController tribeController,
  ) async {
    final picker = ImagePicker();
    try {
      final image = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1024,
        maxHeight: 1024,
        imageQuality: 85,
      );

      if (image != null) {
        tribeController.setGroupImage(image.path);
      }
    } catch (e) {
      //  print('Error picking image: $e');
      // You can show a snackbar or error dialog here
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final tribeController = Get.find<TribeGroupController>();

    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.95,
      builder: (_, controller) => Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Color(0xFF0D1B2A), // Dark background
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: SingleChildScrollView(
          controller: controller,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.arrow_back, color: Colors.white),
                  Text(
                    'Create Group',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  Icon(Icons.menu, color: Colors.white),
                ],
              ),
              const SizedBox(height: 24),
              AppTextFormField(
                labelText: 'Group Name',
                controller: tribeController.groupNameController,
                textInputType: TextInputType.emailAddress,
                hintText: 'Enter Group Name',
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),

              const SizedBox(height: 16),
              AppTextFormField(
                labelText: 'About',
                controller: tribeController.groupDescriptionController,
                textInputType: TextInputType.emailAddress,
                maxLines: 4,
                hintText: 'Enter About Group',
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),

              const VerticalSpacing(16),
              const Text(
                'Add Members',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),

              const VerticalSpacing(20),
              // Add Members Button
              OutlinedButton.icon(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) => AddTribeMember(
                      selectedMembers: const [],
                      onMembersUpdated: (newMembers) {
                        setState(() {
                          members = newMembers;
                          // controller.fetchGroupInfo();
                        });
                      },
                    ),
                  );
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.blue),
                  foregroundColor: Colors.blue,
                  shape: const StadiumBorder(),
                ),
                icon: const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Icon(Icons.add),
                ),
                label: const Padding(
                  padding: EdgeInsets.only(right: 24, left: 8),
                  child: Text('Add Member'),
                ),
              ),
              const VerticalSpacing(12),
              const Text(
                'Add Group Photo',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              const VerticalSpacing(12),
              // Add Group Photo with Obx for reactive updates
              Obx(
                () => GestureDetector(
                  onTap: () => _pickImageFromGallery(tribeController),
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(12),
                    dashPattern: const [10, 5],
                    color: Colors.white30,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white30,
                          style: BorderStyle.none,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: tribeController.groupImagePath.value.isEmpty
                          ? const Column(
                              children: [
                                Icon(
                                  Icons.cloud_upload,
                                  color: Colors.white54,
                                  size: 40,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Upload from library',
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 14),
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.file(
                                    File(tribeController.groupImagePath.value),
                                    height: 120,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  'Tap to change image',
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 14),
                                ),
                              ],
                            ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Access Type
              AppTextFormField(
                labelText: 'Access Type',
                controller: tribeController.accessTypeController,
                textInputType: TextInputType.emailAddress,
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),

              const SizedBox(height: 24),

              // Buttons
              Row(
                children: [
                  Expanded(
                    child: AppOutlinedButton(
                      text: 'Create',
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: AppOutlinedButton.orange(
                      onPressed: () => Navigator.pop(context),
                      text: 'Cancel',
                    ),
                  ),
                ],
              ),
              VerticalSpacing(
                mediaQuery.viewPadding.bottom + 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
