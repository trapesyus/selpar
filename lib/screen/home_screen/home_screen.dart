import 'package:flutter/material.dart';
import 'package:selpar/core/constants/color_constants.dart';
import 'package:selpar/core/constants/images_home_screen_constants.dart';
import 'package:selpar/core/extensions/navigate_effective_extension.dart';
import 'package:selpar/core/extensions/padding_extension.dart';
import 'package:selpar/core/extensions/size_extension.dart';
import 'package:selpar/core/widgets/icon_button_widget.dart';
import 'package:selpar/core/widgets/text_widget.dart';
import 'package:selpar/core/widgets/textfield_widget.dart';
import 'package:selpar/screen/home_screen/subscreen/siparis_girisi/verilen_siparis_girisi/verilen_siparis_girisi.dart';
import 'package:selpar/screen/home_screen/subscreen/stok_ihtiyac_raporu/stok_ihtiyac_raporu.dart';
import 'package:selpar/screen/home_screen/subscreen/teklif/teklif.dart';
import 'package:selpar/screen/navigation_bar_items/finance_screen/subscreen/cari_listesi/cari_listesi.dart';
import 'package:selpar/screen/navigation_bar_items/finance_screen/subscreen/odeme_ekle/odeme_ekle.dart';
import 'package:selpar/screen/navigation_bar_items/order_screen/alinan_siparis_girisi/alinan_siparis_girisi.dart';
import 'package:selpar/screen/navigation_bar_items/stock_screen/subscreen/stok_listesi/stok_listesi.dart';

