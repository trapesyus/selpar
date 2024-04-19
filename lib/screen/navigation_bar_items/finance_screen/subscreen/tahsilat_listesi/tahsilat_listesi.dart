import 'package:flutter/material.dart';
import 'package:selpar/core/helper/custom_list_page_widget/custom_list_page_widget.dart';
import 'package:selpar/screen/navigation_bar_items/finance_screen/subscreen/tahsilat_listesi/tahsilat_listesi_model/tahsilat_listesi_model.dart';

import '../../../../../service/language/language_service/language_service.dart';

class TahsilatListesi extends StatelessWidget {
  TahsilatListesi({super.key});
  final TahsilatListesiModel _tahsilatListesiModel = TahsilatListesiModel();

  @override
  Widget build(BuildContext context) {
    return CustomListPageWidget(
        pageTitle: LanguageService.choosenLanguage['key']!.tahsilatListesi!,
        finishDate: _tahsilatListesiModel.sharedCalendarFinish,
        startDate: _tahsilatListesiModel.sharedCalendarStart,
        onTap: () {});
  }
}
