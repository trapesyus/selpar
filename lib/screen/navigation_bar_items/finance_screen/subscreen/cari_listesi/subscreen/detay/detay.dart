import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:selpar/core/constants/color_constants.dart';
import 'package:selpar/core/extensions/padding_extension.dart';
import 'package:selpar/core/extensions/size_extension.dart';
import 'package:selpar/core/widgets/appbar_widget.dart';
import 'package:selpar/core/widgets/icon_button_widget.dart';
import 'package:selpar/core/widgets/text_widget.dart';
import 'package:selpar/screen/navigation_bar_items/finance_screen/subscreen/cari_listesi/subscreen/detay/detay_model/detay_model.dart';
import 'package:selpar/service/language/language_service/language_service.dart';

class Detay extends StatelessWidget {
  final String cariUnvan;
  final String bakiye;
  final String alacak;
  final String borc;
  final String adres;
  final String telefon;
  final String vergiBilgileri;
  Detay(
      {super.key,
      required this.cariUnvan,
      required this.bakiye,
      required this.adres,
      required this.alacak,
      required this.borc,
      required this.telefon,
      required this.vergiBilgileri}) {
    reaction((_) async => await _detayModel.initialize(), (_) {});
  }
  final DetayModel _detayModel = DetayModel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: _appBar(context),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: context.getSizeHeight(size: 0.04)),
            height: context.getSizeHeight(size: 0.4),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: _image(),
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover)),
            child: _cariUnvan(),
          ),
          _adressPhoneInfo(
              context: context,
              icon: CupertinoIcons.map,
              bilgi: adres,
              information:
                  LanguageService.choosenLanguage['key']!.adresBilgisi!,
              noInformation: LanguageService
                  .choosenLanguage['key']!.adresBilgisiBulunamadi!),
          _adressPhoneInfo(
              context: context,
              icon: CupertinoIcons.phone,
              bilgi: telefon,
              information:
                  LanguageService.choosenLanguage['key']!.telefonBilgisi!,
              noInformation: LanguageService
                  .choosenLanguage['key']!.telefonBilgisiBulunamadi!),
          _adressPhoneInfo(
              context: context,
              icon: Icons.text_snippet_sharp,
              bilgi: vergiBilgileri,
              information:
                  LanguageService.choosenLanguage['key']!.vergiBilgisi!,
              noInformation: LanguageService
                  .choosenLanguage['key']!.vergiBilgisiBulunamadi!),
          _borcAlacakBakiye(context)
        ],
      ).getPadding(context: context, sizeWidth: 0.02, sizeHeight: 0),
    ));
  }

  Container _borcAlacakBakiye(BuildContext context) {
    return Container(
      height: context.getSizeHeight(size: 0.1),
      margin: EdgeInsets.symmetric(
          vertical: context.getSizeHeight(size: 0.02),
          horizontal: context.getSizeWidth(size: 0.02)),
      padding: EdgeInsets.symmetric(
          horizontal: context.getSizeWidth(size: 0.02),
          vertical: context.getSizeHeight(size: 0.01)),
      decoration: BoxDecoration(
        color: ColorConstants.hintDarkContainerColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: _balance(
                context: context,
                balanceTitle: LanguageService.choosenLanguage['key']!.borc!,
                balanceItem: borc),
          ),
          Expanded(
            child: _balance(
                context: context,
                balanceTitle: LanguageService.choosenLanguage['key']!.alacak!,
                balanceItem: alacak),
          ),
          Expanded(
            child: _balance(
                context: context,
                balanceTitle: LanguageService.choosenLanguage['key']!.bakiye!,
                balanceItem: bakiye),
          )
        ],
      ),
    );
  }

  Align _cariUnvan() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: CustomText(
          text: cariUnvan,
          color: ColorConstants.bgColor,
          fontSize: 16,
          isBold: true),
    );
  }

  NetworkImage _image() {
    return const NetworkImage(
      'https://www.erzincanmegailaclama.com/upload/resimler/ryok.jpg',
    );
  }

  CustomAppBar _appBar(BuildContext context) {
    return CustomAppBar(
      leading: CustomIconButton(
          icon: const Icon(CupertinoIcons.back,
              color: ColorConstants.buttonColor),
          onPressed: () => Navigator.of(context).pop()),
      title: LanguageService.choosenLanguage['key']!.cariDetay!,
      titleStyle: true,
      centerTitle: false,
    );
  }

  Column _balance(
      {required BuildContext context,
      required String balanceTitle,
      required String balanceItem}) {
    return Column(
      children: [
        CustomText(
                text: balanceTitle,
                color: ColorConstants.defaultTextColor,
                isBold: true)
            .getPaddingOnly(context: context, bottom: 0.02),
        CustomText(text: balanceItem, color: ColorConstants.bgColor),
      ],
    );
  }

  Padding _adressPhoneInfo(
      {required BuildContext context,
      required String information,
      required String noInformation,
      required IconData icon,
      required String bilgi}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          icon,
          color: ColorConstants.buttonColor,
        ).getPaddingOnly(context: context, right: 0.02),
        Expanded(
            child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: CustomText(
              text: bilgi == '' ? noInformation : information + bilgi,
              color: ColorConstants.bgColor),
        )),
      ],
    ).getPaddingOnly(context: context, bottom: 0.02, left: 0.04);
  }
}
