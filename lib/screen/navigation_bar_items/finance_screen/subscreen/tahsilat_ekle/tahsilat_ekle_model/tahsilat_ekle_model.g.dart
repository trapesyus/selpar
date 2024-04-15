// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tahsilat_ekle_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TahsilatEkleModel on _TahsilatEkleModelBase, Store {
  late final _$selectedDateAtom =
      Atom(name: '_TahsilatEkleModelBase.selectedDate', context: context);

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

  late final _$initializeAsyncAction =
      AsyncAction('_TahsilatEkleModelBase.initialize', context: context);

  @override
  Future<void> initialize() {
    return _$initializeAsyncAction.run(() => super.initialize());
  }

  late final _$selectDateAsyncAction =
      AsyncAction('_TahsilatEkleModelBase.selectDate', context: context);

  @override
  Future<void> selectDate({required BuildContext context}) {
    return _$selectDateAsyncAction
        .run(() => super.selectDate(context: context));
  }

  @override
  String toString() {
    return '''
selectedDate: ${selectedDate}
    ''';
  }
}
