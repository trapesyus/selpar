// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bottom_navbar_widget_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BottomNavbarWidgetModel on _BottomNavbarWidgetModelBase, Store {
  late final _$currentIndexAtom =
      Atom(name: '_BottomNavbarWidgetModelBase.currentIndex', context: context);

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  late final _$pagesAtom =
      Atom(name: '_BottomNavbarWidgetModelBase.pages', context: context);

  @override
  List<Widget> get pages {
    _$pagesAtom.reportRead();
    return super.pages;
  }

  @override
  set pages(List<Widget> value) {
    _$pagesAtom.reportWrite(value, super.pages, () {
      super.pages = value;
    });
  }

  late final _$_BottomNavbarWidgetModelBaseActionController =
      ActionController(name: '_BottomNavbarWidgetModelBase', context: context);

  @override
  void setIndex(int index) {
    final _$actionInfo = _$_BottomNavbarWidgetModelBaseActionController
        .startAction(name: '_BottomNavbarWidgetModelBase.setIndex');
    try {
      return super.setIndex(index);
    } finally {
      _$_BottomNavbarWidgetModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentIndex: ${currentIndex},
pages: ${pages}
    ''';
  }
}
