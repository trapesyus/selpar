import 'package:flutter/cupertino.dart';
import 'package:selpar/core/helper/custom_list_page_widget/custom_list_page_widget.dart';
import 'package:selpar/screen/navigation_bar_items/buy_sell_screen/subscreen/satis_evrak_listesi/satis_evrak_listesi_model/satis_evrak_listesi_model.dart';

class SatisEvrakListesi extends StatelessWidget {
  SatisEvrakListesi({super.key});
  final SatisEvrakListesiModel _satisEvrakListesiModel =
      SatisEvrakListesiModel();

  @override
  Widget build(BuildContext context) {
    return CustomListPageWidget(
        pageTitle: 'Satış Evrak Listesi',
        finishDate: _satisEvrakListesiModel.sharedCalendarFinish,
        startDate: _satisEvrakListesiModel.sharedCalendarStart,
        onTap: () {});
  }
}
