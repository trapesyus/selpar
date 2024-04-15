import 'package:flutter/cupertino.dart';
import 'package:selpar/core/helper/custom_buy_sell_widget/custom_buy_sell_widget.dart';
import 'package:selpar/screen/navigation_bar_items/buy_sell_screen/subscreen/satis_islemi/satis_islemi_model/satis_islemi_model.dart';

class SatisIslemi extends StatelessWidget {
  SatisIslemi({super.key});
  final SatisIslemiModel _satisIslemiModel = SatisIslemiModel();

  @override
  Widget build(BuildContext context) {
    return CustomBuySellWidget(
        isAlisSatisIslemi: true,
        pageTitle: 'Satış İşlemi',
        stokAdiSearchOnTap: () {},
        stokNumarasiSearchOnTap: () {},
        store: _satisIslemiModel.buySellWidgetModel);
  }
}
