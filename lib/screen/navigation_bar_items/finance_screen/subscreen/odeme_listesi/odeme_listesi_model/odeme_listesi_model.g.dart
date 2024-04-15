// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'odeme_listesi_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OdemeListesiModel on _OdemeListesiModelBase, Store {
  late final _$sharedCalendarStartAtom = Atom(
      name: '_OdemeListesiModelBase.sharedCalendarStart', context: context);

  @override
  SharedCalendarWidgetModel get sharedCalendarStart {
    _$sharedCalendarStartAtom.reportRead();
    return super.sharedCalendarStart;
  }

  @override
  set sharedCalendarStart(SharedCalendarWidgetModel value) {
    _$sharedCalendarStartAtom.reportWrite(value, super.sharedCalendarStart, () {
      super.sharedCalendarStart = value;
    });
  }

  late final _$sharedCalendarFinishAtom = Atom(
      name: '_OdemeListesiModelBase.sharedCalendarFinish', context: context);

  @override
  SharedCalendarWidgetModel get sharedCalendarFinish {
    _$sharedCalendarFinishAtom.reportRead();
    return super.sharedCalendarFinish;
  }

  @override
  set sharedCalendarFinish(SharedCalendarWidgetModel value) {
    _$sharedCalendarFinishAtom.reportWrite(value, super.sharedCalendarFinish,
        () {
      super.sharedCalendarFinish = value;
    });
  }

  @override
  String toString() {
    return '''
sharedCalendarStart: ${sharedCalendarStart},
sharedCalendarFinish: ${sharedCalendarFinish}
    ''';
  }
}
