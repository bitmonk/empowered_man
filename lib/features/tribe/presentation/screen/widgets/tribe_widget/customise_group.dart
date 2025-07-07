import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/tribe/presentation/controller/tribe_group_controller.dart';
import 'package:empowered/features/tribe/presentation/screen/widgets/tribe_widget/add_tribe_member.dart';
import 'package:image_picker/image_picker.dart';

class CustomiseGroup extends StatefulWidget {
  const CustomiseGroup({
    required this.groupId, super.key,
  });

  final String groupId;

  @override
  State<CustomiseGroup> createState() => _CustomiseGroupState();
}

class _CustomiseGroupState extends State<CustomiseGroup> {
  final tribeController = Get.find<TribeGroupController>();
  List<String> members = [];

  Future<void> _pickImageFromGallery(TribeGroupController tribeController) async {
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
      print('Error picking image: $e');
      AppUtils.showErrorSnackbar(message: 'Failed to pick image: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    // Load group details when the widget is initialized
    tribeController.loadGroupDetails(widget.groupId).then((_) {
      setState(() {
        tribeController.groupNameController.text =
            tribeController.groupDetailsModel.value.data?.groupDetails?.about?.name ?? '';
        tribeController.groupDescriptionController.text =
            tribeController.groupDetailsModel.value.data?.groupDetails?.about?.about ?? '';
        tribeController.accessTypeController.text =
            tribeController.groupDetailsModel.value.data?.groupDetails?.about?.accessType ?? '';
        tribeController.groupImagePath =
            tribeController.groupDetailsModel.value.data?.groupDetails?.about?.image ?? '';
        members = tribeController.groupDetailsModel.value.data?.groupDetails?.about?.members
                ?.map((member) => member.user?.id.toString() ?? '')
                .toList() ??
            [];
      });
    });
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
          child: Obx(() => Column(
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
                        'Edit Group',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      const SizedBox(width: 48), // Placeholder for alignment
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Group Name
                  AppTextFormField(
                    labelText: 'Group Name',
                    controller: tribeController.groupNameController,
                    hintText: 'Enter Group Name',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  const SizedBox(height: 16),
                  // Group Description
                  AppTextFormField(
                    labelText: 'About',
                    controller: tribeController.groupDescriptionController,
                    textInputType: TextInputType.multiline,
                    maxLines: 4,
                    hintText: 'Enter About Group',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  const VerticalSpacing(16),
                  // Existing Members
                  const Text(
                    'Existing Members',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  const VerticalSpacing(20),
                  Wrap(
                    children: tribeController.groupDetailsModel.value.data?.groupDetails?.about?.members
                            ?.map((member) => Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ClipOval(
                                        child: member.user?.image != null
                                            ? Image.network(
                                                member.user!.image!,
                                                height: 32,
                                                width: 32,
                                                fit: BoxFit.cover,
                                                errorBuilder: (_, __, ___) =>
                                                    Assets.images.chatUserPic.image(
                                                  height: 32,
                                                  width: 32,
                                                  fit: BoxFit.cover,
                                                ),
                                              )
                                            : Assets.images.chatUserPic.image(
                                                height: 32,
                                                width: 32,
                                                fit: BoxFit.cover,
                                              ),
                                      ),
                                      const HorizontalSpacing(8),
                                      Text(
                                        member.user?.fullName ?? 'Unknown',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),)
                            .toList() ??
                        [],
                  ),
                  const VerticalSpacing(16),
                  // Add Members Button
                  const Text(
                    'Add More Members',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  const VerticalSpacing(20),
                  OutlinedButton.icon(
                    onPressed: () {
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
                  // Group Photo
                  const Text(
                    'Group Photo',
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
                                    child: tribeController.groupImagePath.startsWith('http')
                                        ? Image.network(
                                            tribeController.groupImagePath,
                                            height: 120,
                                            width: double.infinity,
                                            fit: BoxFit.cover,
                                            errorBuilder: (_, __, ___) => Assets.images.chatUserPic.image(
                                              height: 120,
                                              width: double.infinity,
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                        : Image.file(
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
                  // Access Type
                  AppTextFormField(
                    labelText: 'Access Type',
                    controller: tribeController.accessTypeController,
                    hintText: 'Enter Access Type',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  const SizedBox(height: 24),
                  // Buttons
                  Row(
                    children: [
                      Expanded(
                        child: AppOutlinedButton(
                          text: 'Save',
                          onPressed: () {
                            print(tribeController.accessTypeController.text);
                            tribeController.editGroup(
                              groupId: tribeController.groupDetailsModel.value.data?.groupDetails?.about?.id.toString(),
                              groupName: tribeController.groupNameController.text,
                              about: tribeController.groupDescriptionController.text,
                              accessType: tribeController.accessTypeController.text,
                              imagePath: tribeController.groupImagePath.isNotEmpty &&
                                      !tribeController.groupImagePath.startsWith('http')
                                  ? tribeController.groupImagePath
                                  : null,
                              membersId: members,
                            ).then((_) {
                              if (tribeController.editGroupState.value == TheStates.success) {
                                Get.back(); // Close the sheet on success
                              }
                            });
                          },
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
              ),),
        ),
      ),
    );
  }
}