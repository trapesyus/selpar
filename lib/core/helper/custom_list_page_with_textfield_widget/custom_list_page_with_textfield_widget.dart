import 'package:flutter/material.dart';
import 'package:selpar/core/extensions/padding_extension.dart';
import 'package:selpar/core/extensions/size_extension.dart';
import 'package:selpar/service/language/language_service/language_service.dart';

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
              Expanded(child: _startDate()),
              Expanded(
                  child: _finishDate().getPaddingOnly(
                      context: context, left: 0.02, right: 0.02)),
              _customButton(
                  context: context,
                  buttonText: LanguageService.choosenLanguage['key']!.goster!,
                  onTap: onTap)
            ],
          ),
          child != null ? child! : const SizedBox()
        ],
      ),
    );
  }

  SharedCalendarWidget _finishDate() {
    return SharedCalendarWidget(
        store: finishDate,
        title: LanguageService.choosenLanguage['key']!.bitis!);
  }

  SharedCalendarWidget _startDate() {
    return SharedCalendarWidget(
        store: startDate,
        title: LanguageService.choosenLanguage['key']!.baslangic!);
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
              color: ColorConstants.buttonColor),
          child: CustomText(
              text: buttonText, color: ColorConstants.whiteColor, isBold: true),
        ),
      );
}
