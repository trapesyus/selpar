import 'package:flutter/material.dart';
import 'package:selpar/core/constants/color_constants.dart';
import 'package:selpar/core/extensions/navigate_effective_extension.dart';
import 'package:selpar/core/extensions/padding_extension.dart';
import 'package:selpar/core/helper/custom_page_route_button/custom_page_route_button.dart';
import 'package:selpar/core/widgets/title_text_widget.dart';
import 'package:selpar/screen/navigation_bar_items/online_operation_screen/subscreen/gelen_fatura/gelen_fatura.dart';
import 'package:selpar/screen/navigation_bar_items/online_operation_screen/subscreen/giden_fatura/giden_fatura.dart';

class OnlineOperationScreen extends StatelessWidget {
  const OnlineOperationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomTitleText(
                title: 'E-İşlemler', color: ColorConstants.defaultTextColor)
            .getPaddingOnly(context: context, bottom: 0.26),
        CustomPageRouteButton(
            text: 'Gelen Fatura',
            onPressed: () async => await const GelenFatura()
                .navigateEffectiveTo(context: context)),
        CustomPageRouteButton(
            text: 'Giden Fatura',
            onPressed: () async => await const GidenFatura()
                .navigateEffectiveTo(context: context)),
        CustomPageRouteButton(text: 'Giden E-İrsaliye', onPressed: () {})
      ],
    );
  }
}
