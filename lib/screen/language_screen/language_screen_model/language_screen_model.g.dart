// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_screen_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LanguageScreenModel on _LanguageScreenModelBase, Store {
  late final _$selectedLanguageAtom =
      Atom(name: '_LanguageScreenModelBase.selectedLanguage', context: context);

  @override
  String get selectedLanguage {
    _$selectedLanguageAtom.reportRead();
    return super.selectedLanguage;
  }

  @override
  set selectedLanguage(String value) {
    _$selectedLanguageAtom.reportWrite(value, super.selectedLanguage, () {
      super.selectedLanguage = value;
    });
  }

  late final _$isSelectedLanguageAtom = Atom(
      name: '_LanguageScreenModelBase.isSelectedLanguage', context: context);

  @override
  bool get isSelectedLanguage {
    _$isSelectedLanguageAtom.reportRead();
    return super.isSelectedLanguage;
  }

  @override
  set isSelectedLanguage(bool value) {
    _$isSelectedLanguageAtom.reportWrite(value, super.isSelectedLanguage, () {
      super.isSelectedLanguage = value;
    });
  }

  late final _$setSelectedLanguageAsyncAction = AsyncAction(
      '_LanguageScreenModelBase.setSelectedLanguage',
      context: context);

  @override
  Future<void> setSelectedLanguage(
      {required String language,
      required BuildContext context,
      required bool isPreloadingScreen}) {
    return _$setSelectedLanguageAsyncAction.run(() => super.setSelectedLanguage(
        language: language,
        context: context,
        isPreloadingScreen: isPreloadingScreen));
  }

  @override
  String toString() {
    return '''
selectedLanguage: ${selectedLanguage},
isSelectedLanguage: ${isSelectedLanguage}
    ''';
  }
}
