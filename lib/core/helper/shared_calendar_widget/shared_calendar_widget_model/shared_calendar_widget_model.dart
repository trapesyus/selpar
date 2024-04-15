import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:selpar/core/constants/color_constants.dart';
part 'shared_calendar_widget_model.g.dart';

final SharedCalendarWidgetModel globalInstance =
    SharedCalendarWidgetModel.internal();

// ignore: library_private_types_in_public_api
class SharedCalendarWidgetModel = _SharedCalendarWidgetModel
    with _$SharedCalendarWidgetModel;

abstract class _SharedCalendarWidgetModel with Store {
  static final SharedCalendarWidgetModel _instance =
      SharedCalendarWidgetModel.internal();

  factory _SharedCalendarWidgetModel() => _instance;

  // ignore: unused_element
  _SharedCalendarWidgetModel.internal();

  @observable
  DateTime selectedDate = DateTime.now();

  @action
  void setSelectedDate(DateTime date) {
    selectedDate = date;
  }

  @action
  Future<void> selectDate({required BuildContext context}) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Başlangıçta seçili olacak tarih
      firstDate: DateTime.now(), // Seçilebilecek en erken tarih
      lastDate: DateTime(2101), // Seçilebilecek en geç tarih
      builder: (context, child) => Theme(
          data: ThemeData.light().copyWith(
            primaryColor: ColorConstants.hintDarkContainerColor,
          ),
          child: child!),
    );
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
    }
  }
}
