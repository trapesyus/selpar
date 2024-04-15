import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selpar/core/constants/color_constants.dart';
import 'package:selpar/core/extensions/padding_extension.dart';
import 'package:selpar/core/extensions/size_extension.dart';
import 'package:selpar/core/helper/shared_calendar_widget/shared_calendar_widget_model/shared_calendar_widget_model.dart';
import 'package:selpar/core/widgets/appbar_widget.dart';
import 'package:selpar/core/widgets/icon_button_widget.dart';

import '../../widgets/text_widget.dart';
import '../shared_calendar_widget/shared_calendar_widget.dart';

// ignore: must_be_immutable
class CustomListPageWidget extends StatelessWidget {
  Widget? child;
  final Function() onTap;
  final String pageTitle;
  final SharedCalendarWidgetModel startDate;
  final SharedCalendarWidgetModel finishDate;
  CustomListPageWidget(
      {super.key,
      required this.pageTitle,
      required this.finishDate,
      required this.startDate,
      required this.onTap,
      this.child});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: CustomAppBar(
        title: pageTitle,
        centerTitle: false,
        titleStyle: true,
        leading: CustomIconButton(
            icon: const Icon(CupertinoIcons.back,
                color: ColorConstants.textButtonColor),
            onPressed: () => Navigator.of(context).pop()),
      ),
      body: ListView(
        padding:
            EdgeInsets.symmetric(horizontal: context.getSizeWidth(size: 0.04)),
        children: [
          Row(
            children: [
              Expanded(
                  child: SharedCalendarWidget(
                      store: startDate, title: 'Başlangıç:')),
              Expanded(
                  child:
                      SharedCalendarWidget(store: finishDate, title: 'Bitiş:')
                          .getPaddingOnly(
                              context: context, left: 0.02, right: 0.02)),
              customButton(
                  context: context, buttonText: 'Göster', onTap: onTap),
            ],
          ),
          child != null ? child! : const SizedBox()
        ],
      ),
    ));
  }

  GestureDetector customButton(
          {required BuildContext context,
          required String buttonText,
          required Function() onTap}) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
          height: context.getSizeHeight(size: 0.08),
          width: context.getSizeWidth(size: 0.2),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: ColorConstants.buttonColor),
          child: CustomText(
              text: buttonText, color: ColorConstants.whiteColor, isBold: true),
        ),
      );
}
