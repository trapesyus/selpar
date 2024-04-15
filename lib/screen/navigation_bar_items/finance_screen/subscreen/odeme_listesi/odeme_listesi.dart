import 'package:flutter/cupertino.dart';
import 'package:selpar/core/helper/custom_list_page_widget/custom_list_page_widget.dart';
import 'package:selpar/screen/navigation_bar_items/finance_screen/subscreen/odeme_listesi/odeme_listesi_model/odeme_listesi_model.dart';

class OdemeListesi extends StatelessWidget {
  OdemeListesi({super.key});
  final OdemeListesiModel _odemeListesiModel = OdemeListesiModel();
  @override
  Widget build(BuildContext context) {
    return CustomListPageWidget(
        pageTitle: 'Ödeme Listesi',
        finishDate: _odemeListesiModel.sharedCalendarFinish,
        startDate: _odemeListesiModel.sharedCalendarStart,
        onTap: () {});
  }
}
