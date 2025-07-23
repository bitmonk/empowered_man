import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/journal_chat/data/model/journal_emotion_names_model.dart';
import 'package:empowered/features/journal_chat/presentation/controllers/journal_emotion_name_controller.dart';
import 'package:empowered/features/journal_chat/presentation/screens/journal_search_screen.dart';
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

  bool _selectAll = false; // Track the "Select All" state
  // String selectedJournalType = 'Select Journal Type';
  List<EmotionName>? emotionNames = [];
  JournalPagination paginationName = JournalPagination.library;
  @override
  void initState() {
    super.initState();
    emotionNames = widget.emotionNames;
    _controller.selectedEmotion.value = null;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchEmotionNames();
      _initializeData();
    });
  }

  Future<void> _fetchEmotionNames() async {
    try {
      await _controller.getJournalEmotionName();
      setState(() {
        emotionNames = _controller.journalEmotionName.value.data?.emotionNames;
      });
    } catch (e) {
      debugPrint('Error fetching emotion names: $e');
    }
  }

  Future<void> _initializeData() async {
    _controller.seletedJournalPagination.value = paginationName;
    final scrollController = _controller.getScrollController(
      paginationName,
    );
    await _controller.getJournalLibrary(isInitialLoad: true);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // if (_controller.tabDataLoaded[paginationName] != true) {
      _controller.selectBulk.value = List.generate(
        _controller.journalLibraryList.length,
        (_) => false,
      );

      // }
    });
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent * 0.8) {
        _controller.loadMoreData(paginationName);
      }
    });
  }

  List<String> getSelectedJournalIds() {
    final selectedIds = <String>[];
    for (var i = 0; i < _controller.journalLibraryList.length; i++) {
      if (i < _controller.selectBulk.length && _controller.selectBulk[i]) {
        final journal = _controller.journalLibraryList[i];
        if (journal.id != null) {
          selectedIds.add(journal.id!.toString());
        }
      }
    }
    return selectedIds;
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const CustomAppBar(
        title: 'Journal Library',
      ),
      body: Obx(
        () => Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: ThemedContainer(
                      color: AppColors.bgBorder,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                          isExpanded: true,
                          value:
                              emotionNames?.map((e) => e.emotionName).contains(
                                            _controller.selectedEmotion.value,
                                          ) ==
                                      true
                                  ? _controller.selectedEmotion.value
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
                                _controller.selectedEmotion.value ??
                                    'Select Journal Type',
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
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4),
                                child: Text(
                                  name,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (value) async {
                            if (value == _controller.selectedEmotion.value) {
                              return;
                            }
                            if (value != null &&
                                emotionNames?.any(
                                      (e) => e.emotionName == value,
                                    ) ==
                                    true) {
                              setState(() {
                                _controller.selectedEmotion.value = value;
                              });

                              await _fetchJournalsWithEmotion(value);
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                  if (_controller.selectedEmotion.value != null)
                    const SizedBox(width: 12),
                  if (_controller.selectedEmotion.value != null)
                    GestureDetector(
                      onTap: () async {
                        setState(() {
                          _controller.selectedEmotion.value = null;
                        });
                        await _fetchEmotionNames();
                        _controller.getJournalLibrary(
                          isInitialLoad: true,
                        );
                      },
                      child: const Icon(
                        Icons.restore_outlined,
                        color: AppColors.textFieldGrey,
                      ),
                    ),
                  const SizedBox(width: 12),
                  GestureDetector(
                    onTap: () async {
                      _controller.getJournalLibrarySearchState.value =
                          TheStates.initial;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const JournalSearchScreen(),
                        ),
                      );
                    },
                    child: Assets.images.homeSearch.svg(),
                  ),
                  if (_controller.selectBulk.any((item) => item))
                    JournalLibraryPopUp(
                      searchJournal: false,
                      selectedItems: _controller.selectBulk,
                      journalList: _controller.journalLibraryList,
                      onSelected: (deletedIds, shouldClearSelection) {
                        if (shouldClearSelection) {
                          _controller.selectBulk.clear();
                        }
                      },
                    ),
                ],
              ),
            ),
            _controller.getJournalLibraryState.value.showWidget(
              orElse: () => const Padding(
                padding: EdgeInsets.symmetric(vertical: 50),
                child: LoadingWidget(),
              ),
              error: () => CustomErrorWidget(
                error: _controller.libraryError.value,
                verticlePadding: const EdgeInsets.symmetric(vertical: 200),
                onPressed: () async {
                  _controller.getJournalLibrary(
                    isInitialLoad: true,
                    emotionName: _controller.selectedEmotion.value,
                  );
                },
              ),
              success: () {
                final journals = _controller.journalLibraryList;
                return (journals.isEmpty)
                    ? CustomErrorWidget(
                        error: 'No journals found',
                        verticlePadding:
                            const EdgeInsets.symmetric(vertical: 200),
                        onPressed: () async {
                          _controller.getJournalLibrary(
                            isInitialLoad: true,
                            emotionName: _controller.selectedEmotion.value,
                          );
                        },
                      )
                    : Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: ThemedContainer(
                            padding: EdgeInsets.zero,
                            margin: const EdgeInsets.all(12),
                            child: RefreshIndicator(
                              onRefresh: () async {
                                setState(() {
                                  _controller.selectedEmotion.value = null;
                                });
                                await _fetchEmotionNames();
                                _controller.getJournalLibrary(
                                  isInitialLoad: true,
                                );
                              },
                              child: LayoutBuilder(
                                builder: (context, constraints) {
                                  return SingleChildScrollView(
                                    physics:
                                        const AlwaysScrollableScrollPhysics(),
                                    controller: _controller.getScrollController(
                                      paginationName,
                                    ),
                                    child: ConstrainedBox(
                                      constraints: BoxConstraints(
                                        minHeight: constraints.maxHeight,
                                      ),
                                      child: IntrinsicHeight(
                                        child: Table(
                                          columnWidths: const {
                                            0: FixedColumnWidth(35),
                                            1: FlexColumnWidth(70),
                                            2: FlexColumnWidth(90),
                                            3: FlexColumnWidth(80),
                                          },
                                          children: [
                                            _buildTableHeaderRow(),
                                            ...journals.map(
                                              (index) => _buildTableRow(
                                                journals.indexOf(index),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      );
              },
            ),
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
          padding: const EdgeInsets.only(top: 12, bottom: 12, left: 12),
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              setState(() {
                _selectAll = !_selectAll;
                _controller.selectBulk.value = List.generate(
                  _controller.journalLibraryList.length,
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
    final journals = _controller.journalLibraryList;

    // Return empty row if index is out of bounds
    if (index >= journals.length) {
      return TableRow(
        children: [
          _tableCell(''),
          _tableCell(''),
          _tableCell(''),
          _tableCell(''),
        ],
      );
    }
    if (_controller.selectBulk.length <= index) {
      // Expand the list if needed
      _controller.selectBulk.value = List.generate(
        journals.length,
        (i) => i < _controller.selectBulk.length
            ? _controller.selectBulk[i]
            : false,
      );
    }

    final journal = journals[index];

    final firstQuestion = (journal.journal?.mainQuestions?.isNotEmpty ?? false)
        ? journal.journal!.mainQuestions!
                .firstWhereOrNull((e) => e.keywords == 'title')
                ?.question ??
            'N/A'
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
                _controller.selectBulk[index] = !_controller.selectBulk[index];
                _selectAll = _controller.selectBulk.every((item) => item);
              });
            },
            child: Icon(
              _controller.selectBulk[index]
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
              color: AppColors.color8798A7,
            ),
          ),
        ),
        _tableCell(emotionName),
        _tableCell(firstQuestion.capitalizeFirst.toString()),
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
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 22),
      child: Text(
        title,
        style: AppTextStyles.textBodyB1.copyWith(color: AppColors.white),
        textAlign: TextAlign.center,
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
        emotionName: emotionName,
        isInitialLoad: true,
      );

      // Reset _selectedItems based on new data
      if (_controller.journalLibraryList.isNotEmpty) {
        setState(() {
          _controller.selectBulk.value = List.generate(
            _controller.journalLibraryList.length,
            (_) => false,
          );
          _selectAll = false;
        });
      }
    } catch (e) {
      AppUtils.showErrorSnackbar(
        message: 'Failed to load journals',
      );
    }
  }
}
