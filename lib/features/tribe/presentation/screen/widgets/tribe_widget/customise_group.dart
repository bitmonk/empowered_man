import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/tribe/data/model/add_members_model.dart';
import 'package:empowered/features/tribe/presentation/controller/tribe_group_controller.dart';
import 'package:empowered/features/tribe/presentation/screen/widgets/tribe_widget/add_tribe_member.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';

class CustomiseGroup extends StatefulWidget {
  const CustomiseGroup({
    required this.groupId,
    this.onMembersUpdated,
    super.key,
  });

  final String groupId;
  final Function(List<String>)? onMembersUpdated;

  @override
  State<CustomiseGroup> createState() => _CustomiseGroupState();
}

class _CustomiseGroupState extends State<CustomiseGroup> {
  final TribeGroupController tribeController = Get.find<TribeGroupController>();
  final RxList<String> members = <String>[].obs;

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
      print('Error picking image: $e');
      AppUtils.showErrorSnackbar(message: 'Failed to pick image: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    tribeController.fetchAccessTypes();
    tribeController.loadGroupDetails(widget.groupId).then((_) {
      tribeController.groupNameController.text =
          tribeController.groupDetailModel.value.data?.about?.name ?? '';
      tribeController.groupDescriptionController.text =
          tribeController.groupDetailModel.value.data?.about?.about ?? '';
      tribeController.accessTypeController.text =
          tribeController.groupDetailModel.value.data?.about?.accessType ?? '';
      tribeController.groupImagePath =
          tribeController.groupDetailModel.value.data?.about?.image ?? '';
      members.assignAll(
        tribeController.groupDetailModel.value.data?.about?.members
                ?.map((member) => member.user?.id.toString() ?? '')
                .toList() ??
            [],
      );
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
                    'Edit Group',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  const SizedBox(width: 48),
                ],
              ),
              const SizedBox(height: 24),
              AppTextFormField(
                labelText: 'Group Name',
                controller: tribeController.groupNameController,
                hintText: 'Enter Group Name',
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
              const SizedBox(height: 16),
              AppTextFormField(
                labelText: 'About',
                controller: tribeController.groupDescriptionController,
                textInputType: TextInputType.multiline,
                maxLines: 4,
                hintText: 'Enter About Group',
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
              const VerticalSpacing(16),
              const Text(
                'Existing Members',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              const VerticalSpacing(20),
              Obx(() {
                final allMembers = tribeController
                        .groupMembersModel.value.addMembersData?.users ??
                    [];
                return Wrap(
                  children: members.map((memberId) {
                    final member = allMembers.firstWhere(
                      (user) => user.id?.toString() == memberId,
                      orElse: () => const User(fullName: 'Unknown'),
                    );
                    return Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ClipOval(
                            child: member.image != null
                                ? Image.network(
                                    member.image!,
                                    height: 32,
                                    width: 32,
                                    fit: BoxFit.cover,
                                    errorBuilder: (_, __, ___) => const Icon(
                                      Icons.account_circle,
                                      color: Colors.white54,
                                      size: 32,
                                    ),
                                  )
                                : const Icon(
                                    Icons.account_circle,
                                    color: Colors.white54,
                                    size: 32,
                                  ),
                          ),
                          const HorizontalSpacing(8),
                          Text(
                            member.fullName ?? 'Unknown',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          const HorizontalSpacing(8),
                          IconButton(
                            icon: const Icon(
                              Icons.close,
                              color: Colors.red,
                              size: 20,
                            ),
                            onPressed: () {
                              members.remove(memberId);
                              tribeController.removeMember(
                                groupId: widget.groupId,
                                memberId: memberId,
                              );
                              if (widget.onMembersUpdated != null) {
                                widget.onMembersUpdated!(members);
                              }
                            },
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                );
              }),
              const VerticalSpacing(16),
              const Text(
                'Add More Members',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              const VerticalSpacing(20),
              OutlinedButton.icon(
                onPressed: () {
                  context.hideKeyboard();
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) => AddTribeMember(
                      selectedMembers: members.toList(),
                      onMembersUpdated: (newMembers) {
                        members.assignAll(newMembers);
                        if (widget.onMembersUpdated != null) {
                          widget.onMembersUpdated!(newMembers);
                        }
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
                                child: tribeController.groupImagePath
                                        .startsWith('http')
                                    ? Image.network(
                                        tribeController.groupImagePath,
                                        height: 120,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                        errorBuilder: (_, __, ___) =>
                                            Assets.images.chatUserPic.image(
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
              Row(
                children: [
                  Expanded(
                    child: AppOutlinedButton(
                      text: 'Save',
                      onPressed: () {
                        final currentMembers = members.isNotEmpty
                            ? members
                            : (tribeController
                                    .groupDetailModel.value.data?.about?.members
                                    ?.map((member) =>
                                        member.user?.id.toString() ?? '')
                                    .toList() ??
                                []);
                        tribeController
                            .editGroup(
                          groupId: widget.groupId,
                          groupName: tribeController.groupNameController.text,
                          about:
                              tribeController.groupDescriptionController.text,
                          accessType: tribeController.accessTypeController.text,
                          imagePath:
                              tribeController.groupImagePath.isNotEmpty &&
                                      !tribeController.groupImagePath
                                          .startsWith('http')
                                  ? tribeController.groupImagePath
                                  : null,
                          membersId: currentMembers,
                        )
                            .then((_) {
                          if (tribeController.editGroupState.value ==
                              TheStates.success) {
                            Get.back();
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
          ),
        ),
      ),
    );
  }
}
