import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/journal_chat/presentation/controllers/journal_emotion_name_controller.dart';
import 'package:empowered/features/journal_chat/presentation/screens/widget/journal_library_popup.dart';
import 'package:intl/intl.dart';

class JournalSearchScreen extends StatefulWidget {
  const JournalSearchScreen({super.key});

  @override
  State<JournalSearchScreen> createState() => _JournalSearchScreenState();
}

class _JournalSearchScreenState extends State<JournalSearchScreen> {
  final JournalEmotionNameController _controller =
      Get.find<JournalEmotionNameController>();
  final ScrollController _scrollController = ScrollController();
  List<bool> _selectedItems = List.generate(0, (index) => false);
  bool _selectAll = false;
  final TextEditingController controller = TextEditingController();
  bool _isLoading = false;

  void onSearch(String text) async {
    setState(() {
      _isLoading = true;
    });

    try {
      await _controller.getJournalLibrary(
        1,
        '', // emotion type
        text, // main question
        '', // search query
        '', // start date
        10, // limit
      );

      setState(() {
        if (_controller.journalLibraryIndexModel.value.data?.userJournals
                ?.isNotEmpty ??
            false) {
          _selectedItems = List.generate(
            _controller
                .journalLibraryIndexModel.value.data!.userJournals!.length,
            (_) => false,
          );
        } else {
          _selectedItems = [];
        }
      });
    } catch (e) {
      AppUtils.showErrorSnackbar(message: 'Failed to load journals');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

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
      '', //main question
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
  
  // Get selected journal entries based on selectedItems flags
  List<dynamic> getSelectedJournals() {
    final journals = _controller.journalLibraryIndexModel.value.data?.userJournals;
    if (journals == null) return [];
    
    final selectedJournals = <dynamic>[];
    for (int i = 0; i < _selectedItems.length; i++) {
      if (_selectedItems[i] && i < journals.length) {
        selectedJournals.add(journals[i]);
      }
    }
    return selectedJournals;
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const CustomAppBar(
        title: 'Journal Library',
      ),
      body: Obx(() {
        if (_controller.getJournalLibraryState.value == TheStates.loading) {
          return const LoadingWidget();
        }

        final journals =
            _controller.journalLibraryIndexModel.value.data?.userJournals;
        return SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 12),
                        child: TextField(
                          controller: controller,
                          style: const TextStyle(
                            color: AppColors.white,
                            fontSize: 14,
                          ),
                          onSubmitted: onSearch,
                          decoration: InputDecoration(
                            hintText: 'Search journals...',
                            hintStyle: TextStyle(
                              color: AppColors.white,
                              fontSize: 14,
                            ),
                            prefixIcon: const Icon(Icons.search),
                            suffixIcon: controller.text.isNotEmpty
                                ? IconButton(
                                    icon: const Icon(Icons.clear),
                                    onPressed: () {
                                      controller.clear();
                                      onSearch('');
                                    },
                                  )
                                : null,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 16),
                          ),
                        ),
                      ),
                    ),
                    JournalLibraryPopUp(
                      selectedItems: _selectedItems,
                     // selectedJournals: getSelectedJournals(),
                      onSelected: (deletedIds, shouldClearSelection) {
                        if (shouldClearSelection) {
                          setState(() {
                            _selectedItems = List.generate(
                              _selectedItems.length,
                              (_) => false,
                            );
                            _selectAll = false;
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),
              ThemedContainer(
                padding: EdgeInsets.zero,
                margin: const EdgeInsets.all(12),
                child: SingleChildScrollView(
                  child: Table(
                    columnWidths: const {
                      0: FixedColumnWidth(35),
                      1: FlexColumnWidth(70),
                      2: FlexColumnWidth(90),
                      3: FlexColumnWidth(80),
                    },
                    children: [
                      _buildTableHeaderRow(),
                      if (journals != null && journals.isNotEmpty)
                        ...List.generate(
                          journals.length,
                          (index) => _buildTableRow(index),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
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
    final emotionName = journal.journal?.emotionName ?? 'N/A';
    var formattedTime =
        formatDateTime(journal.completedAt ?? journal.createdAt ?? 'N/A');

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
        _tableCell(emotionName),
        _tableCell(firstQuestion ?? 'N/A'),
        _tableCell(formattedTime),
      ],
    );
  }

  String formatDateTime(String? dateTimeStr) {
    if (dateTimeStr == null) return 'N/A';
    try {
      final dateTime = DateTime.parse(dateTimeStr);
      return DateFormat.yMd().format(dateTime.toLocal());
    } catch (e) {
      return 'N/A';
    }
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