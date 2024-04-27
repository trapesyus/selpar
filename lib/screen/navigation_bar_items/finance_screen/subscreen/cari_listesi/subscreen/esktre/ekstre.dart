import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:selpar/core/constants/color_constants.dart';
import 'package:selpar/core/extensions/padding_extension.dart';
import 'package:selpar/core/helper/shared_calendar_widget/shared_calendar_widget.dart';
import 'package:selpar/core/widgets/appbar_widget.dart';
import 'package:selpar/core/widgets/icon_button_widget.dart';
import 'package:selpar/core/widgets/text_widget.dart';
import 'package:selpar/screen/navigation_bar_items/finance_screen/subscreen/cari_listesi/subscreen/esktre/ekstre_model/ekstre_model.dart';
import 'package:selpar/service/language/language_service/language_service.dart';

class Ekstre extends StatelessWidget {
  final String cariUnvan;
  final String bakiye;
  Ekstre({super.key, required this.cariUnvan, required this.bakiye}) {
    reaction((_) async => await _ekstreModel.initialize(), (_) {});
  }

  final EkstreModel _ekstreModel = EkstreModel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: _appBar(context),
      body: ListView(
        children: [
          ListTile(
            tileColor: ColorConstants.hintDarkContainerColor,
            title: _cardTitle(context)
                .getPaddingOnly(context: context, bottom: 0.02),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: _cardBakiye(),
                ),
                _cardAlacakBorc(),
                _cardButtons()
              ],
            ),
          ).getPaddingOnly(context: context, bottom: 0.02),
          Row(
            children: [
              Expanded(
                child:
                    _startDate().getPaddingOnly(context: context, right: 0.02),
              ),
              Expanded(
                child:
                    _finishDate().getPaddingOnly(context: context, left: 0.02),
              )
            ],
          )
        ],
      ).getPadding(context: context, sizeWidth: 0.02, sizeHeight: 0),
    ));
  }

  CustomAppBar _appBar(BuildContext context) {
    return CustomAppBar(
      leading: CustomIconButton(
        icon:
            const Icon(CupertinoIcons.back, color: ColorConstants.buttonColor),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: LanguageService.choosenLanguage['key']!.cariEkstre!,
      titleStyle: true,
      centerTitle: false,
    );
  }

  SharedCalendarWidget _finishDate() => SharedCalendarWidget(
        store: _ekstreModel.sharedCalendarStart,
        isTitleRow: true,
        title: LanguageService.choosenLanguage['key']!.bitis!,
      );

  SharedCalendarWidget _startDate() => SharedCalendarWidget(
        store: _ekstreModel.sharedCalendarStart,
        isTitleRow: true,
        title: LanguageService.choosenLanguage['key']!.baslangic!,
      );

  Row _cardButtons() => Row(
        children: [
          CustomIconButton(
              icon: const Icon(
                Icons.picture_as_pdf,
                color: ColorConstants.buttonColor,
                size: 30,
              ),
              onPressed: () {}),
          CustomIconButton(
              icon: const Icon(
                CupertinoIcons.add,
                color: ColorConstants.buttonColor,
                size: 30,
              ),
              onPressed: () {})
        ],
      );

  CustomText _cardAlacakBorc() => CustomText(
      text: bakiye.contains('-')
          ? LanguageService.choosenLanguage['key']!.alacak!
          : LanguageService.choosenLanguage['key']!.borc!,
      color: ColorConstants.bgColor);

  CustomText _cardBakiye() => CustomText(
      isMaxLines: true,
      text:
          '${LanguageService.choosenLanguage['key']!.guncelBakiyesi!} $bakiye',
      color: ColorConstants.bgColor);

  Row _cardTitle(BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            CupertinoIcons.profile_circled,
            size: 40,
            color: ColorConstants.bgColor,
          ).getPaddingOnly(context: context, right: 0.02),
          CustomText(
              text: cariUnvan,
              color: ColorConstants.bgColor,
              fontSize: 16,
              isBold: true)
        ],
      );
}
