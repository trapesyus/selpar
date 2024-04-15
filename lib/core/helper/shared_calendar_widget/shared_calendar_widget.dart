import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:selpar/core/extensions/size_extension.dart';
import 'package:selpar/core/helper/shared_calendar_widget/shared_calendar_widget_model/shared_calendar_widget_model.dart';

import '../../constants/color_constants.dart';
import '../../widgets/text_widget.dart';

class SharedCalendarWidget extends StatelessWidget {
  final SharedCalendarWidgetModel store;
  final String title;

  const SharedCalendarWidget(
      {super.key, required this.store, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async => await store.selectDate(context: context),
      child: Container(
        height: context.getSizeHeight(size: 0.08),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(color: ColorConstants.hintDarkContainerColor),
            borderRadius: BorderRadius.circular(20)),
        child: Observer(builder: (context) {
          return title != ''
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomText(
                      text: title,
                      color: ColorConstants.defaultTextColor,
                      isBold: false,
                    ),
                    CustomText(
                        text: "${store.selectedDate.toLocal()}".split(' ')[0],
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
}
