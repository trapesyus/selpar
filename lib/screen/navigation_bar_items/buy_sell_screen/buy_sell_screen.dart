import 'package:flutter/material.dart';
import 'package:selpar/core/constants/color_constants.dart';
import 'package:selpar/core/extensions/navigate_effective_extension.dart';
import 'package:selpar/core/extensions/padding_extension.dart';
import 'package:selpar/core/helper/custom_page_route_button/custom_page_route_button.dart';
import 'package:selpar/core/widgets/title_text_widget.dart';
import 'package:selpar/screen/navigation_bar_items/buy_sell_screen/subscreen/alis_evrak_listesi/alis_evrak_listesi.dart';
import 'package:selpar/screen/navigation_bar_items/buy_sell_screen/subscreen/alis_islemi/alis_islemi.dart';
import 'package:selpar/screen/navigation_bar_items/buy_sell_screen/subscreen/satis_evrak_listesi/satis_evrak_listesi.dart';
import 'package:selpar/screen/navigation_bar_items/buy_sell_screen/subscreen/satis_islemi/satis_islemi.dart';

class BuySellScreen extends StatelessWidget {
  const BuySellScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomTitleText(
                title: 'Alım Satım İşlemleri',
                color: ColorConstants.defaultTextColor)
            .getPaddingOnly(context: context, bottom: 0.24),
        CustomPageRouteButton(
            text: 'Satış İşlemi',
            onPressed: () async =>
                await SatisIslemi().navigateEffectiveTo(context: context)),
        CustomPageRouteButton(
            text: 'Alış İşlemi',
            onPressed: () async =>
                await AlisIslemi().navigateEffectiveTo(context: context)),
        CustomPageRouteButton(
            text: 'Satış Evrak Listesi',
            onPressed: () async => await SatisEvrakListesi()
                .navigateEffectiveTo(context: context)),
        CustomPageRouteButton(
            text: 'Alış Evrak Listesi',
            onPressed: () async =>
                await AlisEvrakListesi().navigateEffectiveTo(context: context)),
      ],
    );
  }
}
