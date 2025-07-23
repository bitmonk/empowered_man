import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/tribe/data/model/add_members_model.dart';
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
  final tribeController = Get.find<TribeGroupController>();

  @override
  void initState() {
    super.initState();
    tribeController.groupNameController = TextEditingController();
    tribeController.groupDescriptionController = TextEditingController();
    tribeController.accessTypeController = TextEditingController();
    tribeController.groupImagePath = '';
    tribeController.fetchAccessTypes();
  }

  Future<void> _pickImageFromGallery(
      TribeGroupController tribeController,) async {
    final picker = ImagePicker();
    try {
      final image = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1024,
        maxHeight: 1024,
        imageQuality: 85,
      );

      if (image != null) {
        setState(() {
          tribeController.setGroupImage(image.path);
        });
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
          color: Color(0xFF0D1B2A),
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: SingleChildScrollView(
          controller: controller,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                hintText: 'Enter Group Name',
                maxLength: 40,
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
              const VerticalSpacing(12),
              OutlinedButton.icon(
                onPressed: () {
                  context.hideKeyboard();
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) => AddTribeMember(
                      selectedMembers: members,
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
              if (members.isNotEmpty) ...[
                const Text(
                  'Selected Members',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                const VerticalSpacing(12),
                Obx(() {
                  final allMembers = tribeController
                          .groupMembersModel.value.addMembersData?.users ??
                      [];
                  return Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: members.map((memberId) {
                      final member = allMembers.firstWhere(
                        (user) => user.id?.toString() == memberId,
                        orElse: () => const User(fullName: 'Unknown'),
                      );
                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ClipOval(
                            child: member.image != null
                                ? Image.network(
                                    member.image!,
                                    width: 30,
                                    height: 30,
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            Assets.images.profilePic.image(
                                                width: 30,
                                                height: 30,
                                                fit: BoxFit.cover,),
                                  )
                                : Assets.images.profilePic.image(
                                    width: 30, height: 30, fit: BoxFit.cover,),
                          ),
                          const HorizontalSpacing(8),
                          Text(
                            member.fullName ?? 'Unknown',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 14,),
                          ),
                          IconButton(
                            icon: const Icon(Icons.close,
                                color: Colors.red, size: 18,),
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            onPressed: () {
                              setState(() {
                                members.remove(memberId);
                              });
                            },
                          ),
                        ],
                      );
                    }).toList(),
                  );
                }),
                const VerticalSpacing(12),
              ],
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
                      .map(
                        (type) => DropdownMenuItem<String>(
                          value: type,
                          child: Text(
                            type,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      )
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
                            ? null
                            : () async {
                                if (_validateForm(tribeController)) {
                                  final success =
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
                                  if (success) {
                                    print('fine');
                                    tribeController
                                      ..clearGroupForm()
                                      ..clearGroupImage();
                                    await tribeController.refreshGroups();
                                    Navigator.pop(context);
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
