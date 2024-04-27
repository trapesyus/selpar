import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:selpar/core/constants/color_constants.dart';
import 'package:selpar/core/extensions/padding_extension.dart';
import 'package:selpar/core/extensions/size_extension.dart';
import 'package:selpar/core/helper/custom_buy_sell_widget/custom_buy_sell_widget_model/custom_buy_sell_widget_model.dart';
import 'package:selpar/core/helper/custom_container_button/custom_container_button.dart';
import 'package:selpar/core/helper/custom_dropdown_button/custom_dropdown_button.dart';
import 'package:selpar/core/widgets/appbar_widget.dart';
import 'package:selpar/core/widgets/elevated_button_widget.dart';
import 'package:selpar/core/widgets/icon_button_widget.dart';
import 'package:selpar/core/widgets/text_widget.dart';
import 'package:selpar/core/widgets/textfield_widget.dart';

import '../../../service/language/language_service/language_service.dart';

// ignore: must_be_immutable
class CustomBuySellWidget extends StatelessWidget {
  final Function() stokAdiSearchOnTap;
  final Function() stokNumarasiSearchOnTap;
  final String pageTitle;
  bool isAlisSatisIslemi;
  final CustomBuySellWidgetModel store;

  CustomBuySellWidget(
      {super.key,
      required this.pageTitle,
      this.isAlisSatisIslemi = false,
      required this.stokAdiSearchOnTap,
      required this.stokNumarasiSearchOnTap,
      required this.store}) {
    reaction((_) => store.initialize(), (_) {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _appBar(context),
        body: ListView(
          padding: EdgeInsets.symmetric(
              horizontal: context.getSizeWidth(size: 0.04)),
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          children: [
            isAlisSatisIslemi
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          _faturaTipiText()
                              .getPaddingOnly(context: context, right: 0.02),
                          Expanded(child: _faturaItems()),
                        ],
                      ).getPaddingOnly(context: context, bottom: 0.02),
                      Row(
                        children: [
                          _kdvTipiText()
                              .getPaddingOnly(context: context, right: 0.07),
                          Expanded(child: _kdvTypeItems())
                        ],
                      )
                    ],
                  )
                : Row(
                    children: [
                      _kdvTipiText()
                          .getPaddingOnly(context: context, right: 0.02),
                      Expanded(child: _kdvTypeItems())
                    ],
                  ),
            _vergiNo(),
            _vergiDairesi(),
            _adress(),
            Row(
              children: [
                Expanded(
                  child: _provinceItems()
                      .getPaddingOnly(context: context, right: 0.04),
                ),
                Expanded(
                    child: _districtItems()
                        .getPaddingOnly(context: context, left: 0.04))
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: _gsm().getPaddingOnly(context: context, right: 0.02),
                ),
                Expanded(
                  flex: 2,
                  child: _telefon(),
                ),
              ],
            ),
            _mail(),
            Row(
              children: [
                Expanded(child: _stokNumarasi()),
                _cameraContainer(context).getPaddingOnly(
                    context: context, left: 0.02, right: 0.02, bottom: 0.01),
                _searchButton().getPaddingOnly(context: context, bottom: 0.01)
              ],
            ),
            Row(
              children: [
                Expanded(child: _stokAdi()),
                _searchButton()
                    .getPaddingOnly(context: context, left: 0.02, bottom: 0.01)
              ],
            ),
            Row(
              children: [
                Expanded(child: _miktar()),
                Expanded(child: _fiyat()),
                Expanded(
                  child: _ist(),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      _kdvText().getPaddingOnly(
                          context: context, right: 0.02, left: 0.02),
                      Expanded(
                        child: _kdvCount()
                            .getPaddingOnly(context: context, right: 0.04),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: _typeItems()
                        .getPaddingOnly(context: context, left: 0.04))
              ],
            ),
            _ekleButton()
                .getPaddingOnly(context: context, bottom: 0.02, top: 0.02),
            _finalCardContainer(context)
                .getPaddingOnly(context: context, bottom: 0.04)
          ],
        ),
      ),
    );
  }

  Container _finalCardContainer(BuildContext context) {
    return Container(
      height: context.getSizeHeight(size: 0.14),
      decoration: BoxDecoration(
          color: ColorConstants.hintDarkContainerColor,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _toplamText().getPaddingOnly(context: context, top: 0.02, left: 0.04),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _saveButton(context),
              _fiyatContainer(context)
                  .getPaddingOnly(context: context, bottom: 0.02)
            ],
          ),
        ],
      ),
    );
  }

  GestureDetector _saveButton(BuildContext context) {
    return GestureDetector(
      child: _resultContainer(
              context: context,
              buttonText: LanguageService.choosenLanguage['key']!.kaydet!)
          .getPaddingOnly(context: context, right: 0.02, bottom: 0.02),
    );
  }

  Container _fiyatContainer(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: context.getSizeHeight(size: 0.05),
      width: context.getSizeWidth(size: 0.2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorConstants.hintContainerColor),
      child: _fiyatText(),
    );
  }

  CustomText _fiyatText() {
    return CustomText(
        text: '00.00 ₺', color: ColorConstants.defaultTextColor, isBold: true);
  }

  CustomText _toplamText() {
    return CustomText(
        text: LanguageService.choosenLanguage['key']!.toplam!,
        fontSize: 16,
        isBold: true,
        color: ColorConstants.defaultTextColor);
  }

  CustomElevatedButton _ekleButton() {
    return CustomElevatedButton(
        buttonText: LanguageService.choosenLanguage['key']!.ekle!,
        onPressed: () {});
  }

  CustomDropDownbutton _typeItems() =>
      CustomDropDownbutton(items: store.typeItems);

  CustomDropDownbutton _kdvCount() =>
      CustomDropDownbutton(items: store.kdvCount);

  CustomText _kdvText() {
    return CustomText(
        text: LanguageService.choosenLanguage['key']!.kdv!,
        color: ColorConstants.defaultTextColor);
  }

  CustomTextField _ist() {
    return CustomTextField(
      controller: null,
      horizontalHeight: 0.04,
      verticalHeight: 0.01,
      label: LanguageService.choosenLanguage['key']!.ist!,
      labelStyle: true,
      sizeLeft: 0.02,
    );
  }

  CustomTextField _fiyat() {
    return CustomTextField(
      controller: null,
      horizontalHeight: 0.04,
      verticalHeight: 0.01,
      sizeLeft: 0.02,
      label: LanguageService.choosenLanguage['key']!.fiyat!,
      labelStyle: true,
    );
  }

  CustomTextField _miktar() {
    return CustomTextField(
      controller: null,
      horizontalHeight: 0.04,
      verticalHeight: 0.01,
      label: LanguageService.choosenLanguage['key']!.miktar!,
      labelStyle: true,
    );
  }

  CustomTextField _stokAdi() {
    return CustomTextField(
      controller: null,
      horizontalHeight: 0.04,
      verticalHeight: 0.01,
      label: LanguageService.choosenLanguage['key']!.stokAdi!,
      labelStyle: true,
    );
  }

  CustomContainerButton _searchButton() {
    return CustomContainerButton(
        buttonText: LanguageService.choosenLanguage['key']!.ara!,
        onTap: stokNumarasiSearchOnTap);
  }

  Container _cameraContainer(BuildContext context) {
    return Container(
        width: context.getSizeWidth(size: 0.16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: ColorConstants.buttonColor),
        child: _cameraButton());
  }

  CustomIconButton _cameraButton() {
    return CustomIconButton(
        icon:
            const Icon(CupertinoIcons.camera, color: ColorConstants.whiteColor),
        onPressed: () {});
  }

  CustomTextField _stokNumarasi() {
    return CustomTextField(
      controller: null,
      horizontalHeight: 0.04,
      verticalHeight: 0.01,
      label: LanguageService.choosenLanguage['key']!.stokNumarasi!,
      labelStyle: true,
    );
  }

  CustomTextField _mail() {
    return CustomTextField(
      controller: null,
      horizontalHeight: 0.04,
      verticalHeight: 0.01,
      sizeBottom: 0.02,
      label: LanguageService.choosenLanguage['key']!.mail!,
      labelStyle: true,
    );
  }

  CustomTextField _telefon() {
    return CustomTextField(
      controller: null,
      horizontalHeight: 0.04,
      verticalHeight: 0.01,
      sizeTop: 0.02,
      label: LanguageService.choosenLanguage['key']!.telefon!,
      labelStyle: true,
    );
  }

  CustomTextField _gsm() {
    return CustomTextField(
      controller: null,
      horizontalHeight: 0.04,
      verticalHeight: 0.01,
      sizeTop: 0.02,
      label: LanguageService.choosenLanguage['key']!.gsm!,
      labelStyle: true,
    );
  }

  CustomDropDownbutton _districtItems() =>
      CustomDropDownbutton(items: store.districtItems);

  CustomDropDownbutton _provinceItems() =>
      CustomDropDownbutton(items: store.provinceItems);

  CustomTextField _adress() {
    return CustomTextField(
      controller: null,
      horizontalHeight: 0.04,
      verticalHeight: 0.01,
      sizeBottom: 0.02,
      label: LanguageService.choosenLanguage['key']!.adres!,
      labelStyle: true,
    );
  }

  CustomTextField _vergiDairesi() {
    return CustomTextField(
      controller: null,
      horizontalHeight: 0.04,
      verticalHeight: 0.01,
      label: LanguageService.choosenLanguage['key']!.vergiDairesi!,
      labelStyle: true,
    );
  }

  CustomTextField _vergiNo() {
    return CustomTextField(
      controller: null,
      horizontalHeight: 0.04,
      verticalHeight: 0.01,
      sizeTop: 0.02,
      label: LanguageService.choosenLanguage['key']!.vergiNo!,
      labelStyle: true,
    );
  }

  CustomDropDownbutton _kdvTypeItems() {
    return CustomDropDownbutton(items: store.kdvTypeItems);
  }

  CustomText _kdvTipiText() {
    return CustomText(
        text: LanguageService.choosenLanguage['key']!.kdvTipi!,
        isBold: true,
        color: ColorConstants.defaultTextColor);
  }

  CustomDropDownbutton _faturaItems() {
    return CustomDropDownbutton(items: store.faturaItems);
  }

  CustomText _faturaTipiText() {
    return CustomText(
        text: LanguageService.choosenLanguage['key']!.faturaTipi!,
        fontSize: 14,
        isBold: true,
        color: ColorConstants.defaultTextColor);
  }

  CustomAppBar _appBar(BuildContext context) {
    return CustomAppBar(
      leading: CustomIconButton(
          icon: const Icon(CupertinoIcons.back,
              color: ColorConstants.buttonColor),
          onPressed: () => Navigator.of(context).pop()),
      title: pageTitle,
      centerTitle: false,
    );
  }

  Container _resultContainer(
      {required BuildContext context, required String buttonText}) {
    return Container(
      alignment: Alignment.center,
      height: context.getSizeHeight(size: 0.05),
      width: context.getSizeWidth(size: 0.2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorConstants.bottomNavigationBarActiveColor),
      child: CustomText(text: buttonText, color: ColorConstants.whiteColor),
    );
  }
}
