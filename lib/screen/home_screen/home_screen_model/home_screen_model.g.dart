// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_screen_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeScreenModel on _HomeScreenModelBase, Store {
  late final _$isSearchingAtom =
      Atom(name: '_HomeScreenModelBase.isSearching', context: context);

  @override
  bool get isSearching {
    _$isSearchingAtom.reportRead();
    return super.isSearching;
  }

  @override
  set isSearching(bool value) {
    _$isSearchingAtom.reportWrite(value, super.isSearching, () {
      super.isSearching = value;
    });
  }

  late final _$dataAdvertAtom =
      Atom(name: '_HomeScreenModelBase.dataAdvert', context: context);

  @override
  List<dynamic> get dataAdvert {
    _$dataAdvertAtom.reportRead();
    return super.dataAdvert;
  }

  @override
  set dataAdvert(List<dynamic> value) {
    _$dataAdvertAtom.reportWrite(value, super.dataAdvert, () {
      super.dataAdvert = value;
    });
  }

  late final _$pagesDataAtom =
      Atom(name: '_HomeScreenModelBase.pagesData', context: context);

  @override
  List<String> get pagesData {
    _$pagesDataAtom.reportRead();
    return super.pagesData;
  }

  @override
  set pagesData(List<String> value) {
    _$pagesDataAtom.reportWrite(value, super.pagesData, () {
      super.pagesData = value;
    });
  }

  late final _$pageSearchControllerAtom =
      Atom(name: '_HomeScreenModelBase.pageSearchController', context: context);

  @override
  TextEditingController get pageSearchController {
    _$pageSearchControllerAtom.reportRead();
    return super.pageSearchController;
  }

  @override
  set pageSearchController(TextEditingController value) {
    _$pageSearchControllerAtom.reportWrite(value, super.pageSearchController,
        () {
      super.pageSearchController = value;
    });
  }

  late final _$navigateToSerachinPageAsyncAction = AsyncAction(
      '_HomeScreenModelBase.navigateToSerachinPage',
      context: context);

  @override
  Future<void> navigateToSerachinPage(String pageName, BuildContext context) {
    return _$navigateToSerachinPageAsyncAction
        .run(() => super.navigateToSerachinPage(pageName, context));
  }

  late final _$_HomeScreenModelBaseActionController =
      ActionController(name: '_HomeScreenModelBase', context: context);

  @override
  void pageSearchOperation({required String pageSearchControllerValue}) {
    final _$actionInfo = _$_HomeScreenModelBaseActionController.startAction(
        name: '_HomeScreenModelBase.pageSearchOperation');
    try {
      return super.pageSearchOperation(
          pageSearchControllerValue: pageSearchControllerValue);
    } finally {
      _$_HomeScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isSearching: ${isSearching},
dataAdvert: ${dataAdvert},
pagesData: ${pagesData},
pageSearchController: ${pageSearchController}
    ''';
  }
}
