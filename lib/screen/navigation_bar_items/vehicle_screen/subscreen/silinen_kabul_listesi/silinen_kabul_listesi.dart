import 'package:flutter/material.dart';
import 'package:selpar/core/helper/custom_list_page_with_textfield_widget/custom_list_page_with_textfield_widget.dart';
import 'package:selpar/screen/navigation_bar_items/vehicle_screen/subscreen/silinen_kabul_listesi/silinen_kabul_listesi_model/silinen_kabul_listesi_model.dart';

class SilinenKabulListesi extends StatelessWidget {
  SilinenKabulListesi({super.key});
  final SilinenKabulListesiModel _kabulListesiModel =
      SilinenKabulListesiModel();
  @override
  Widget build(BuildContext context) {
    return CustomListPageWithTextField(
        startDate: _kabulListesiModel.sharedCalendarStart,
        finishDate: _kabulListesiModel.sharedCalendarFinish,
        pageTitle: 'Silinen Kabul Listesi',
        onTap: () {});
  }
}
