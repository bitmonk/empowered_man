import 'package:empowered/core/extension/extensions.dart';

class AssesmentHistory extends StatefulWidget {
  const AssesmentHistory({super.key});

  @override
  State<AssesmentHistory> createState() => _AssesmentHistoryState();
}

class _AssesmentHistoryState extends State<AssesmentHistory> {
  List<bool> _selectedItems = List.generate(8, (index) => false);
  bool _selectAll = false; // Track the "Select All" state

  @override
  Widget build(BuildContext context) {
    return ThemedContainer(
      padding: EdgeInsets.zero,
      child: SingleChildScrollView(
        child: Table(
          columnWidths: const {
            0: FixedColumnWidth(35), // Selection icon column
            1: FlexColumnWidth(1.2),
            2: FlexColumnWidth(),
            3: FlexColumnWidth(),
          },
          children: [
            _buildTableHeaderRow(),
            ...List.generate(8, (index) => _buildTableRow(index)),
          ],
        ),
      ),
    );
  }

  /// Table Header Row with "Select All"
  TableRow _buildTableHeaderRow() {
    return TableRow(
      decoration: const BoxDecoration(
        color: AppColors.color1B2C3A,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 12, left: 12),
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              setState(() {
                _selectAll = !_selectAll;
                _selectedItems = List.generate(8, (index) => _selectAll);
              });
            },
            child: Icon(
              _selectAll
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
              color: AppColors.color8798A7,
            ),
          ),
        ),
        _tableHeaderCell('Date'),
        _tableHeaderCell('Type'),
        _tableHeaderCell('Score'),
      ],
    );
  }

  /// Table Data Row with selection icon
  TableRow _buildTableRow(int index) {
    var isPlaceholder = index == 0 || index == 3;
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 12, bottom: 12, left: 12),
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              setState(() {
                _selectedItems[index] = !_selectedItems[index];
                _selectAll = _selectedItems.every((item) => item);
              });
            },
            child: Icon(
              _selectedItems[index]
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
              color: AppColors.color8798A7,
            ),
          ),
        ),
        _tableCell('21/12/2024', isLink: !isPlaceholder),
        _tableCell(
          isPlaceholder ? 'Production' : 'Production',
          isLink: !isPlaceholder,
          isBlue: !isPlaceholder,
        ),
        _tableCell(isPlaceholder ? '--/96' : '92/96', isLink: !isPlaceholder),
      ],
    );
  }

  /// Helper to create table header cells
  Widget _tableHeaderCell(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Text(
        title,
        style: AppTextStyles.textBodyB1.copyWith(color: AppColors.white),
      ),
    );
  }

  /// Helper to create table data cells
  Widget _tableCell(String text, {bool isLink = false, bool isBlue = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Text(
        text,
        style: TextStyle(
          color: isBlue
              ? AppColors.primary500
              : isLink
                  ? AppColors.white
                  : AppColors.textColor300,
        ),
      ),
    );
  }
}
