// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_cari_listesi_list_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CustomCariListesiListViewModel
    on _CustomCariListesiListViewModelBase, Store {
  late final _$isLoadingAtom = Atom(
      name: '_CustomCariListesiListViewModelBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$dataAtom =
      Atom(name: '_CustomCariListesiListViewModelBase.data', context: context);

  @override
  List<CariData> get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(List<CariData> value) {
    _$dataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
data: ${data}
    ''';
  }
}
