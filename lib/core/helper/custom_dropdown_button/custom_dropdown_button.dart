import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:selpar/core/constants/color_constants.dart';
import 'package:selpar/core/extensions/size_extension.dart';
import 'package:selpar/core/helper/custom_dropdown_button/custom_dropdown_button_model/custom_dropdown_button_model.dart';
import 'package:selpar/core/widgets/text_widget.dart';

class CustomDropDownbutton extends StatelessWidget {
  final List<String> items;

  CustomDropDownbutton({super.key, required this.items}) {
    reaction((_) => _dropDownButtonModel.initialize(receivedValue: items[0]),
        (_) {});
  }
  final CustomDropDownButtonModel _dropDownButtonModel =
      CustomDropDownButtonModel();
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return SizedBox(
        height: context.getSizeHeight(size: 0.072),
        child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                  color: ColorConstants.buttonColor, width: 2.0),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                  color: ColorConstants.buttonColor, width: 2.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                  color: ColorConstants.buttonColor, width: 2.0),
            ),
          ),
          value: _dropDownButtonModel.selectedValue,
          onChanged: (newValue) {
            _dropDownButtonModel.setSelectedValue(newValue!);
          },
          items: items.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: CustomText(
                  text: value,
                  color: ColorConstants.bgColor,
                  fontSize: 16,
                  isBold: false),
            );
          }).toList(),
        ),
      );
    });
  }
}
