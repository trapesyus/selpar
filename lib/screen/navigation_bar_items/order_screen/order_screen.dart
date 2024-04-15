import 'package:flutter/material.dart';
import 'package:selpar/core/constants/color_constants.dart';
import 'package:selpar/core/extensions/navigate_effective_extension.dart';
import 'package:selpar/core/extensions/padding_extension.dart';
import 'package:selpar/core/helper/custom_page_route_button/custom_page_route_button.dart';
import 'package:selpar/core/widgets/title_text_widget.dart';
import 'package:selpar/screen/navigation_bar_items/order_screen/alinan_siparis_girisi/alinan_siparis_girisi.dart';
import 'package:selpar/screen/navigation_bar_items/order_screen/verilen_siparis_girisi/verilen_siparis_girisi.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomTitleText(
                title: 'Sipariş İşlemleri',
                color: ColorConstants.defaultTextColor)
            .getPaddingOnly(context: context, bottom: 0.24),
        CustomPageRouteButton(
            text: 'Alınan Sipariş Girişi',
            onPressed: () async => await AlinanSiparisGirisi()
                .navigateEffectiveTo(context: context)),
        CustomPageRouteButton(
            text: 'Verilen Sipariş Girişi',
            onPressed: () async => await VerilenSiparisGirisi()
                .navigateEffectiveTo(context: context)),
        CustomPageRouteButton(text: 'Alınan Sipariş Listesi', onPressed: () {}),
        CustomPageRouteButton(text: 'Verilen Sipariş Listesi', onPressed: () {})
      ],
    );
  }
}
