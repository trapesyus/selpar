// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_dropdown_button_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CustomDropDownButtonModel on _CustomDropDownButtonModel, Store {
  late final _$selectedValueAtom =
      Atom(name: '_CustomDropDownButtonModel.selectedValue', context: context);

  @override
  String get selectedValue {
    _$selectedValueAtom.reportRead();
    return super.selectedValue;
  }

  @override
  set selectedValue(String value) {
    _$selectedValueAtom.reportWrite(value, super.selectedValue, () {
      super.selectedValue = value;
    });
  }

  late final _$_CustomDropDownButtonModelActionController =
      ActionController(name: '_CustomDropDownButtonModel', context: context);

  @override
  void initialize({required String receivedValue}) {
    final _$actionInfo = _$_CustomDropDownButtonModelActionController
        .startAction(name: '_CustomDropDownButtonModel.initialize');
    try {
      return super.initialize(receivedValue: receivedValue);
    } finally {
      _$_CustomDropDownButtonModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedValue(String value) {
    final _$actionInfo = _$_CustomDropDownButtonModelActionController
        .startAction(name: '_CustomDropDownButtonModel.setSelectedValue');
    try {
      return super.setSelectedValue(value);
    } finally {
      _$_CustomDropDownButtonModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedValue: ${selectedValue}
    ''';
  }
}
