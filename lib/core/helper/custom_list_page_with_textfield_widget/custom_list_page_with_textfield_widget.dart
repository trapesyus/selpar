import 'package:flutter/material.dart';
import 'package:selpar/core/extensions/padding_extension.dart';
import 'package:selpar/core/extensions/size_extension.dart';

import '../../constants/color_constants.dart';
import '../../widgets/text_widget.dart';
import '../custom_search_operation_textfield_widget/custom_search_operation_textfield_widget.dart';
import '../shared_calendar_widget/shared_calendar_widget.dart';
import '../shared_calendar_widget/shared_calendar_widget_model/shared_calendar_widget_model.dart';

// ignore: must_be_immutable
class CustomListPageWithTextField extends StatelessWidget {
  final String pageTitle;
  final SharedCalendarWidgetModel startDate;
  final SharedCalendarWidgetModel finishDate;
  final Function() onTap;
  Widget? child;
  CustomListPageWithTextField(
      {super.key,
      required this.startDate,
      required this.finishDate,
      required this.pageTitle,
      required this.onTap,
      this.child});

  @override
  Widget build(BuildContext context) {
    return CustomSearchOperationTextFieldWidget(
      pageTitle: pageTitle,
      onTapTextField: () {},
      child: Column(
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
              _customButton(
                  context: context, buttonText: 'Göster', onTap: onTap)
            ],
          ),
          child != null ? child! : const SizedBox()
        ],
      ),
    );
  }

  GestureDetector _customButton(
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
              color: ColorConstants.hintDarkContainerColor),
          child: CustomText(
              text: buttonText,
              color: ColorConstants.defaultTextColor,
              isBold: true),
        ),
      );
}
