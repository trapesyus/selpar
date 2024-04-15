import 'package:flutter/material.dart';
import 'package:selpar/core/helper/custom_buy_sell_widget/custom_buy_sell_widget.dart';
import 'package:selpar/screen/navigation_bar_items/order_screen/alinan_siparis_girisi/alinan_siparis_girisi_model/alinan_siparis_girisi_model.dart';

class AlinanSiparisGirisi extends StatelessWidget {
  AlinanSiparisGirisi({super.key});
  final AlinanSiparisGirisiModel _alinanSiparisGirisiModel =
      AlinanSiparisGirisiModel();
  @override
  Widget build(BuildContext context) {
    return CustomBuySellWidget(
        pageTitle: 'Alınan Sipariş Girişi',
        stokAdiSearchOnTap: () {},
        stokNumarasiSearchOnTap: () {},
        store: _alinanSiparisGirisiModel.customBuySellWidgetModel);
  }
}
