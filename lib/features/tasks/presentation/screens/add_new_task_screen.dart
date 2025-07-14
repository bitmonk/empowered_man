import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/tasks/data/model/add_task_request_model.dart';
import 'package:empowered/features/tasks/data/model/task_model.dart';
import 'package:empowered/features/tasks/presentation/controllers/tasks_controller.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:flutter_quill_delta_from_html/parser/html_to_delta.dart';
import 'package:form_validator/form_validator.dart';
import 'package:intl/intl.dart';
import 'package:vsc_quill_delta_to_html/vsc_quill_delta_to_html.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key, this.task});
  final Task? task;

  @override
  _AddNewTaskScreenState createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  TextEditingController titleController = TextEditingController();
  // TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  List<TextEditingController> subtaskControllers = [];
  quill.QuillController _controller = quill.QuillController.basic();
  AddTaskRequestModel addTaskRequestModel = AddTaskRequestModel();
  final controller = Get.find<TasksController>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _initVal();
  }

  void _initVal() {
    if (widget.task != null) {
      setState(() {
        titleController = TextEditingController(text: widget.task?.title ?? '');
        // descriptionController =
        //     TextEditingController(text: widget.task?.description ?? '');
        dateController = TextEditingController(
          text: DateFormat('yyyy-MM-dd').format(widget.task!.dueDate!),
        );
        _controller = convertHtmlToQuill(widget.task?.notes ?? '');
        for (final a in widget.task?.subTasks ?? []) {
          setState(() {
            subtaskControllers.add(
              TextEditingController(text: a.title),
            );
          });
        }
        addTaskRequestModel
          ..title = titleController.text
          // ..description = descriptionController.text
          ..level = widget.task?.level
          ..priority = widget.task?.priority
          ..dueDate = dateController.text
          ..notes = convertQuillToHtml(_controller)
          ..subTitle = [...?widget.task?.subTasks?.map((e) => e.title ?? '')];
      });
      print(addTaskRequestModel.toMap());
    } else {
      subtaskControllers.addAll([
        TextEditingController(),
      ]);
    }
  }

  @override
  void dispose() {
    // descriptionController.dispose();
    titleController.dispose();
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
      appBar: CustomAppBar(
        title: '${widget.task != null ? 'Update' : 'Add'} New Task',
      ),
      body: Obx(
        () => SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  AppTextFormField(
                    enabledBorderSide:
                        const BorderSide(color: AppColors.color354451),
                    labelText: 'Title',
                    controller: titleController,
                    validator: ValidationBuilder().required().build(),
                    onChanged: (v) {
                      addTaskRequestModel.title = v;
                    },
                  ),
                  const SizedBox(height: 16),
                  // AppTextFormField(
                  //   enabledBorderSide:
                  //       const BorderSide(color: AppColors.color354451),
                  //   labelText: 'Description',
                  //   controller: descriptionController,
                  //   validator: ValidationBuilder().required().build(),
                  //   onChanged: (v) {
                  //     addTaskRequestModel.description = v;
                  //   },
                  // ),
                  // const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: _buildDropdownField(
                          label: 'Level',
                          val: addTaskRequestModel.level,
                          list: controller.levelList,
                          onChanged: (v) {
                            addTaskRequestModel.level = v;
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _buildDropdownField(
                          label: 'Priority',
                          val: addTaskRequestModel.priority,
                          list: controller.prioritiesList,
                          onChanged: (v) {
                            addTaskRequestModel.priority = v;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildDatePicker('Select Date'),
                  const SizedBox(height: 24),
                  // Row(
                  //   children: [
                  //     Expanded(child: _buildOutlinedButton('Start Journal')),
                  //     const SizedBox(width: 10),
                  //     Expanded(child: _buildOutlinedButton('Add Subtask')),
                  //   ],
                  // ),
                  // const VerticalSpacing(20),
                  ...subtaskControllers.map((entry) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildTextField(
                          'Subtask ${subtaskControllers.indexOf(entry) + 1}',
                          entry,
                          subtaskControllers.indexOf(entry),
                        ),
                        const VerticalSpacing(16),
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
                          text: widget.task != null ? 'Update' : 'Save',
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

                            if (formKey.currentState!.validate()) {
                              controller.addTask(
                                body: addTaskRequestModel,
                                id: widget.task?.id?.toString(),
                              );
                            }
                          },
                        ),
                      ),
                      const HorizontalSpacing(16),
                      Expanded(
                        child: AppOutlinedButton(
                          text: widget.task != null ? 'Delete' : 'Cancel',
                          backgroundColor: AppColors.colorEB5757,
                          isLoading: widget.task != null &&
                              controller.delTaskState.value ==
                                  TheStates.loading,
                          onPressed: () {
                            if (controller.addTaskState.value ==
                                TheStates.loading) {
                              controller.cancelRequest();
                            }
                            if (widget.task != null) {
                              controller.deleteTask(
                                taskId: widget.task!.id.toString(),
                              );
                            } else {
                              Navigator.pop(context);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  const VerticalSpacing(30),
                ],
              ),
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

  quill.QuillController convertHtmlToQuill(String html) {
    final delta = HtmlToDelta().convert(html);
    final document = quill.Document.fromDelta(delta);
    return quill.QuillController(
      document: document,
      selection: const TextSelection.collapsed(offset: 0),
    );
  }

  Widget _buildTextField(
    String label,
    TextEditingController controller,
    int index,
  ) {
    return Row(
      children: [
        Expanded(
          child: AppTextFormField(
            enabledBorderSide: const BorderSide(color: AppColors.color354451),
            labelText: label,
            controller: controller,
          ),
        ),
        if (index != 0)
          InkWell(
            onTap: () {
              setState(() {
                subtaskControllers.removeAt(index);
              });
            },
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: Icon(
                Icons.remove,
                color: AppColors.appRed,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildDropdownField({
    required String label,
    required List<String> list,
    String? val,
    Function(String?)? onChanged,
  }) {
    return DropdownButtonFormField<String>(
      dropdownColor: const Color(0xFF1E293B),
      validator: ValidationBuilder().required().build(),
      value: val,
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
        color: AppColors.textColor50,
        overflow: TextOverflow.ellipsis,
      ),
      onChanged: onChanged,
    );
  }

  Widget _buildDatePicker(String label) {
    return AppTextFormField(
      labelText: 'Date',
      validator: ValidationBuilder().required().build(),
      enabledBorderSide: const BorderSide(color: AppColors.color354451),
      controller: dateController,
      isReadOnly: true,
      onTap: () async {
        var pickedDate = await _handleDatePicker();
        if (pickedDate != null) {
          dateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
          addTaskRequestModel.dueDate = dateController.text;
        } else {
          dateController.text = DateFormat('yyyy-MM-dd').format(DateTime.now());
          addTaskRequestModel.dueDate = dateController.text;
        }
      },
      suffixIcon: InkWell(
        onTap: () async {
          var pickedDate = await _handleDatePicker();

          if (pickedDate != null) {
            dateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
            addTaskRequestModel.dueDate = dateController.text;
          } else {
            dateController.text =
                DateFormat('yyyy-MM-dd').format(DateTime.now());
            addTaskRequestModel.dueDate = dateController.text;
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
}
