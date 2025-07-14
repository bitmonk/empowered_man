import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/home/presentation/controllers/reflection_journal_chat_controller.dart';
import 'package:empowered/features/home/presentation/controllers/reflection_library_controller.dart';
import 'package:empowered/features/home/presentation/screens/reflection_search_screen.dart';
import 'package:empowered/features/home/presentation/screens/widgets/reflection_library_pop_up.dart';
import 'package:intl/intl.dart';

class ReflectionLibraryScreen extends StatefulWidget {
  const ReflectionLibraryScreen({super.key});

  @override
  State<ReflectionLibraryScreen> createState() =>
      _ReflectionLibraryScreenState();
}

class _ReflectionLibraryScreenState extends State<ReflectionLibraryScreen> {
  final ReflectionLibraryController _controller =
      Get.find<ReflectionLibraryController>();
  ReflectionPagination paginationName = ReflectionPagination.library;
  bool _selectAll = false;
  @override
  void initState() {
    super.initState();

    _controller.selectedReflectionType.value = null;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeData();
    });
  }

  Future<void> _initializeData() async {
    _controller.seletedReflectionPagination.value = paginationName;
    final scrollController = _controller.getScrollController(
      paginationName,
    );
    await _controller.getReflectionLibrary(isInitialLoad: true);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // if (_controller.tabDataLoaded[paginationName] != true) {
      _controller.selectBulk.value = List.generate(
        _controller.reflectionLibraryList.length,
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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        var period = DateTime.now().hour < 12 ? 'am' : 'pm';
        Get.find<ReflectionJournalChatController>()
            .getReflectionWithQuestionAnswers(period ?? '');
        Get.back();
        return false;
        // final isCompleted = controller
        //         .reflectionQuestionAnswerResponse.value.data?.isCompleted ??
        //     false;

        // if (!isCompleted) {
        //   await showModalBottomSheet(
        //     isScrollControlled: true,
        //     useRootNavigator: true,
        //     useSafeArea: true,
        //     context: context,
        //     builder: (context) => ReflectionExitBottomsheet(
        //       message:
        //           'You can continue this journal from dashboard or journal library',
        //       onPressed: () {
        //         Get.back();
        //       },
        //     ),
        //   );
        //   return false;
        // } else {
        //   Get.back();
        //   AppWidgetKey.mainScaffold.currentState?.openDrawer();
        //   return false;
        // }
      },
      child: AppScaffold(
        appBar: const CustomAppBar(
          title: 'Reflection Library',
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
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2<String>(
                            isExpanded: true,
                            value: [
                              'AM',
                              'PM',
                            ].contains(_controller.selectedReflectionType.value)
                                ? _controller.selectedReflectionType.value
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
                                color: AppColors.bgBorder,
                              ),
                            ),
                            iconStyleData: const IconStyleData(
                              openMenuIcon: Icon(Icons.arrow_drop_up),
                            ),
                            hint: Row(
                              children: [
                                Text(
                                  _controller.selectedReflectionType.value ??
                                      'Select Time',
                                  style: AppTextStyles.textBodyB2.copyWith(
                                    color: AppColors.textColor100,
                                  ),
                                ),
                              ],
                            ),
                            items: ['AM', 'PM'].map((value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 4),
                                  child: Text(
                                    value,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (value) async {
                              if (value ==
                                  _controller.selectedReflectionType.value) {
                                return;
                              }

                              if (value != null) {
                                setState(() {
                                  _controller.selectedReflectionType.value =
                                      value;
                                });

                                await _fetchReflectionsWithReflectionType(
                                    value,);
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    GestureDetector(
                      onTap: () async {
                        _controller.getReflectionLibrarySearchState.value =
                            TheStates.initial;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ReflectionSearchScreen(),
                          ),
                        );
                      },
                      child: Assets.images.homeSearch.svg(),
                    ),
                    if (_controller.selectBulk.any((item) => item))
                      ReflectionLibraryPopUp(
                        searchReflection: false,
                        selectedItems: _controller.selectBulk,
                        reflectionList: _controller.reflectionLibraryList,
                        onSelected: (deletedIds, shouldClearSelection) {
                          if (shouldClearSelection) {
                            _controller.selectBulk.clear();
                          }
                        },
                      ),
                  ],
                ),
              ),
              _controller.getReflectionLibraryState.value.showWidget(
                orElse: () => const Padding(
                  padding: EdgeInsets.symmetric(vertical: 50),
                  child: LoadingWidget(),
                ),
                error: () => CustomErrorWidget(
                  error: _controller.libraryError.value,
                  verticlePadding: const EdgeInsets.symmetric(vertical: 200),
                  onPressed: () async {
                    _controller.getReflectionLibrary(
                      isInitialLoad: true,
                      reflectionType: _controller.selectedReflectionType.value,
                    );
                  },
                ),
                success: () {
                  final reflections = _controller.reflectionLibraryList;
                  return (reflections.isEmpty)
                      ? CustomErrorWidget(
                          error: 'No reflections found',
                          verticlePadding:
                              const EdgeInsets.symmetric(vertical: 200),
                          onPressed: () async {
                            _controller.getReflectionLibrary(
                              isInitialLoad: true,
                              reflectionType:
                                  _controller.selectedReflectionType.value,
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
                                    _controller.selectedReflectionType.value =
                                        null;
                                  });
                                  // await _fetchreflectionTypes();
                                  _controller.getReflectionLibrary(
                                    isInitialLoad: true,
                                  );
                                },
                                child: LayoutBuilder(
                                  builder: (context, constraints) {
                                    return SingleChildScrollView(
                                      physics:
                                          const AlwaysScrollableScrollPhysics(),
                                      controller:
                                          _controller.getScrollController(
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
                                              ...reflections.map(
                                                (index) => _buildTableRow(
                                                  reflections.indexOf(index),
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
                  _controller.reflectionLibraryList.length,
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
    final reflections = _controller.reflectionLibraryList;

    // Return empty row if index is out of bounds
    if (index >= reflections.length) {
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
        reflections.length,
        (i) => i < _controller.selectBulk.length
            ? _controller.selectBulk[i]
            : false,
      );
    }

    final reflection = reflections[index];

    final firstQuestion =
        (reflection.reflection?.mainQuestions?.isNotEmpty ?? false)
            ? reflection.reflection!.mainQuestions!
                    .firstWhereOrNull((e) => e.keywords == 'title')
                    ?.question ??
                'N/A'
            : 'N/A';
    final reflectionType = reflection.reflection?.reflectionType ?? 'N/A';
    var formattedTime = formatDateTime(
      reflection.completedAt?.toString() ??
          reflection.createdAt.toString() ??
          'N/A',
    );

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
        _tableCell(reflectionType),
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

  Future<void> _fetchReflectionsWithReflectionType(
    String reflectionType,
  ) async {
    try {
      // Reset page to 1 for new search
      await _controller.getReflectionLibrary(
        reflectionType: reflectionType,
        isInitialLoad: true,
      );

      // Reset _selectedItems based on new data
      if (_controller.reflectionLibraryList.isNotEmpty) {
        setState(() {
          _controller.selectBulk.value = List.generate(
            _controller.reflectionLibraryList.length,
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
