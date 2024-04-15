import 'package:flutter/material.dart';
import 'package:selpar/core/extensions/navigate_effective_extension.dart';
import 'package:selpar/core/extensions/padding_extension.dart';
import 'package:selpar/screen/navigation_bar_items/finance_screen/subscreen/cari_listesi/cari_listesi.dart';
import 'package:selpar/screen/navigation_bar_items/finance_screen/subscreen/odeme_ekle/odeme_ekle.dart';
import 'package:selpar/screen/navigation_bar_items/finance_screen/subscreen/odeme_listesi/odeme_listesi.dart';
import 'package:selpar/screen/navigation_bar_items/finance_screen/subscreen/tahsilat_ekle/tahsilat_ekle.dart';

import '../../../core/constants/color_constants.dart';
import '../../../core/helper/custom_page_route_button/custom_page_route_button.dart';
import '../../../core/widgets/title_text_widget.dart';
import 'subscreen/tahsilat_listesi/tahsilat_listesi.dart';

class FinanceScreen extends StatelessWidget {
  const FinanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTitleText(
                title: 'Finans İşlemleri',
                color: ColorConstants.defaultTextColor)
            .getPaddingOnly(context: context, bottom: 0.12),
        CustomPageRouteButton(
            text: 'Cari Listesi (Hesap Ekstresi)',
            onPressed: () async => await const CariListesi()
                .navigateEffectiveTo(context: context)),
        CustomPageRouteButton(
            text: 'Tahsilat Ekle',
            onPressed: () async =>
                await TahsilatEkle().navigateEffectiveTo(context: context)),
        CustomPageRouteButton(
            text: 'Tahsilat Listesi',
            onPressed: () async =>
                await TahsilatListesi().navigateEffectiveTo(context: context)),
        CustomPageRouteButton(
            text: 'Bugün Yapılacak Tahsilatlar', onPressed: () {}),
        CustomPageRouteButton(
            text: 'Ödeme Ekle',
            onPressed: () async =>
                await OdemeEkle().navigateEffectiveTo(context: context)),
        CustomPageRouteButton(
            text: 'Ödeme Listesi',
            onPressed: () async =>
                await OdemeListesi().navigateEffectiveTo(context: context)),
        CustomPageRouteButton(
            text: 'Bugün Yapılacak Ödemeler', onPressed: () {}),
        CustomPageRouteButton(
            text: 'Bütün Alacaklar - Ödemeler', onPressed: () {}),
      ],
    );
  }
}
