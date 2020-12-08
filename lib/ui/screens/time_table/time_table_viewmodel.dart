import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/core/utils/date_utils.dart';
import 'package:svuce_app/hive_db/models/time_table.dart';
import 'package:svuce_app/hive_db/services/time_table_service.dart';

class TimeTableViewModel extends BaseViewModel {
  final TimeTableService timeTableService = locator<TimeTableService>();

  List<TimeTable> _timeTableItems;
  List<TimeTable> get timeTable => _timeTableItems;

  changeCurrentDay(int index) {
    currentDay = weekDates[index];
    currentIndex = index;
    notifyListeners();
  }

  List<int> weekDates = generateCurrentWeekDays();

  int currentDay = DateTime.now().day;
  int currentIndex;

  init() async {
    currentIndex = weekDates.indexOf(DateTime.now().day);

    List<TimeTable> items = timeTableService.streamData;

    if (items != null) {
      _timeTableItems = items;
    }
  }

  List<TimeTable> getCurrentDayTimeTable() {
    var currentWeekDay = weekDays[currentIndex];
    var result =
        _timeTableItems.where((element) => element.day == currentWeekDay);
    return result.toList();
  }

  getTimeTable() {
    return _timeTableItems != null
        ? currentIndex == 6 ? Text("RELAX") : getCurrentDayTimeTable()
        : [];
  }
}
