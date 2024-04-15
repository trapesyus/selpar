import 'package:flutter/material.dart';
import 'package:selpar/core/helper/custom_search_operation_textfield_widget/custom_search_operation_textfield_widget.dart';

class OncekiOnarimlar extends StatelessWidget {
  const OncekiOnarimlar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSearchOperationTextFieldWidget(
        pageTitle: 'Önceki Onarımlar', onTapTextField: () {});
  }
}
