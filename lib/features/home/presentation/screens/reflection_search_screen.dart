import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/home/presentation/controllers/reflection_library_controller.dart';
import 'package:intl/intl.dart';

class ReflectionSearchScreen extends StatefulWidget {
  const ReflectionSearchScreen({super.key});

  @override
  State<ReflectionSearchScreen> createState() => _ReflectionSearchScreenState();
}

class _ReflectionSearchScreenState extends State<ReflectionSearchScreen> {
  final ReflectionLibraryController _controller =
      Get.find<ReflectionLibraryController>();
  final TextEditingController searchController = TextEditingController();
  ReflectionPagination paginationName = ReflectionPagination.search;
  bool _selectAll = false;
  Future<void> onSearch(String text) async {
    if (text.isNotEmpty) {
      _controller.getReflectionLibrary(
        mainQuestion: text,
        isInitialLoad: true,
        searchReflection: true,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _controller.reflectionSearchList.clear();
    _controller.seletedReflectionPagination.value = paginationName;
    final scrollController = _controller.getScrollController(
      paginationName,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {});
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent * 0.8) {
        _controller.loadMoreData(paginationName);
      }
    });
  }

  Future<void> onRefresh() async {
    _controller.reflectionPaginationPageController[paginationName]!
        .isInitialLoading.value = true;
    _controller
      ..resetPaginationData()
      ..refreshData();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        title: 'Search Reflection',
        onTap: () {
          _controller.selectedReflectionType.value = null;
          _controller.getReflectionLibrary(isInitialLoad: true);
          Get.back();
        },
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 12,
                    ),
                    child: TextField(
                      controller: searchController,
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 14,
                      ),
                      onSubmitted: onSearch,
                      decoration: InputDecoration(
                        hintText: 'Enter reflection name',
                        hintStyle: const TextStyle(
                          color: AppColors.white,
                          fontSize: 14,
                        ),
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: searchController.text.isNotEmpty
                            ? IconButton(
                                icon: const Icon(Icons.clear),
                                onPressed: () {
                                  setState(() {
                                    searchController.clear();
                                    _controller.reflectionSearchList.clear();
                                    _controller.getReflectionLibrarySearchState
                                        .value = TheStates.initial;
                                  });
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
                // if (_controller.reflectionSearchList.isNotEmpty)
                // ReflectionLibraryPopUp(
                //   searchReflection: true,
                //   selectedItems: _controller.selectSeaarchBulk,
                //   reflectionList: _controller.reflectionSearchList,
                //   // selectedreflections: getSelectedreflections(),
                //   onSelected: (deletedIds, shouldClearSelection) {
                //     if (shouldClearSelection) {
                //       _controller.selectSeaarchBulk.clear();
                //     }
                //   },
                // ),
              ],
            ),
          ),
          Obx(
            () => _controller.getReflectionLibrarySearchState.value.showWidget(
              initial: () => CustomErrorWidget(
                error: searchController.text.isNotEmpty &&
                        _controller.reflectionSearchList.isEmpty
                    ? 'No data found'
                    : 'Enter keyword to search',
              ),
              loading: () => const Padding(
                padding: EdgeInsets.symmetric(vertical: 50),
                child: LoadingWidget(),
              ),
              error: () => CustomErrorWidget(
                error: _controller.libraryError.value,
                // verticlePadding: const EdgeInsets.symmetric(vertical: 200),
                onPressed: () async {
                  _controller.getReflectionLibrary(
                    searchReflection: true,
                    isInitialLoad: true,
                    mainQuestion: searchController.text,
                  ); // Load data if not already loaded
                },
              ),
              success: () {
                final reflection = _controller.reflectionSearchList;
                return (reflection.isEmpty)
                    ? CustomErrorWidget(
                        error: 'No reflections found',
                        verticlePadding:
                            const EdgeInsets.symmetric(vertical: 200),
                        onPressed: () async {
                          _controller.getReflectionLibrary(
                            searchReflection: true,
                            isInitialLoad: true,
                            mainQuestion: searchController.text,
                          );
                        },
                      )
                    : Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: ThemedContainer(
                            padding: EdgeInsets.zero,
                            margin: const EdgeInsets.all(12),
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
                                          if (_controller
                                              .reflectionSearchList.isNotEmpty)
                                            ...List.generate(
                                              _controller
                                                  .reflectionSearchList.length,
                                              (index) => _buildTableRow(index),
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
                      );
              },
            ),
          ),
        ],
      ),
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
                _controller.selectSeaarchBulk.value = List.generate(
                  _controller.reflectionSearchList.length,
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
    final reflections = _controller.reflectionSearchList;

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

    final reflection = reflections[index];

    final firstQuestion =
        (reflection.reflection?.mainQuestions?.isNotEmpty ?? false)
            ? reflection.reflection!.mainQuestions!
                    .firstWhereOrNull((e) => e.keywords == 'title')
                    ?.question ??
                'N/A'
            : 'N/A';
    final emotionName = reflection.reflection?.emotionName ?? 'N/A';
    var formattedTime = formatDateTime(
        reflection.completedAt?.toUtc().toString() ??
            reflection.createdAt.toString() ??
            'N/A',);

    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 12, bottom: 12, left: 12),
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              setState(() {
                if (index < _controller.selectSeaarchBulk.length) {
                  _controller.selectSeaarchBulk[index] =
                      !_controller.selectSeaarchBulk[index];
                  _selectAll =
                      _controller.selectSeaarchBulk.every((item) => item);
                }
              });
            },
            child: Icon(
              (index < _controller.selectSeaarchBulk.length &&
                      _controller.selectSeaarchBulk[index])
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
              color: AppColors.color8798A7,
            ),
          ),
        ),
        _tableCell(emotionName),
        _tableCell(firstQuestion),
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