import '../navigation_bar_items/finance_screen/subscreen/tahsilat_ekle/tahsilat_ekle.dart';
import 'subscreen/cek_senet/alinan_cek_senet/alinan_cek_senet.dart';
import 'subscreen/cek_senet/verilen_cek_senet/verilen_cek_senet.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      children: [
        _homeScreenSearch(),
        _walletContainer(
            context: context,
            height: 0.08,
            content: '1000₺',
            title: 'Banka:',
            image: ImagesHomeScreenConstants.imageBank),
        CustomText(
                text: 'Hızlı İşlem Menüsü',
                color: ColorConstants.defaultTextColor,
                fontSize: 18)
            .getPaddingOnly(context: context, bottom: 0.02, top: 0.04),
        Row(
          children: [
            Expanded(
              child: _listContainer(
                      context: context,
                      image: ImagesHomeScreenConstants.tahsilatEkle,
                      text: 'Tahsilat Ekle',
                      onPressed: () async => await TahsilatEkle()
                          .navigateEffectiveTo(context: context))
                  .getPaddingOnly(context: context, right: 0.02),
            ),
            Expanded(
              child: _listContainer(
                      context: context,
                      image: ImagesHomeScreenConstants.odemeEkle,
                      text: 'Ödeme Ekle',
                      onPressed: () async => await OdemeEkle()
                          .navigateEffectiveTo(context: context))
                  .getPaddingOnly(context: context, right: 0.02),
            ),
            Expanded(
              child: _listContainer(
                  context: context,
                  image: ImagesHomeScreenConstants.cekSenet,
                  text: 'Çek - Senet',
                  onPressed: () => _customShowDialog(
                        context: context,
                        title: 'Alınan / Verilen Çek-Senet',
                        firstSubTitle: 'Verilen Çek-Senet',
                        firstOnTap: () async => await VerilenCekSenet()
                            .navigateEffectiveTo(context: context),
                        secondSubtitle: 'Alınan Çek-Senet',
                        secondOnTap: () async => await AlinanCekSenet()
                            .navigateEffectiveTo(context: context),
                      )).getPaddingOnly(context: context, right: 0.02),
            ),
            Expanded(
              child: _listContainer(
                      context: context,
                      image: ImagesHomeScreenConstants.satisGiris,
                      text: 'Satış Giriş',
                      onPressed: () {})
                  .getPaddingOnly(context: context, right: 0.02),
            ),
            Expanded(
              child: _listContainer(
                      context: context,
                      image: ImagesHomeScreenConstants.gunuGelen,
                      text: 'Günü Gelen',
                      onPressed: () {})
                  .getPaddingOnly(context: context, right: 0.02),
            ),
          ],
        ).getPaddingOnly(context: context, bottom: 0.02),
        Row(
          children: [
            Expanded(
              child: _listContainer(
                      context: context,
                      image: ImagesHomeScreenConstants.imageOverdue,
                      text: 'Günü Geçen',
                      onPressed: () {})
                  .getPaddingOnly(context: context, right: 0.02),
            ),
            Expanded(
              child: _listContainer(
                      context: context,
                      image: ImagesHomeScreenConstants.imageOffer,
                      text: 'Teklif',
                      onPressed: () async =>
                          await Teklif().navigateEffectiveTo(context: context))
                  .getPaddingOnly(context: context, right: 0.02),
            ),
            Expanded(
              child: _listContainer(
                      context: context,
                      image: ImagesHomeScreenConstants.imageStock,
                      text: 'Stok',
                      onPressed: () async => await const StokListesi()
                          .navigateEffectiveTo(context: context))
                  .getPaddingOnly(context: context, right: 0.02),
            ),
            Expanded(
              child: _listContainer(
                      context: context,
                      image: ImagesHomeScreenConstants.imageStockNeed,
                      text: 'Stok İhtiyaç',
                      onPressed: () async => await StokIhtiyacRaporu()
                          .navigateEffectiveTo(context: context))
                  .getPaddingOnly(context: context, right: 0.02),
            ),
            Expanded(
              child: _listContainer(
                      context: context,
                      image: ImagesHomeScreenConstants.imageOrder,
                      text: 'Sipariş',
                      onPressed: () => _customShowDialog(
                          context: context,
                          title: 'Alınan / Verilen Sipariş',
                          firstSubTitle: 'Verilen Sipariş Girişi',
                          firstOnTap: () async => await VerilenSiparisGirisi()
                              .navigateEffectiveTo(context: context),
                          secondSubtitle: 'Alınan Sipariş Girişi',
                          secondOnTap: () async => await AlinanSiparisGirisi()
                              .navigateEffectiveTo(context: context)))
                  .getPaddingOnly(context: context, right: 0.02),
            ),
          ],
        ).getPaddingOnly(context: context, bottom: 0.04),
        _bankStatementContainer(
                count: '24',
                context: context,
                title: 'Cari Listesi (Hesap Ekstresi)',
                content: 'Cari Listesini görmek için tıklayın..',
                image: ImagesHomeScreenConstants.cariListe,
                height: 0.12)
            .getPaddingOnly(context: context, bottom: 0.02),
      ],
    ).getPadding(context: context, sizeWidth: 0.02, sizeHeight: 0);
  }

  Future<dynamic> _customShowDialog(
      {required BuildContext context,
      required String title,
      required String firstSubTitle,
      required Function() firstOnTap,
      required String secondSubtitle,
      required Function() secondOnTap}) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: ColorConstants.whiteColor,
        elevation: 0,
        actions: [
          SizedBox(
            height: context.getSizeHeight(size: 0.4),
            width: context.getSizeWidth(size: 0.8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(),
                    CustomText(text: title, color: ColorConstants.bgColor),
                    CustomIconButton(
                        icon: const Icon(Icons.close,
                            color: ColorConstants.bgColor),
                        onPressed: () => Navigator.of(context).pop())
                  ],
                ).getPaddingOnly(context: context, top: 0.02, bottom: 0.04),
                _alinanVerilenCekSenetPageButton(
                  isAlinan: true,
                  context: context,
                  pageButtonText: firstSubTitle,
                  onTap: firstOnTap,
                ).getPaddingOnly(context: context, bottom: 0.04),
                _alinanVerilenCekSenetPageButton(
                    isAlinan: false,
                    context: context,
                    pageButtonText: secondSubtitle,
                    onTap: secondOnTap)
              ],
            ),
          )
        ],
      ),
    );
  }

  GestureDetector _alinanVerilenCekSenetPageButton(
      {required BuildContext context,
      required Function() onTap,
      required bool isAlinan,
      required String pageButtonText}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: isAlinan
                ? ColorConstants.hintDarkContainerColor
                : ColorConstants.buttonColor,
            borderRadius: BorderRadius.circular(10)),
        height: context.getSizeHeight(size: 0.1),
        child: CustomText(
            text: pageButtonText,
            color:
                isAlinan ? ColorConstants.bgColor : ColorConstants.whiteColor),
      ),
    );
  }

  CustomTextField _homeScreenSearch() {
    return CustomTextField(
      sizeBottom: 0.04,
      sizeTop: 0.02,
      verticalHeight: 0.01,
      horizontalHeight: 0.02,
      isIcon: true,
      isIconTap: true,
      isIconOnTap: () {},
      controller: null,
      label: 'Başlıklarda ara',
      labelStyle: true,
    );
  }

  GestureDetector _bankStatementContainer(
      {required BuildContext context,
      required double height,
      required String content,
      required String count,
      required String title,
      required String image}) {
    return GestureDetector(
      onTap: () => const CariListesi().navigateEffectiveTo(context: context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
                  text: title,
                  color: ColorConstants.defaultTextColor,
                  isBold: false,
                  fontSize: 18)
              .getPaddingOnly(context: context, bottom: 0.02),
          Container(
              height: context.getSizeHeight(size: height),
              width: context.getSizeWidth(size: 0.96),
              padding: EdgeInsets.symmetric(
                  vertical: context.getSizeHeight(size: 0.01),
                  horizontal: context.getSizeWidth(size: 0.02)),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ColorConstants.hintDarkContainerColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  CustomText(
                      text: content,
                      color: ColorConstants.defaultTextColor,
                      fontSize: 12,
                      isBold: true),
                  Column(
                    children: [
                      Image.asset(image,
                          filterQuality: FilterQuality.high, fit: BoxFit.cover),
                      CustomText(
                          text: '$count Adet',
                          color: ColorConstants.defaultTextColor,
                          isBold: true,
                          fontSize: 12),
                    ],
                  ),
                ],
              )),
        ],
      ),
    );
  }

  Column _walletContainer(
      {required BuildContext context,
      required double height,
      required String content,
      required String title,
      required String image}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
                text: 'Hesap Özeti',
                color: ColorConstants.defaultTextColor,
                fontSize: 18)
            .getPaddingOnly(context: context, bottom: 0.02),
        Container(
            height: context.getSizeHeight(size: height),
            width: context.getSizeWidth(size: 0.96),
            padding: EdgeInsets.symmetric(
                horizontal: context.getSizeWidth(size: 0.02)),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorConstants.hintDarkContainerColor),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(image,
                        filterQuality: FilterQuality.high, fit: BoxFit.cover)
                    .getPaddingOnly(context: context, left: 0.02),
                CustomText(
                    text: 'Hesabınızda $content Bakiye bulunmakta',
                    color: ColorConstants.defaultTextColor,
                    fontSize: 12,
                    isBold: true),
                const SizedBox()
              ],
            )),
      ],
    );
  }

  GestureDetector _listContainer(
      {required String text,
      required String image,
      required BuildContext context,
      required Function() onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: context.getSizeHeight(size: 0.06),
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
                vertical: context.getSizeHeight(size: 0.01),
                horizontal: context.getSizeWidth(size: 0.01)),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorConstants.hintDarkContainerColor),
            child: Image.asset(image,
                scale: 1.0,
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high),
          ).getPaddingOnly(context: context, bottom: 0.01),
          GestureDetector(
            onTap: onPressed,
            child: CustomText(
              text: text,
              color: ColorConstants.defaultTextColor,
              fontSize: 9,
              isBold: true,
            ),
          )
        ],
      ),
    );
  }
}
