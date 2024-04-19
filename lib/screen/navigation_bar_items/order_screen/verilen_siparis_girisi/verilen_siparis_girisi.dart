import 'package:flutter/cupertino.dart';
import 'package:selpar/core/helper/custom_buy_sell_widget/custom_buy_sell_widget.dart';
import 'package:selpar/screen/navigation_bar_items/order_screen/verilen_siparis_girisi/verilen_siparis_girisi_model/verilen_siparis_girisi_model.dart';

import '../../../../service/language/language_service/language_service.dart';

class VerilenSiparisGirisi extends StatelessWidget {
  VerilenSiparisGirisi({super.key});
  final VerilenSiparisGirisiModel _verilenSiparisGirisiModel =
      VerilenSiparisGirisiModel();
  @override
  Widget build(BuildContext context) {
    return CustomBuySellWidget(
        pageTitle:
            LanguageService.choosenLanguage['key']!.verilenSiparisGirisi!,
        stokAdiSearchOnTap: () {},
        stokNumarasiSearchOnTap: () {},
        store: _verilenSiparisGirisiModel.customBuySellWidgetModel);
  }
}
