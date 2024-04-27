import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selpar/core/constants/color_constants.dart';
import 'package:selpar/core/extensions/padding_extension.dart';
import 'package:selpar/core/extensions/size_extension.dart';
import 'package:selpar/core/helper/custom_container_button/custom_container_button.dart';
import 'package:selpar/core/helper/shared_calendar_widget/shared_calendar_widget.dart';
import 'package:selpar/core/helper/shared_calendar_widget/shared_calendar_widget_model/shared_calendar_widget_model.dart';
import 'package:selpar/core/widgets/appbar_widget.dart';
import 'package:selpar/core/widgets/icon_button_widget.dart';
import 'package:selpar/service/language/language_service/language_service.dart';

class TahsilatiYapilmayanOnarimlar extends StatelessWidget {
  TahsilatiYapilmayanOnarimlar({super.key});
  final SharedCalendarWidgetModel _calendarWidgetModelStart =
      SharedCalendarWidgetModel.internal();
  final SharedCalendarWidgetModel _calendarWidgetModelFinish =
      SharedCalendarWidgetModel.internal();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _appbar(context),
        body: ListView(
          padding: EdgeInsets.symmetric(
              horizontal: context.getSizeWidth(size: 0.02)),
          children: [
            Row(
              children: [
                Expanded(child: _startDate()),
                Expanded(
                    child: _finishDate().getPaddingOnly(
                        context: context, left: 0.02, right: 0.02)),
                _showButton()
              ],
            )
          ],
        ),
      ),
    );
  }

  CustomAppBar _appbar(BuildContext context) => CustomAppBar(
        leading: CustomIconButton(
            icon: const Icon(
              CupertinoIcons.back,
              color: ColorConstants.buttonColor,
            ),
            onPressed: () => Navigator.of(context).pop()),
        title: LanguageService
            .choosenLanguage['key']!.tahsilatiYapilmayanOnarimlar!,
        centerTitle: false,
      );

  CustomContainerButton _showButton() => CustomContainerButton(
      buttonText: LanguageService.choosenLanguage['key']!.goster!,
      onTap: () {});

  SharedCalendarWidget _finishDate() => SharedCalendarWidget(
      store: _calendarWidgetModelFinish,
      title: LanguageService.choosenLanguage['key']!.bitis!);

  SharedCalendarWidget _startDate() => SharedCalendarWidget(
        store: _calendarWidgetModelStart,
        title: LanguageService.choosenLanguage['key']!.baslangic!,
      );
}
