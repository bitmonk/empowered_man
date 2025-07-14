import 'package:empowered/core/extension/extensions.dart';

class TaskStatusWidget extends StatefulWidget {
  const TaskStatusWidget({
    super.key,
    this.isAchievedInitially = false,
  });
  final bool isAchievedInitially;

  @override
  _TaskStatusWidgetState createState() => _TaskStatusWidgetState();
}

class _TaskStatusWidgetState extends State<TaskStatusWidget> {
  late bool _isAchieved; // Current status

  @override
  void initState() {
    super.initState();
    _isAchieved = widget.isAchievedInitially; // Set initial status
  }

  void _toggleStatus() {
    setState(() {
      _isAchieved = !_isAchieved; // Toggle the status
    });
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.primary500),
          color: _isAchieved
              ? AppColors.primary500 // "Achieved" color
              : AppColors.bgDark, // "Undo" color
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 3,
        ),
        child: Text(
          _isAchieved ? 'Achieved' : 'Not Achieved', // Dynamic text
          style: const TextStyle(
            color: AppColors.textColor50,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
