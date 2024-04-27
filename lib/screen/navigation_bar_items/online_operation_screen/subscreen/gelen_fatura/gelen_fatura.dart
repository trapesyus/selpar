import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selpar/core/constants/color_constants.dart';
import 'package:selpar/core/extensions/padding_extension.dart';
import 'package:selpar/core/extensions/size_extension.dart';
import 'package:selpar/core/widgets/appbar_widget.dart';
import 'package:selpar/core/widgets/icon_button_widget.dart';
import 'package:selpar/core/widgets/text_widget.dart';
import 'package:simple_icons/simple_icons.dart';

import '../../../../../service/language/language_service/language_service.dart';

class GelenFatura extends StatelessWidget {
  const GelenFatura({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: _appBar(context),
      body: SizedBox(
        width: context.getSizeWidth(size: 0.92),
        child: _listCard(context),
      ).getPadding(context: context, sizeWidth: 0.04, sizeHeight: 0),
    ));
  }

  ListView _listCard(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(bottom: context.getSizeHeight(size: 0.02)),
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (context, index) => SizedBox(
        height: context.getSizeHeight(size: 0.02),
      ),
      itemCount: 20,
      itemBuilder: (context, index) => Container(
        padding: EdgeInsets.only(top: context.getSizeHeight(size: 0.02)),
        height: context.getSizeHeight(size: 0.2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: ColorConstants.hintDarkContainerColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _title(),
            _subTitle()
                .getPadding(context: context, sizeWidth: 0.04, sizeHeight: 0),
            _cardButtons()
          ],
        ),
      ),
    );
  }

  SingleChildScrollView _title() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: CustomText(
          text: 'Başbuğ Oto Yedek Parça ',
          color: ColorConstants.bgColor,
          isBold: true,
          fontSize: 16),
    );
  }

  Row _subTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
            text: 'Tarih: 08.04.2024',
            color: ColorConstants.defaultTextColor,
            isBold: true),
        CustomText(
            text: 'Toplam: 1.496,92₺',
            color: ColorConstants.defaultTextColor,
            isBold: true)
      ],
    );
  }

  Row _cardButtons() {
    return Row(
      children: [_pdfButton(), _whatsappButton()],
    );
  }

  CustomIconButton _pdfButton() {
    return CustomIconButton(
        icon: const Icon(
          Icons.picture_as_pdf_outlined,
          color: ColorConstants.defaultTextColor,
          size: 28,
        ),
        onPressed: () {});
  }

  CustomIconButton _whatsappButton() {
    return CustomIconButton(
        icon: const Icon(SimpleIcons.whatsapp,
            color: ColorConstants.defaultTextColor),
        onPressed: () {});
  }

  CustomAppBar _appBar(BuildContext context) {
    return CustomAppBar(
      title: LanguageService.choosenLanguage['key']!.gelenFatura!,
      titleStyle: true,
      centerTitle: false,
      leading: CustomIconButton(
          icon: const Icon(CupertinoIcons.back,
              color: ColorConstants.buttonColor),
          onPressed: () => Navigator.of(context).pop()),
    );
  }
}
