import 'package:flutter/cupertino.dart';
import 'package:selpar/core/helper/custom_list_page_widget/custom_list_page_widget.dart';
import 'package:selpar/screen/navigation_bar_items/buy_sell_screen/subscreen/alis_evrak_listesi/alis_evrak_listesi_model/alis_evrak_listesi_model.dart';

import '../../../../../service/language/language_service/language_service.dart';

class AlisEvrakListesi extends StatelessWidget {
  AlisEvrakListesi({super.key});
  final AlisEvrakListesiModel _alisEvrakListesiModel = AlisEvrakListesiModel();
  @override
  Widget build(BuildContext context) {
    return CustomListPageWidget(
        pageTitle: LanguageService.choosenLanguage['key']!.alisEvrakListesi!,
        finishDate: _alisEvrakListesiModel.sharedCalendarFinish,
        startDate: _alisEvrakListesiModel.sharedCalendarStart,
        onTap: () {});
  }
}
