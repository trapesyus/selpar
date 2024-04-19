import 'package:flutter/material.dart';
import 'package:selpar/core/helper/custom_search_operation_textfield_widget/custom_search_operation_textfield_widget.dart';

import '../../../../../service/language/language_service/language_service.dart';

class KapaliOnarimlar extends StatelessWidget {
  const KapaliOnarimlar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSearchOperationTextFieldWidget(
      pageTitle: LanguageService.choosenLanguage['key']!.kapaliOnarimlar!,
      onTapTextField: () => {},
    );
  }
}
