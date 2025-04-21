import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/journal_chat/data/model/journal_emotion_names_model.dart';
import 'package:empowered/features/journal_chat/data/model/user_journals_model.dart';
import 'package:empowered/features/journal_chat/presentation/controllers/journal_emotion_name_controller.dart';
import 'package:empowered/features/journal_chat/presentation/screens/widget/journal_library_popup.dart';
import 'package:intl/intl.dart';

class JournalLibrary extends StatefulWidget {
  const JournalLibrary({super.key, this.emotionNames = const []});
  final List<EmotionName>? emotionNames;

  @override
  State<JournalLibrary> createState() => _JournalLibraryState();
}

class _JournalLibraryState extends State<JournalLibrary> {
  final JournalEmotionNameController _controller =
      Get.find<JournalEmotionNameController>();
  final ScrollController _scrollController = ScrollController();
  List<bool> _selectedItems = List.generate(20, (index) => false);
  bool _selectAll = false; // Track the "Select All" state
  String selectedJournalType = 'Select Journal Type';
  List<EmotionName>? emotionNames = [];

  @override
  void initState() {
    super.initState();
    emotionNames = widget.emotionNames;
    print('Emotion Names: >>>>>>>>>>>>>>>>>>>>>>from Library$emotionNames');
    if (emotionNames == null || emotionNames!.isEmpty) {}
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeData();
      _fetchEmotionNames();
    });
    _scrollController.addListener(_onScroll);
  }

  Future<void> _fetchEmotionNames() async {
    try {
      await _controller.getJournalEmotionName();
      setState(() {
        emotionNames = _controller.journalEmotionName.value.data?.emotionNames;
      });
    } catch (e) {
      print('Error fetching emotion names: $e');
    }
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
        // if (journals == null || journals.isEmpty) {
        //   return const Center(child: Text('No journals found'));
        // }
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
                            vertical: 6, horizontal: 16),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2<String>(
                            isExpanded: true,

                            // dropdownColor: const Color(0xFF1A1E27),
                            // borderRadius: BorderRadius.circular(10),
                            // icon: const Icon(
                            //   Icons.keyboard_arrow_down,
                            //   color: AppColors.textColor100,
                            // ),
                            value: emotionNames
                                        ?.map((e) => e.emotionName)
                                        .contains(selectedJournalType) ==
                                    true
                                ? selectedJournalType
                                : null,
                            dropdownStyleData: DropdownStyleData(
                              maxHeight: 200,
                              width: 200,
                              offset: const Offset(-17, 0),
                              scrollbarTheme: ScrollbarThemeData(
                                radius: const Radius.circular(40),
                                thickness: WidgetStateProperty.all(6),
                                thumbVisibility: WidgetStateProperty.all(true),
                              ),
                              decoration: const BoxDecoration(
                                // borderRadius: BorderRadius.circular(14),
                                color: AppColors.bgBorder,
                              ),
                            ),
                            iconStyleData: const IconStyleData(
                              openMenuIcon: Icon(Icons.arrow_drop_up),
                            ),
                            hint: Row(
                              children: [
                                Text(
                                  emotionNames?.isNotEmpty == true
                                      ? selectedJournalType
                                      : 'Loading emotions...',
                                  style: AppTextStyles.textBodyB2.copyWith(
                                    color: AppColors.textColor100,
                                  ),
                                ),
                              ],
                            ),

                            items: emotionNames?.map((emotion) {
                              final name = emotion.emotionName ?? '';
                              return DropdownMenuItem<String>(
                                value: name,
                                child: Text(
                                  name,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              );
                            }).toList(),
                            onChanged: (value) async {
                              if (value != null &&
                                  emotionNames?.any(
                                          (e) => e.emotionName == value) ==
                                      true) {
                                setState(() {
                                  selectedJournalType = value;
                                });

                                _scrollController.animateTo(
                                  0,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut,
                                );

                                _selectedItems = List.generate(
                                    _selectedItems.length, (_) => false);

                                await _fetchJournalsWithEmotion(value);
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Assets.images.homeSearch.svg(),
                    JournalLibraryPopUp(
                      selectedItems: _selectedItems,
                      onSelected: (deletedIds, shouldClearSelection) {
                        if (shouldClearSelection) {
                          setState(() {
                            _selectedItems = List.generate(
                                _selectedItems.length, (_) => false);
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
              if (journals == null || journals.isEmpty)
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'No journals found',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
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
    final emotionName = journal.journal?.emotionName ?? 'N/A';
    String formattedTime =
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
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      child: Text(
        title,
        style: AppTextStyles.textBodyB1.copyWith(color: AppColors.white),
      ),
    );
  }

  /// Helper to create table data cells
  Widget _tableCell(String text, {bool isLink = false, bool isBlue = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 6),
      child: Text(
        text,
        style: TextStyle(
          color: isBlue
              ? AppColors.primary500
              : isLink
                  ? AppColors.white
                  : AppColors.textColor300,
        ),
        textAlign: TextAlign.center,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,

      ),
    );
  }


  Future<void> _fetchJournalsWithEmotion(String emotionName) async {
    try {
      // Reset page to 1 for new search
      await _controller.getJournalLibrary(
        1,
        emotionName,
        '',
        '',
        '',
        10,
      );

      // Reset _selectedItems based on new data
      if (_controller.journalLibraryIndexModel.value.data?.userJournals !=
          null) {
        setState(() {
          _selectedItems = List.generate(
            _controller
                .journalLibraryIndexModel.value.data!.userJournals!.length,
            (_) => false,
          );
        });
      }
    } catch (e) {
      AppUtils.showErrorSnackbar(
        message: 'Failed to load journals',
      );
    }
  }
}
