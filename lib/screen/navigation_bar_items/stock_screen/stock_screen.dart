import 'package:flutter/material.dart';
import 'package:selpar/core/constants/color_constants.dart';
import 'package:selpar/core/extensions/navigate_effective_extension.dart';
import 'package:selpar/core/extensions/padding_extension.dart';
import 'package:selpar/core/extensions/size_extension.dart';
import 'package:selpar/core/helper/custom_page_route_button/custom_page_route_button.dart';
import 'package:selpar/core/widgets/text_widget.dart';
import 'package:selpar/core/widgets/title_text_widget.dart';

import 'subscreen/orjinal_stok_listesi/orjinal_stok_listesi.dart';
import 'subscreen/stok_listesi/stok_listesi.dart';

class StockScreen extends StatelessWidget {
  const StockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomTitleText(
                title: 'Stok İşlemleri', color: ColorConstants.defaultTextColor)
            .getPaddingOnly(context: context, bottom: 0.3),
        CustomPageRouteButton(
            text: 'Stok Listesi',
            onPressed: () async => await const StokListesi()
                .navigateEffectiveTo(context: context)),
        CustomPageRouteButton(
            text: 'Orjinal Stok Listesi',
            onPressed: () async => await const OrjinalStokListesi()
                .navigateEffectiveTo(context: context)),
      ],
    );
  }
}
