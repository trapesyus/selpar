import 'package:flutter/material.dart';
import 'package:selpar/core/constants/color_constants.dart';
import 'package:selpar/core/extensions/padding_extension.dart';
import 'package:selpar/core/extensions/size_extension.dart';
import 'package:selpar/core/helper/custom_list_page_widget/custom_list_page_widget.dart';
import 'package:selpar/core/helper/shared_calendar_widget/shared_calendar_widget_model/shared_calendar_widget_model.dart';
import 'package:selpar/core/widgets/text_widget.dart';

class CustomCheckBillWidget extends StatelessWidget {
  final String pageTitle;
  final Function() showButtonOnTap;
  final String firstSubTitle;
  final String firstContent;
  final String secondContent;
  final String secondSubTitle;
  final SharedCalendarWidgetModel startDate;
  final SharedCalendarWidgetModel finishDate;
  const CustomCheckBillWidget(
      {super.key,
      required this.pageTitle,
      required this.firstContent,
      required this.secondContent,
      required this.firstSubTitle,
      required this.secondSubTitle,
      required this.showButtonOnTap,
      required this.startDate,
      required this.finishDate});

  @override
  Widget build(BuildContext context) {
    return CustomListPageWidget(
      pageTitle: pageTitle,
      finishDate: finishDate,
      startDate: startDate,
      onTap: showButtonOnTap,
      child: Container(
        margin:
            EdgeInsets.symmetric(vertical: context.getSizeHeight(size: 0.04)),
        height: context.getSizeHeight(size: 0.74),
        child: Column(
          children: [
            Expanded(
              child: _customCheckBillListView(
                  context: context,
                  title: firstSubTitle,
                  content: firstContent),
            ),
            _div(context),
            Expanded(
                child: _customCheckBillListView(
                    context: context,
                    title: secondSubTitle,
                    content: secondContent)),
          ],
        ),
      ),
    );
  }

  Divider _div(BuildContext context) {
    return Divider(
      color: ColorConstants.hintDarkContainerColor,
      thickness: 2,
      height: context.getSizeHeight(size: 0.02),
    );
  }

  Column _customCheckBillListView(
      {required BuildContext context,
      required String title,
      required String content}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
                text: title,
                fontSize: 16,
                color: ColorConstants.defaultTextColor)
            .getPaddingOnly(context: context, bottom: 0.02),
        SizedBox(
            height: context.getSizeHeight(size: 0.3),
            child: ListView.separated(
              itemCount: 5,
              separatorBuilder: (context, index) => SizedBox(
                height: context.getSizeHeight(size: 0.02),
              ),
              itemBuilder: (context, index) => Container(
                alignment: Alignment.center,
                height: context.getSizeHeight(size: 0.3),
                decoration: BoxDecoration(
                    color: ColorConstants.hintDarkContainerColor,
                    borderRadius: BorderRadius.circular(10)),
                child: CustomText(text: content, color: ColorConstants.bgColor),
              ),
            ))
      ],
    );
  }
}
