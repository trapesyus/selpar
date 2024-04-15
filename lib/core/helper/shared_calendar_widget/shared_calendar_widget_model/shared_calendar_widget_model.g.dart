// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shared_calendar_widget_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SharedCalendarWidgetModel on _SharedCalendarWidgetModel, Store {
  late final _$selectedDateAtom =
      Atom(name: '_SharedCalendarWidgetModel.selectedDate', context: context);

  @override
  DateTime get selectedDate {
    _$selectedDateAtom.reportRead();
    return super.selectedDate;
  }

  @override
  set selectedDate(DateTime value) {
    _$selectedDateAtom.reportWrite(value, super.selectedDate, () {
      super.selectedDate = value;
    });
  }

  late final _$selectDateAsyncAction =
      AsyncAction('_SharedCalendarWidgetModel.selectDate', context: context);

  @override
  Future<void> selectDate({required BuildContext context}) {
    return _$selectDateAsyncAction
        .run(() => super.selectDate(context: context));
  }

  late final _$_SharedCalendarWidgetModelActionController =
      ActionController(name: '_SharedCalendarWidgetModel', context: context);

  @override
  void setSelectedDate(DateTime date) {
    final _$actionInfo = _$_SharedCalendarWidgetModelActionController
        .startAction(name: '_SharedCalendarWidgetModel.setSelectedDate');
    try {
      return super.setSelectedDate(date);
    } finally {
      _$_SharedCalendarWidgetModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedDate: ${selectedDate}
    ''';
  }
}
