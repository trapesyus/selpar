import 'package:flutter/material.dart';
import 'package:selpar/core/helper/custom_buy_sell_widget/custom_buy_sell_widget.dart';
import 'package:selpar/screen/home_screen/subscreen/teklif/teklif_model/teklif_model.dart';
import 'package:selpar/service/language/language_service/language_service.dart';

class Teklif extends StatelessWidget {
  Teklif({super.key});
  final TeklifModel _teklifModel = TeklifModel();
  @override
  Widget build(BuildContext context) {
    return CustomBuySellWidget(
        isAlisSatisIslemi: true,
        pageTitle: LanguageService.choosenLanguage['key']!.teklif!,
        stokAdiSearchOnTap: () {},
        stokNumarasiSearchOnTap: () {},
        store: _teklifModel.customBuySellWidgetModel);
  }
}
