import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/tasks/data/model/add_task_request_model.dart';
import 'package:empowered/features/tasks/presentation/controllers/tasks_controller.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:form_validator/form_validator.dart';
import 'package:vsc_quill_delta_to_html/vsc_quill_delta_to_html.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  _AddNewTaskScreenState createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  List<TextEditingController> subtaskControllers = [];
  final quill.QuillController _controller = quill.QuillController.basic();
  AddTaskRequestModel addTaskRequestModel = AddTaskRequestModel();
  final controller = Get.find<TasksController>();

  @override
  void initState() {
    super.initState();
    subtaskControllers.addAll([
      TextEditingController(),
    ]);
  }

  @override
  void dispose() {
    descriptionController.dispose();
    dateController.dispose();
    for (final controller in subtaskControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void addSubtask() {
    setState(() {
      subtaskControllers.add(TextEditingController());
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const CustomAppBar(
        title: 'Add New Task',
      ),
      body: Obx(
        () => SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                AppTextFormField(
                  enabledBorderSide:
                      const BorderSide(color: AppColors.color354451),
                  labelText: 'Description',
                  controller: descriptionController,
                  validator: ValidationBuilder().required().build(),
                  onChanged: (v) {
                    addTaskRequestModel.title = v;
                  },
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                        child: _buildDropdownField(
                            label: 'Level',
                            list: controller.levelList,
                            onChanged: (v) {
                              addTaskRequestModel.level = v;
                            },),),
                    const SizedBox(width: 10),
                    Expanded(
                        child: _buildDropdownField(
                            label: 'Priority',
                            list: controller.prioritiesList,
                            onChanged: (v) {
                              addTaskRequestModel.priority = v;
                            },),),
                  ],
                ),
                const SizedBox(height: 16),
                _buildDatePicker('Select Date'),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(child: _buildOutlinedButton('Start Journal')),
                    const SizedBox(width: 10),
                    Expanded(child: _buildOutlinedButton('Add Subtask')),
                  ],
                ),
                const VerticalSpacing(20),
                ...subtaskControllers.map((entry) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTextField(
                          'Subtask ${subtaskControllers.indexOf(entry) + 1}',
                          entry,),
                      const VerticalSpacing(24),
                    ],
                  );
                }),
                InkWell(
                  onTap: () {
                    setState(() {
                      subtaskControllers.add(TextEditingController());
                    });
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Assets.images.addCirlceTask.svg(),
                      const HorizontalSpacing(8),
                      Text(
                        'Add Another Subtask',
                        style: AppTextStyles.textBodyB3.copyWith(
                          color: AppColors.primary500,
                        ),
                      ),
                    ],
                  ),
                ),
                const VerticalSpacing(24),
                const Text(
                  'Notes',
                  style: TextStyle(
                    fontSize: 10,
                    color: AppColors.textColor100,
                  ),
                ),
                const VerticalSpacing(12),
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: AppColors.bgBorderVLight,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Theme(
                        data: Theme.of(context).copyWith(
                          iconTheme: const IconThemeData(
                            color: Colors.white,
                          ), // Set tool icons to white
                          buttonTheme: const ButtonThemeData(
                            buttonColor: Colors.white,
                          ), // For buttons, if applicable
                        ),
                        child: quill.QuillSimpleToolbar(
                          controller: _controller,
                          configurations:
                              const quill.QuillSimpleToolbarConfigurations(
                            toolbarSectionSpacing: 2,
                            showJustifyAlignment: false,
                            showListBullets: false,
                            showCenterAlignment: false,
                            showClearFormat: false,
                            showFontFamily: false,
                            showFontSize: false,
                            showBackgroundColorButton: false,
                            showColorButton: false,
                            showHeaderStyle: false,
                            showLink: false,
                            showUndo: false,
                            showRedo: false,
                            showListCheck: false,
                            showIndent: false,
                            showSubscript: false,
                            showSuperscript: false,
                            showSearchButton: false,
                            showClipboardCut: false,
                            showClipboardCopy: false,
                            showClipboardPaste: false,
                            multiRowsDisplay: false,
                            color: AppColors.transparent,
                          ),
                        ),
                      ),
                      const AppDivider(
                        color: AppColors.bgBorderVLight,
                      ),
                      DefaultTextStyle(
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.textColor100,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: quill.QuillEditor.basic(
                            controller: _controller,
                            configurations:
                                const quill.QuillEditorConfigurations(
                              minHeight: 120,
                              maxContentWidth: 400,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const VerticalSpacing(30),
                Row(
                  children: [
                    Expanded(
                      child: AppOutlinedButton(
                          text: 'Save',
                          isLoading: controller.addTaskState.value ==
                              TheStates.loading,
                          onPressed: () {
                            addTaskRequestModel
                              ..notes = convertQuillToHtml(_controller)
                              ..subTitle = [];
                            setState(() {
                              addTaskRequestModel.subTitle = subtaskControllers
                                  .map((controller) => controller.text.trim())
                                  .where((text) => text.isNotEmpty)
                                  .toList();
                            });
                            controller.addTask(body: addTaskRequestModel);
                          },),
                    ),
                    const HorizontalSpacing(16),
                    Expanded(
                      child: AppOutlinedButton(
                          text: 'Delete',
                          backgroundColor: AppColors.colorEB5757,
                          onPressed: () {
                            if (controller.addTaskState.value ==
                                TheStates.loading) {
                              controller.cancelRequest();
                            } else {
                              Navigator.pop(context);
                            }
                          },),
                    ),
                  ],
                ),
                const VerticalSpacing(30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String convertQuillToHtml(quill.QuillController controller) {
    final converter = QuillDeltaToHtmlConverter(
      controller.document.toDelta().toJson(),
      ConverterOptions.forEmail(), // or use ConverterOptions()
    );
    return converter.convert();
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return AppTextFormField(
      enabledBorderSide: const BorderSide(color: AppColors.color354451),
      labelText: label,
      controller: controller,
    );
  }

  Widget _buildDropdownField(
      {required String label,
      required List<String> list,
      Function(String?)? onChanged,}) {
    return DropdownButtonFormField<String>(
      dropdownColor: const Color(0xFF1E293B),
      validator: ValidationBuilder().required().build(),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          color: AppColors.textColor50,
        ),
        filled: true,
        fillColor: AppColors.bgDark,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      isExpanded: true,
      items: list
          .map(
            (option) => DropdownMenuItem<String>(
              value: option,
              child: Text(option, style: const TextStyle(color: Colors.white)),
            ),
          )
          .toList(),
      style: const TextStyle(
          color: AppColors.textColor50, overflow: TextOverflow.ellipsis,),
      onChanged: onChanged,
    );
  }

  Widget _buildDatePicker(String label) {
    return AppTextFormField(
      labelText: 'Date',
      enabledBorderSide: const BorderSide(color: AppColors.color354451),
      controller: dateController,
      isReadOnly: true,
      onTap: () async {
        var pickedDate = await _handleDatePicker();
        if (pickedDate != null) {
          dateController.text =
              '${pickedDate.year}-${pickedDate.month}-${pickedDate.day}';
          addTaskRequestModel.dueDate = dateController.text;
        }
      },
      suffixIcon: InkWell(
        onTap: () async {
          var pickedDate = await _handleDatePicker();

          if (pickedDate != null) {
            dateController.text =
                '${pickedDate.year}-${pickedDate.month}-${pickedDate.day}';
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Assets.images.calendar.svg(),
        ),
      ),
    );
  }

  Future<DateTime?> _handleDatePicker() {
    return showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: const ColorScheme.dark(
              primary: Colors.blue, // Header background color
              onPrimary: Colors.white, // Text color on header
              surface: Color(0xFF1E293B), // Dialog background
            ),
            dialogBackgroundColor:
                const Color(0xFF1E293B), // Background color of dialog
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue, // Button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
  }

  Widget _buildOutlinedButton(String text) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Colors.blue),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: Text(text, style: const TextStyle(color: AppColors.textColor50)),
    );
  }
}
