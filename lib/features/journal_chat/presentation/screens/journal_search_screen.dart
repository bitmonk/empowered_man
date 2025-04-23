import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/journal_chat/presentation/controllers/journal_emotion_name_controller.dart';
import 'package:intl/intl.dart';

class JournalSearchScreen extends StatefulWidget {
  const JournalSearchScreen({super.key});

  @override
  State<JournalSearchScreen> createState() => _JournalSearchScreenState();
}

class _JournalSearchScreenState extends State<JournalSearchScreen> {
  final JournalEmotionNameController _controller = Get.find<JournalEmotionNameController>();
  final ScrollController _scrollController = ScrollController();
  List<bool> _selectedItems = [];
  bool _selectAll = false;
  String selectedJournalType = 'Select Journal Type';
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initializeData();
    _scrollController.addListener(_onScroll);
  }

  Future<void> _initializeData() async {
    await _controller.getJournalLibrary(
      1,
      '',
      '',
      '',
      '',
      10,
    );
    setState(() {
      _selectedItems = List.generate(
        _controller.journalLibraryIndexModel.value.data?.userJournals?.length ?? 0,
        (_) => false,
      );
    });
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= 
        _scrollController.position.maxScrollExtent * 0.8) {
      _loadMoreData();
    }
  }

  Future<void> _loadMoreData() async {
    final currentMeta = _controller.journalLibraryIndexModel.value.data?.meta;
    if (currentMeta!.currentPage! < int.parse(currentMeta.lastPage.toString())) {
      await _controller.getJournalLibrary(
        currentMeta.currentPage! + 1,
        selectedJournalType,
        _searchController.text,
        '',
        '',
        10,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Results'),
      ),
      body: Obx(() {
        if (_controller.getJournalLibraryState.value == TheStates.loading) {
          return const LoadingWidget();
        }

        final journals = _controller.journalLibraryIndexModel.value.data?.userJournals;
        return SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: ThemedContainer(
                        color: AppColors.bgBorder,
                        padding: const EdgeInsets.symmetric(
                          vertical: 6,
                          horizontal: 16,
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2<String>(
                            isExpanded: true,
                            value: selectedJournalType,
                            items: _controller.journalEmotionName.value.data?.emotionNames?.map((emotion) {
                              final name = emotion.emotionName ?? '';
                              return DropdownMenuItem<String>(
                                value: name,
                                child: Text(name),
                              );
                            }).toList(),
                            onChanged: (value) async {
                              if (value != null) {
                                setState(() {
                                  selectedJournalType = value;
                                  _selectedItems = List.generate(_selectedItems.length, (_) => false);
                                });
                                await _fetchFilteredJournals(value);
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColors.bgBorder,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextField(
                        controller: _searchController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search',
                          contentPadding: EdgeInsets.all(12),
                        ),
                        onChanged: (value) => _handleSearch(value),
                      ),
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
                  _controller.journalLibraryIndexModel.value.data?.userJournals?.length ?? 0,
                  (_) => _selectAll,
                );
              });
            },
            child: Icon(
              _selectAll ? Icons.radio_button_checked : Icons.radio_button_unchecked,
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
    final journals = _controller.journalLibraryIndexModel.value.data?.userJournals;
    
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
    final firstQuestion = journal.journal?.mainQuestions?.isNotEmpty ?? false
        ? journal.journal!.mainQuestions!.first.question
        : 'N/A';
    final emotionName = journal.journal?.emotionName ?? 'N/A';
    var formattedTime = formatDateTime(journal.completedAt ?? journal.createdAt ?? 'N/A');

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
              _selectedItems[index] ? Icons.radio_button_checked : Icons.radio_button_unchecked,
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

  Widget _tableHeaderCell(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      child: Text(
        title,
        style: AppTextStyles.textBodyB1.copyWith(color: AppColors.white),
      ),
    );
  }

  Widget _tableCell(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 6),
      child: Text(
        text,
        style: const TextStyle(
          color: AppColors.textColor300,
        ),
        textAlign: TextAlign.center,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Future<void> _handleSearch(String value) async {
    await _controller.getJournalLibrary(
      1,
      selectedJournalType,
      value,
      '',
      '',
      10,
    );
    
    setState(() {
      _selectedItems = List.generate(
        _controller.journalLibraryIndexModel.value.data?.userJournals?.length ?? 0,
        (_) => false,
      );
    });
  }

  Future<void> _fetchFilteredJournals(String emotionName) async {
    await _controller.getJournalLibrary(
      1,
      emotionName,
      _searchController.text,
      '',
      '',
      10,
    );

    setState(() {
      _selectedItems = List.generate(
        _controller.journalLibraryIndexModel.value.data?.userJournals?.length ?? 0,
        (_) => false,
      );
    });
  }
}