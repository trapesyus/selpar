import 'package:flutter/cupertino.dart';
import 'package:selpar/core/helper/custom_buy_sell_widget/custom_buy_sell_widget.dart';
import 'package:selpar/screen/navigation_bar_items/buy_sell_screen/subscreen/alis_islemi/alis_islemi_model/alis_islemi_model.dart';

import '../../../../../service/language/language_service/language_service.dart';

class AlisIslemi extends StatelessWidget {
  AlisIslemi({super.key});
  final AlisIslemiModel _alisIslemiModel = AlisIslemiModel();

  @override
  Widget build(BuildContext context) {
    return CustomBuySellWidget(
        isAlisSatisIslemi: true,
        pageTitle: LanguageService.choosenLanguage['key']!.alisIslemi!,
        store: _alisIslemiModel.buySellWidgetModel,
        stokAdiSearchOnTap: () {},
        stokNumarasiSearchOnTap: () {});
  }
}
