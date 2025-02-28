import 'package:empowered/features/tasks/data/source/tasks_remote_source.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TasksController extends GetxController {
  TasksController({required this.remoteSource});
  final TasksRemoteSource remoteSource;
  RxList<DaysFilterModel> daysList = [
    DaysFilterModel(title: 'M', date: '12'),
    DaysFilterModel(title: 'T', date: '13'),
    DaysFilterModel(title: 'W', date: '14'),
    DaysFilterModel(title: 'T', date: '15'),
    DaysFilterModel(title: 'F', date: '16'),
    DaysFilterModel(title: 'S', date: '17'),
    DaysFilterModel(title: 'S', date: '18'),
  ].obs;
  RxList<String> taskCategoryTitle =
      ['Hit List', 'Mit List', 'Do List', 'Achieved List', 'Done List'].obs;
  RxList<String> subTaskList = [
    'Sub Task 1',
    'Sub Task 1',
    'Sub Task 1t',
    ' Sub Task 1',
    'Sub Task 1',
  ].obs;
  RxBool isExpandedHitList = false.obs;
  RxBool isExpandedMitList = false.obs;
  RxBool isExpandedDoList = false.obs;
  RxBool isExpandedAchievedList = false.obs;
  RxBool isExpandedDoneList = false.obs;

  RxInt selectedDaysindex = 0.obs;
  late TextEditingController searchTextController;

  late ScrollController scrollController;

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
    searchTextController = TextEditingController();
    var todayIndex = DateTime.now().weekday - 1;
    selectedDaysindex.value = todayIndex;
  }

  @override
  void onClose() {
    scrollController.dispose();
    searchTextController = TextEditingController();
  }
}

class DaysFilterModel {
  DaysFilterModel({required this.title, required this.date});

  final String title;
  final String date;
}
