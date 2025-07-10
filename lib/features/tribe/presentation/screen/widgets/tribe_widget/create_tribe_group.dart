import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/tribe/presentation/controller/tribe_group_controller.dart';
import 'package:empowered/features/tribe/presentation/screen/widgets/tribe_widget/add_tribe_member.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateTribeGroup extends StatefulWidget {
  const CreateTribeGroup({super.key});

  @override
  State<CreateTribeGroup> createState() => _CreateTribeGroupState();
}

class _CreateTribeGroupState extends State<CreateTribeGroup> {
  List<String> members = [];
  final tribeController = Get.find<TribeGroupController>();

  @override
  void initState() {
    super.initState();
    tribeController.groupNameController = TextEditingController();
    tribeController.groupDescriptionController = TextEditingController();
    tribeController.accessTypeController = TextEditingController();
    tribeController.groupImagePath = '';
    // Fetch access types from the API
    tribeController.fetchAccessTypes();
  }

  Future<void> _pickImageFromGallery(
      TribeGroupController tribeController) async {
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
      AppUtils.showErrorSnackbar(message: 'Error picking image: $e');
    }
  }

  bool _validateForm(TribeGroupController controller) {
    final nameError = controller.groupNameController.text.isNotEmpty;
    final descError = controller.groupDescriptionController.text.isNotEmpty;
    final accessType = controller.accessTypeController.text.isNotEmpty;

    if (!nameError) {
      AppUtils.showErrorSnackbar(message: 'Group Name is required');
      return false;
    }
    if (!descError) {
      AppUtils.showErrorSnackbar(message: 'Group Description is required');
      return false;
    }
    if (!accessType) {
      AppUtils.showErrorSnackbar(message: 'Access type is required');
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Get.back(),
                  ),
                  const Text(
                    'Create Group',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  const Icon(Icons.menu, color: Colors.white),
                ],
              ),
              const SizedBox(height: 24),
              AppTextFormField(
                labelText: 'Group Name',
                controller: tribeController.groupNameController,
                textInputType: TextInputType.text,
                hintText: 'Enter Group Name',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Group name is required';
                  }
                  if (value.length < 3) {
                    return 'Group name must be at least 3 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              AppTextFormField(
                labelText: 'About',
                controller: tribeController.groupDescriptionController,
                maxLines: 4,
                hintText: 'Enter About Group',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Group description is required';
                  }
                  if (value.length < 10) {
                    return 'Group description must be at least 10 characters';
                  }
                  return null;
                },
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
              GestureDetector(
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
                    child: tribeController.groupImagePath.isEmpty
                        ? Column(
                            children: [
                              Assets.images.uploadFromLibrary.svg(
                                height: 80,
                                width: 80,
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'Upload from library',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          )
                        : Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.file(
                                  File(tribeController.groupImagePath),
                                  height: 120,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'Tap to change image',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Access Type Dropdown
              Obx(
                () => DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Access Type',
                    labelStyle: const TextStyle(color: Colors.white),
                    hintText: 'Select Access Type',
                    hintStyle: const TextStyle(color: Colors.white54),
                    filled: true,
                    fillColor: Colors.transparent,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.white30),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.white30),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.blue),
                    ),
                  ),
                  value: tribeController.accessTypeController.text.isNotEmpty
                      ? tribeController.accessTypeController.text
                      : null,
                  hint: const Text(
                    'Select Access Type',
                    style: TextStyle(color: Colors.white54),
                  ),
                  items: tribeController.accessTypes
                      .map((type) => DropdownMenuItem<String>(
                            value: type,
                            child: Text(
                              type,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ))
                      .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      tribeController.accessTypeController.text = value;
                    }
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Access type is required';
                    }
                    return null;
                  },
                  dropdownColor: const Color(0xFF0D1B2A),
                  icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                ),
              ),
              const SizedBox(height: 24),
              // Buttons
              Obx(
                () => Row(
                  children: [
                    Expanded(
                      child: AppOutlinedButton(
                        text: tribeController.createGroupState.value ==
                                TheStates.loading
                            ? 'Creating...'
                            : 'Create',
                        onPressed: tribeController.createGroupState.value ==
                                TheStates.loading
                            ? null // Disable button during loading
                            : () async {
                                if (_validateForm(tribeController)) {
                                  await tribeController.createGroup(
                                    groupName: tribeController
                                        .groupNameController.text,
                                    about: tribeController
                                        .groupDescriptionController.text,
                                    accessType: tribeController
                                        .accessTypeController.text,
                                    imagePath:
                                        tribeController.groupImagePath.isEmpty
                                            ? null
                                            : tribeController.groupImagePath,
                                    membersId: members,
                                  );
                                  // Handle success state
                                  if (tribeController.createGroupState.value ==
                                      TheStates.success) {
                                    tribeController
                                      ..clearGroupForm()
                                      ..clearGroupImage();
                                    await tribeController
                                        .refreshGroups(); // Refresh group list
                                    Navigator.pop(
                                      context,
                                    ); // Close bottom sheet
                                  }
                                }
                              },
                      ),
                    ),
                  ],
                ),
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
