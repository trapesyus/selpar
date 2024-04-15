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
        appBar: CustomAppBar(
          leading: CustomIconButton(
              icon: const Icon(CupertinoIcons.back,
                  color: ColorConstants.buttonColor),
              onPressed: () => Navigator.of(context).pop()),
          title: pageTitle,
          centerTitle: false,
        ),
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
                          Expanded(
                            child: CustomText(
                                text: 'Fatura Tipi:',
                                color: ColorConstants.defaultTextColor),
                          ),
                          Expanded(
                              child: CustomDropDownbutton(
                                  items: store.faturaItems)),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomText(
                                text: 'KDV Tipi:',
                                color: ColorConstants.defaultTextColor),
                          ),
                          Expanded(
                              child: CustomDropDownbutton(
                                  items: store.kdvTypeItems))
                        ],
                      )
                    ],
                  )
                : Row(
                    children: [
                      CustomText(
                              text: 'KDV Tipi:',
                              color: ColorConstants.defaultTextColor)
                          .getPaddingOnly(context: context, right: 0.02),
                      CustomDropDownbutton(items: store.kdvTypeItems)
                    ],
                  ),
            CustomTextField(
              controller: null,
              horizontalHeight: 0.04,
              verticalHeight: 0.01,
              sizeTop: 0.02,
              label: 'Vergi No',
              labelStyle: true,
            ),
            CustomTextField(
              controller: null,
              horizontalHeight: 0.04,
              verticalHeight: 0.01,
              label: 'Vergi Dairesi',
              labelStyle: true,
            ),
            CustomTextField(
              controller: null,
              horizontalHeight: 0.04,
              verticalHeight: 0.01,
              label: 'Adres',
              labelStyle: true,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomDropDownbutton(items: store.provinceItems),
                ),
                CustomDropDownbutton(items: store.districtItems)
              ],
            ).getPadding(context: context, sizeWidth: 0.04, sizeHeight: 0),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    controller: null,
                    horizontalHeight: 0.04,
                    verticalHeight: 0.01,
                    sizeTop: 0.02,
                    label: 'GSM',
                    labelStyle: true,
                  ).getPaddingOnly(context: context, right: 0.02),
                ),
                Expanded(
                  flex: 2,
                  child: CustomTextField(
                    controller: null,
                    horizontalHeight: 0.04,
                    verticalHeight: 0.01,
                    sizeTop: 0.02,
                    label: 'Telefon',
                    labelStyle: true,
                  ),
                ),
              ],
            ),
            CustomTextField(
              controller: null,
              horizontalHeight: 0.04,
              verticalHeight: 0.01,
              label: 'E-Mail',
              labelStyle: true,
            ),
            Row(
              children: [
                Expanded(
                    child: CustomTextField(
                  controller: null,
                  horizontalHeight: 0.04,
                  verticalHeight: 0.01,
                  label: 'Stok Numarası',
                  labelStyle: true,
                )),
                Container(
                        width: context.getSizeWidth(size: 0.16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: ColorConstants.buttonColor),
                        child: CustomIconButton(
                            icon: const Icon(CupertinoIcons.camera,
                                color: ColorConstants.whiteColor),
                            onPressed: () {}))
                    .getPaddingOnly(
                        context: context,
                        left: 0.02,
                        right: 0.02,
                        bottom: 0.01),
                CustomContainerButton(
                        buttonText: 'Ara', onTap: stokNumarasiSearchOnTap)
                    .getPaddingOnly(context: context, bottom: 0.01)
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: CustomTextField(
                  controller: null,
                  horizontalHeight: 0.04,
                  verticalHeight: 0.01,
                  label: 'Stok Adı',
                  labelStyle: true,
                )),
                CustomContainerButton(
                        buttonText: 'Ara', onTap: stokAdiSearchOnTap)
                    .getPaddingOnly(context: context, left: 0.02, bottom: 0.01)
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: CustomTextField(
                  controller: null,
                  horizontalHeight: 0.04,
                  verticalHeight: 0.01,
                  label: 'Miktar',
                  labelStyle: true,
                )),
                Expanded(
                    child: CustomTextField(
                  controller: null,
                  horizontalHeight: 0.04,
                  verticalHeight: 0.01,
                  sizeLeft: 0.02,
                  label: 'Fiyat',
                  labelStyle: true,
                )),
                Expanded(
                  child: CustomTextField(
                    controller: null,
                    horizontalHeight: 0.04,
                    verticalHeight: 0.01,
                    label: 'IST',
                    labelStyle: true,
                    sizeLeft: 0.02,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      CustomText(
                              text: 'KDV:',
                              color: ColorConstants.defaultTextColor)
                          .getPaddingOnly(
                              context: context, right: 0.02, left: 0.04),
                      CustomDropDownbutton(items: store.kdvCount)
                          .getPaddingOnly(context: context, right: 0.04),
                    ],
                  ),
                ),
                Expanded(child: CustomDropDownbutton(items: store.typeItems))
              ],
            ),
            CustomElevatedButton(buttonText: 'Ekle', onPressed: () {})
                .getPaddingOnly(context: context, bottom: 0.02, top: 0.02),
            Container(
              height: context.getSizeHeight(size: 0.14),
              decoration: const BoxDecoration(
                  color: ColorConstants.hintDarkContainerColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                          text: 'Toplam ',
                          fontSize: 16,
                          isBold: true,
                          color: ColorConstants.defaultTextColor)
                      .getPaddingOnly(
                          context: context,
                          bottom: 0.02,
                          top: 0.02,
                          left: 0.04),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        child: _resultContainer(
                                context: context, buttonText: 'Kaydet')
                            .getPaddingOnly(
                                context: context, right: 0.02, bottom: 0.02),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: context.getSizeHeight(size: 0.05),
                        width: context.getSizeWidth(size: 0.2),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: ColorConstants.hintContainerColor),
                        child: CustomText(
                            text: '00.00 ₺',
                            color: ColorConstants.defaultTextColor,
                            isBold: true),
                      ).getPaddingOnly(context: context, bottom: 0.02)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
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
