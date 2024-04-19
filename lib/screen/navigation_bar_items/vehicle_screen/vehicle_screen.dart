import 'package:flutter/material.dart';
import 'package:selpar/core/constants/color_constants.dart';
import 'package:selpar/core/extensions/navigate_effective_extension.dart';
import 'package:selpar/core/extensions/padding_extension.dart';
import 'package:selpar/core/helper/custom_page_route_button/custom_page_route_button.dart';
import 'package:selpar/core/widgets/title_text_widget.dart';
import 'package:selpar/screen/navigation_bar_items/vehicle_screen/subscreen/%C3%B6nceki_onarimlar/%C3%B6nceki_onarimlar.dart';
import 'package:selpar/screen/navigation_bar_items/vehicle_screen/subscreen/kapali_onarimlar/kapali_onarimlar.dart';
import 'package:selpar/screen/navigation_bar_items/vehicle_screen/subscreen/silinen_kabul_listesi/silinen_kabul_listesi.dart';
import 'package:selpar/screen/navigation_bar_items/vehicle_screen/subscreen/tahsilati_yapilmayan_onarimlar/tahsilati_yapilmayan_onarimlar.dart';

import '../../../service/language/language_service/language_service.dart';

class VehicleScreen extends StatelessWidget {
  const VehicleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTitleText(
                title: LanguageService.choosenLanguage['key']!.servisIslemleri!,
                color: ColorConstants.defaultTextColor)
            .getPaddingOnly(context: context, bottom: 0.24),
        CustomPageRouteButton(
            text: 'Kapalı Onarımlar',
            onPressed: () =>
                const KapaliOnarimlar().navigateEffectiveTo(context: context)),
        CustomPageRouteButton(
            text: 'Tahsilatı Yapılmayan Onarımlar',
            onPressed: () => TahsilatiYapilmayanOnarimlar()
                .navigateEffectiveTo(context: context)),
        CustomPageRouteButton(
            text: 'Önceki Onarımlar',
            onPressed: () =>
                const OncekiOnarimlar().navigateEffectiveTo(context: context)),
        CustomPageRouteButton(
            text: 'Silinen Kabul Listesi',
            onPressed: () =>
                SilinenKabulListesi().navigateEffectiveTo(context: context))
      ],
    );
  }
}
