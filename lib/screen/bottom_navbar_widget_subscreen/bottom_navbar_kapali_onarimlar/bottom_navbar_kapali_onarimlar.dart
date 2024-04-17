import 'package:flutter/cupertino.dart';
import 'package:selpar/core/helper/custom_search_operation_textfield_without_scaffold_widget/custom_search_operation_textfield_without_scaffold_widget.dart';
import 'package:selpar/service/language/language_service/language_service.dart';

class BottomNavBarKapaliOnarimlar extends StatelessWidget {
  const BottomNavBarKapaliOnarimlar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSearchOperationTextFieldWithoutScaffoldWidget(
      onTapTextField: () {},
      pageTitle: LanguageService.choosenLanguage['key']!.kapaliOnarimlar!,
    );
  }
}
