class AddTaskRequestModel {
  AddTaskRequestModel({
    this.title,
    this.description,
    this.level,
    this.priority,
    this.dueDate,
    this.subTitle,
    this.notes,
  });

  String? title;
  String? description;
  String? level;
  String? priority;
  String? dueDate;
  String? notes;
  List<String>? subTitle;

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};

    if (title != null) map['title'] = title;
    if (description != null) map['description'] = description;
    if (level != null) map['level'] = level;
    if (priority != null) map['priority'] = priority;
    if (dueDate != null) map['due_date'] = dueDate;
    if (notes != null) map['notes'] = notes;
    if (subTitle != null && subTitle!.isNotEmpty) {
      for (var i = 0; i < subTitle!.length; i++) {
        map['sub_tasks[$i][title]'] = subTitle![i];
        // map['sub_tasks[$i][description]'] = 'Sub task ${i + 1} description';
      }
    }

    return map;
  }
}
