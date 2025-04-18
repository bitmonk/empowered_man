import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/journal_chat/presentation/controllers/journal_emotion_name_controller.dart';
import 'package:empowered/features/journal_chat/presentation/screens/widget/journal_library_popup.dart';

class JournalLibrary extends StatefulWidget {
  const JournalLibrary({super.key});

  @override
  State<JournalLibrary> createState() => _JournalLibraryState();
}

class _JournalLibraryState extends State<JournalLibrary> {
  final JournalEmotionNameController _controller =
      Get.find<JournalEmotionNameController>();
  final ScrollController _scrollController = ScrollController();
  List<bool> _selectedItems = List.generate(20, (index) => false);
  bool _selectAll = false; // Track the "Select All" state
  String selectedJournalType = 'Select Journal Type'; // Default selection
  final List<String> journalTypes = [
    'Personal Journal',
    'Work Journal',
    'Dream Journal',
    'Health Journal',
    'Gratitude Journal',
  ];
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeData();
    });
    _scrollController.addListener(_onScroll);
  }

  Future<void> _initializeData() async {
    // Load initial data with default parameters
    await _controller.getJournalLibrary(
      1,
      '',
      '',
      '',
      '',
      10,
    );
    if (mounted) {
      setState(() {
        // Initialize _selectedItems with the correct length
        _selectedItems = List.generate(
          _controller
                  .journalLibraryIndexModel.value.data?.userJournals?.length ??
              0,
          (index) => false,
        );
      });
    }
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.8) {
      _loadMoreData();
    }
  }

  Future<void> _loadMoreData() async {
    final currentMeta = _controller.journalLibraryIndexModel.value.data?.meta;
    if (currentMeta!.currentPage! <
        int.parse(currentMeta.lastPage.toString())) {
      await _controller.getJournalLibrary(
        currentMeta.currentPage! + 1,
        '',
        '',
        '',
        '',
        10,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        appBar: const CustomAppBar(
          title: 'Journal Library',
        ),
        body: Obx(() {
          if (_controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          final journals =
              _controller.journalLibraryIndexModel.value.data?.userJournals;
          if (journals == null || journals.isEmpty) {
            return const Center(child: Text('No journals found'));
          }
          return SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => _showJournalTypeMenu(context),
                        child: ThemedContainer(
                          color: AppColors.bgBorder,
                          padding: const EdgeInsets.symmetric(
                            vertical: 6,
                            horizontal: 16,
                          ),
                          child: Row(
                            children: [
                              Text(
                                selectedJournalType,
                                style: AppTextStyles.textBodyB2.copyWith(
                                  color: AppColors.textColor100,
                                ),
                              ),
                              const HorizontalSpacing(8),
                              const Icon(
                                Icons.keyboard_arrow_down,
                                color: AppColors.textColor100,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Spacer(),
                      Assets.images.homeSearch.svg(),
                      const JournalLibraryPopUp(),
                    ],
                  ),
                ),
                ThemedContainer(
                  padding: EdgeInsets.zero,
                  margin: const EdgeInsets.all(16),
                  child: SingleChildScrollView(
                    child: Table(
                      columnWidths: const {
                        0: FixedColumnWidth(40), // Selection icon column
                        1: FlexColumnWidth(60),
                        2: FlexColumnWidth(60),
                        3: FlexColumnWidth(80),
                      },
                      children: [
                        _buildTableHeaderRow(),
                        ...List.generate(
                          _controller.journalLibraryIndexModel.value.data
                                  ?.userJournals?.length ??
                              0,
                          (index) => _buildTableRow(index),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }));
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
                _selectedItems = List.generate(
                  _controller.journalLibraryIndexModel.value.data?.userJournals
                          ?.length ??
                      0,
                  (index) => _selectAll,
                );
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
        _tableHeaderCell('Type'),
        _tableHeaderCell('Name'),
        _tableHeaderCell('Date'),
      ],
    );
  }

  TableRow _buildTableRow(int index) {
    // final journal =
    //     _controller.journalLibraryIndexModel.value.data?.userJournals?[index];
    final journals =
        _controller.journalLibraryIndexModel.value.data?.userJournals;

    // Return empty row if index is out of bounds
    if (journals == null || index >= journals.length) {
      return TableRow(
        children: [
          _tableCell(''),
          _tableCell(''),
          _tableCell(''),
          _tableCell(''),
        ],
      );
    }

    final journal = journals[index];

    // Safely get the first question
    final firstQuestion = (journal.journal?.mainQuestions?.isNotEmpty ?? false)
        ? journal.journal!.mainQuestions!.first.question
        : 'N/A';
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
        _tableCell(journal.journal?.emotionName ?? 'N/A'),
        _tableCell(firstQuestion ?? 'N/A'),
        _tableCell(journal.completedAt ?? journal.createdAt ?? 'N/A'),
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

  void _showJournalTypeMenu(BuildContext context) {
    showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(20, 100, 20, 0), // Adjust position
      color: const Color(0xFF1A1E27),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      items: journalTypes
          .map(
            (type) => PopupMenuItem<String>(
              value: type,
              child: Text(type, style: const TextStyle(color: Colors.white)),
            ),
          )
          .toList(),
    ).then((value) {
      if (value != null) {
        setState(() {
          selectedJournalType = value;
        });
      }
    });
  }
}
