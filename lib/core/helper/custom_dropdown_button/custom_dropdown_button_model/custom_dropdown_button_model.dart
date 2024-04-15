import 'package:mobx/mobx.dart';

part 'custom_dropdown_button_model.g.dart';

// ignore: library_private_types_in_public_api
class CustomDropDownButtonModel = _CustomDropDownButtonModel
    with _$CustomDropDownButtonModel;

abstract class _CustomDropDownButtonModel with Store {
  @observable
  String selectedValue = '';

  @action
  void initialize({required String receivedValue}) {
    selectedValue = receivedValue;
  }

  @action
  void setSelectedValue(String value) {
    selectedValue = value;
  }
}
