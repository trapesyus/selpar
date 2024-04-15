// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'odeme_ekle_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OdemeEkleModel on _OdemeEkleModelBase, Store {
  late final _$calendarSelectDateAtom =
      Atom(name: '_OdemeEkleModelBase.calendarSelectDate', context: context);

  @override
  SharedCalendarWidgetModel get calendarSelectDate {
    _$calendarSelectDateAtom.reportRead();
    return super.calendarSelectDate;
  }

  @override
  set calendarSelectDate(SharedCalendarWidgetModel value) {
    _$calendarSelectDateAtom.reportWrite(value, super.calendarSelectDate, () {
      super.calendarSelectDate = value;
    });
  }

  late final _$initializeAsyncAction =
      AsyncAction('_OdemeEkleModelBase.initialize', context: context);

  @override
  Future<void> initialize() {
    return _$initializeAsyncAction.run(() => super.initialize());
  }

  @override
  String toString() {
    return '''
calendarSelectDate: ${calendarSelectDate}
    ''';
  }
}
