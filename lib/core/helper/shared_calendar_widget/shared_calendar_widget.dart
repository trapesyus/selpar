import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:selpar/core/extensions/padding_extension.dart';
import 'package:selpar/core/extensions/size_extension.dart';
import 'package:selpar/core/helper/shared_calendar_widget/shared_calendar_widget_model/shared_calendar_widget_model.dart';

import '../../constants/color_constants.dart';
import '../../widgets/text_widget.dart';

// ignore: must_be_immutable
class SharedCalendarWidget extends StatelessWidget {
  final SharedCalendarWidgetModel store;
  final String title;
  bool isTitleRow;

  SharedCalendarWidget(
      {super.key,
      required this.store,
      required this.title,
      this.isTitleRow = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async => await store.selectDate(context: context),
      child: Container(
        height: isTitleRow
            ? context.getSizeHeight(size: 0.07)
            : context.getSizeHeight(size: 0.08),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(color: ColorConstants.buttonColor, width: 2),
            borderRadius: BorderRadius.circular(20)),
        child: Observer(builder: (context) {
          return title != ''
              ? isTitleRow
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _selectDateText()
                            .getPaddingOnly(context: context, right: 0.02),
                        CustomText(
                            text:
                                "${store.selectedDate.toLocal()}".split(' ')[0],
                            color: ColorConstants.defaultTextColor,
                            isBold: true),
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _selectDateText(),
                        CustomText(
                            text:
                                "${store.selectedDate.toLocal()}".split(' ')[0],
                            color: ColorConstants.defaultTextColor,
                            isBold: true),
                      ],
                    )
              : CustomText(
                  text: "${store.selectedDate.toLocal()}".split(' ')[0],
                  color: ColorConstants.defaultTextColor,
                  isBold: true);
        }),
      ),
    );
  }

  CustomText _selectDateText() {
    return CustomText(
      text: title,
      color: ColorConstants.defaultTextColor,
      isBold: true,
    );
  }
}
