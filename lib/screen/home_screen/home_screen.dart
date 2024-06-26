import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:selpar/core/constants/color_constants.dart';
import 'package:selpar/core/constants/images_home_screen_constants.dart';
import 'package:selpar/core/extensions/navigate_effective_extension.dart';
import 'package:selpar/core/extensions/padding_extension.dart';
import 'package:selpar/core/extensions/size_extension.dart';
import 'package:selpar/core/widgets/icon_button_widget.dart';
import 'package:selpar/core/widgets/text_widget.dart';
import 'package:selpar/core/widgets/textfield_widget.dart';
import 'package:selpar/screen/home_screen/home_screen_model/home_screen_model.dart';
import 'package:selpar/screen/home_screen/subscreen/siparis_girisi/verilen_siparis_girisi/verilen_siparis_girisi.dart';
import 'package:selpar/screen/home_screen/subscreen/stok_ihtiyac_raporu/stok_ihtiyac_raporu.dart';
import 'package:selpar/screen/home_screen/subscreen/teklif/teklif.dart';
import 'package:selpar/screen/navigation_bar_items/buy_sell_screen/subscreen/alis_evrak_listesi/alis_evrak_listesi.dart';
import 'package:selpar/screen/navigation_bar_items/buy_sell_screen/subscreen/satis_evrak_listesi/satis_evrak_listesi.dart';
import 'package:selpar/screen/navigation_bar_items/finance_screen/subscreen/cari_listesi/cari_listesi.dart';
import 'package:selpar/screen/navigation_bar_items/finance_screen/subscreen/odeme_ekle/odeme_ekle.dart';
import 'package:selpar/screen/navigation_bar_items/order_screen/alinan_siparis_girisi/alinan_siparis_girisi.dart';
import 'package:selpar/screen/navigation_bar_items/stock_screen/subscreen/stok_listesi/stok_listesi.dart';
import 'package:selpar/service/language/language_service/language_service.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../navigation_bar_items/finance_screen/subscreen/tahsilat_ekle/tahsilat_ekle.dart';
import 'subscreen/cek_senet/alinan_cek_senet/alinan_cek_senet.dart';
import 'subscreen/cek_senet/verilen_cek_senet/verilen_cek_senet.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final HomeScreenModel _homeScreenModel = HomeScreenModel();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return _homeScreenModel.isSearching
          ? ListView(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              children: [
                _homeScreenSearch(),
                _homeScreenModel.pagesData.isNotEmpty
                    ? _onSearchResult(context)
                    : _onSearchNoResult()
              ],
            ).getPadding(context: context, sizeWidth: 0.02, sizeHeight: 0)
          : ListView(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              children: [
                _homeScreenSearch(),
                Observer(builder: (_) {
                  return _homeScreenModel.dataAdvert.isNotEmpty
                      ? _advert(context)
                      : const SizedBox();
                }).getPaddingOnly(context: context, bottom: 0.02),
                _walletContainer(
                    context: context,
                    height: 0.08,
                    content: '1000₺',
                    image: ImagesHomeScreenConstants.bakiye),
                _quickActionsMenuTitle()
                    .getPaddingOnly(context: context, bottom: 0.02, top: 0.02),
                _quickActionFirst(context)
                    .getPaddingOnly(context: context, bottom: 0.02),
                _quickActionSecond(context)
                    .getPaddingOnly(context: context, bottom: 0.02),
                _quickActionThird(context)
                    .getPaddingOnly(context: context, bottom: 0.02),
                _bankStatementContainer(
                        count: '24',
                        context: context,
                        title: LanguageService
                            .choosenLanguage['key']!.cariListesi!,
                        content: LanguageService.choosenLanguage['key']!
                            .cariListesiniGormekIcinTiklayin!,
                        image: ImagesHomeScreenConstants.cariListesi,
                        height: 0.12)
                    .getPaddingOnly(context: context, bottom: 0.02),
              ],
            ).getPadding(context: context, sizeWidth: 0.02, sizeHeight: 0);
    });
  }

  Row _quickActionThird(BuildContext context) => Row(
        children: [
          Expanded(
            child: _listContainer(
                    context: context,
                    image: ImagesHomeScreenConstants.stokIhtiyac,
                    text: LanguageService.choosenLanguage['key']!.stokIhtiyac ??
                        'Hata burası',
                    onPressed: () async => await StokIhtiyacRaporu()
                        .navigateEffectiveTo(context: context))
                .getPaddingOnly(context: context, right: 0.02),
          ),
          Expanded(
            child: _listContainer(
                    context: context,
                    image: ImagesHomeScreenConstants.siparis,
                    text: LanguageService.choosenLanguage['key']!.siparis!,
                    onPressed: () => _customShowDialog(
                        context: context,
                        title: LanguageService
                            .choosenLanguage['key']!.alinanVerilenSiparis!,
                        firstSubTitle: LanguageService
                            .choosenLanguage['key']!.verilenSiparisGirisi!,
                        firstOnTap: () async => await VerilenSiparisGirisi()
                            .navigateEffectiveTo(context: context),
                        secondSubtitle: LanguageService
                            .choosenLanguage['key']!.alinanSiparisGirisi!,
                        secondOnTap: () async => await AlinanSiparisGirisi()
                            .navigateEffectiveTo(context: context)))
                .getPaddingOnly(context: context, right: 0.02),
          ),
          Expanded(
            child: _listContainer(
                context: context,
                image: ImagesHomeScreenConstants.alisEvrakListesi,
                text: LanguageService.choosenLanguage['key']!.alisEvrakListesi!,
                onPressed: () async => await AlisEvrakListesi()
                    .navigateEffectiveTo(context: context)).getPaddingOnly(
                context: context, right: 0.02),
          ),
          Expanded(
            child: _listContainer(
                    context: context,
                    image: ImagesHomeScreenConstants.satisEvrakListesi,
                    text: LanguageService
                        .choosenLanguage['key']!.satisEvrakListesi!,
                    onPressed: () async => await SatisEvrakListesi()
                        .navigateEffectiveTo(context: context))
                .getPaddingOnly(context: context, right: 0.01),
          ),
        ],
      );

  Row _quickActionSecond(BuildContext context) => Row(
        children: [
          Expanded(
            child: _listContainer(
                    context: context,
                    image: ImagesHomeScreenConstants.gunuGelen,
                    text: LanguageService.choosenLanguage['key']!.gunuGelen!,
                    onPressed: () {})
                .getPaddingOnly(context: context, right: 0.02),
          ),
          Expanded(
            child: _listContainer(
                    context: context,
                    image: ImagesHomeScreenConstants.gunuGecen,
                    text: LanguageService.choosenLanguage['key']!.gunuGecen!,
                    onPressed: () {})
                .getPaddingOnly(context: context, right: 0.02),
          ),
          Expanded(
            child: _listContainer(
                    context: context,
                    image: ImagesHomeScreenConstants.teklif,
                    text: LanguageService.choosenLanguage['key']!.teklif!,
                    onPressed: () async =>
                        await Teklif().navigateEffectiveTo(context: context))
                .getPaddingOnly(context: context, right: 0.02),
          ),
          Expanded(
            child: _listContainer(
                    context: context,
                    image: ImagesHomeScreenConstants.stok,
                    text: LanguageService.choosenLanguage['key']!.stok!,
                    onPressed: () async => await const StokListesi()
                        .navigateEffectiveTo(context: context))
                .getPaddingOnly(context: context, right: 0.02),
          ),
        ],
      );

  Row _quickActionFirst(BuildContext context) => Row(
        children: [
          Expanded(
            child: _listContainer(
                    context: context,
                    image: ImagesHomeScreenConstants.tahsilatEkle,
                    text: LanguageService.choosenLanguage['key']!.tahsilatEkle!,
                    onPressed: () async => await TahsilatEkle()
                        .navigateEffectiveTo(context: context))
                .getPaddingOnly(context: context, right: 0.02),
          ),
          Expanded(
            child: _listContainer(
                    context: context,
                    image: ImagesHomeScreenConstants.odemeEkle,
                    text: LanguageService.choosenLanguage['key']!.odemeEkle!,
                    onPressed: () async =>
                        await OdemeEkle().navigateEffectiveTo(context: context))
                .getPaddingOnly(context: context, right: 0.02),
          ),
          Expanded(
            child: _listContainer(
                context: context,
                image: ImagesHomeScreenConstants.cekSenet,
                text: LanguageService.choosenLanguage['key']!.cekSenet!,
                onPressed: () => _customShowDialog(
                      context: context,
                      title: LanguageService
                          .choosenLanguage['key']!.alinanVerilenCekSenet!,
                      firstSubTitle: LanguageService
                          .choosenLanguage['key']!.verilenCekSenet!,
                      firstOnTap: () async => await VerilenCekSenet()
                          .navigateEffectiveTo(context: context),
                      secondSubtitle: LanguageService
                          .choosenLanguage['key']!.alinanCekSenet!,
                      secondOnTap: () async => await AlinanCekSenet()
                          .navigateEffectiveTo(context: context),
                    )).getPaddingOnly(context: context, right: 0.02),
          ),
          Expanded(
            child: _listContainer(
                    context: context,
                    image: ImagesHomeScreenConstants.satisGiris,
                    text: LanguageService.choosenLanguage['key']!.satisGiris!,
                    onPressed: () {})
                .getPaddingOnly(context: context, right: 0.02),
          ),
        ],
      );

  CustomText _quickActionsMenuTitle() => CustomText(
      text: LanguageService.choosenLanguage['key']!.hizliIslemMenusu!,
      color: ColorConstants.defaultTextColor,
      fontSize: 18);

  CarouselSlider _advert(BuildContext context) => CarouselSlider(
        options: CarouselOptions(
            height: context.getSizeHeight(size: 0.2),
            aspectRatio: 16 / 9,
            viewportFraction: 0.8,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastLinearToSlowEaseIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            onPageChanged: (index, reason) {},
            scrollDirection: Axis.horizontal),
        items: [
          for (int i = 0; i < _homeScreenModel.dataAdvert.length; i++)
            Image.network(_homeScreenModel.dataAdvert[i])
        ],
      );

  CustomText _onSearchNoResult() => CustomText(
      isMaxLines: true,
      text: 'Yanlış yazdınız ya da aradığınız sayfa mevcut değil',
      color: ColorConstants.bgColor);

  SizedBox _onSearchResult(BuildContext context) => SizedBox(
        height: context.getSizeHeight(size: 0.8),
        child: ListView.separated(
          itemCount: _homeScreenModel.pagesData.length,
          separatorBuilder: (context, index) => SizedBox(
            height: context.getSizeHeight(size: 0.02),
          ),
          itemBuilder: (context, index) => Container(
            color: ColorConstants.hintDarkContainerColor,
            child: ListTile(
              title: CustomText(
                  text: _homeScreenModel.pagesData[index],
                  color: ColorConstants.bgColor),
              trailing: CustomIconButton(
                  icon: const Icon(CupertinoIcons.forward,
                      color: ColorConstants.buttonColor),
                  onPressed: () async =>
                      await _homeScreenModel.navigateToSerachinPage(
                          _homeScreenModel.pagesData[index], context)),
            ),
          ),
        ),
      );

  Future<dynamic> _customShowDialog(
          {required BuildContext context,
          required String title,
          required String firstSubTitle,
          required Function() firstOnTap,
          required String secondSubtitle,
          required Function() secondOnTap}) =>
      showDialog(
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
                      Expanded(
                          child: CustomText(
                              text: title, color: ColorConstants.bgColor)),
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

  GestureDetector _alinanVerilenCekSenetPageButton(
          {required BuildContext context,
          required Function() onTap,
          required bool isAlinan,
          required String pageButtonText}) =>
      GestureDetector(
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
              color: isAlinan
                  ? ColorConstants.bgColor
                  : ColorConstants.whiteColor),
        ),
      );

  CustomTextField _homeScreenSearch() => CustomTextField(
        controller: _homeScreenModel.pageSearchController,
        sizeBottom: 0.02,
        sizeTop: 0.02,
        verticalHeight: 0.01,
        horizontalHeight: 0.02,
        isIcon: true,
        isIconTap: true,
        isIconOnTap: () => _homeScreenModel.pageSearchOperation(
            pageSearchControllerValue:
                _homeScreenModel.pageSearchController.value.text),
        label: LanguageService.choosenLanguage['key']!.basliklardaAra!,
        labelStyle: true,
      );

  GestureDetector _bankStatementContainer(
          {required BuildContext context,
          required double height,
          required String content,
          required String count,
          required String title,
          required String image}) =>
      GestureDetector(
        onTap: () => CariListesi().navigateEffectiveTo(context: context),
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
                    Expanded(
                      flex: 2,
                      child: CustomText(
                              isMaxLines: true,
                              text: content,
                              color: ColorConstants.defaultTextColor,
                              fontSize: 12,
                              isBold: true)
                          .getPaddingOnly(context: context, left: 0.02),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(image,
                              scale: 12.0,
                              filterQuality: FilterQuality.high,
                              fit: BoxFit.cover),
                          CustomText(
                              text:
                                  '$count ${LanguageService.choosenLanguage['key']!.adet!}',
                              color: ColorConstants.defaultTextColor,
                              isBold: true,
                              fontSize: 12),
                        ],
                      ).getPaddingOnly(context: context, top: 0.01),
                    ),
                  ],
                )),
          ],
        ),
      );

  Column _walletContainer(
          {required BuildContext context,
          required double height,
          required String content,
          required String image}) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
                  text: LanguageService.choosenLanguage['key']!.hesapOzeti!,
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
                          scale: 12.0,
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.cover)
                      .getPaddingOnly(context: context, left: 0.02),
                  CustomText(
                      text:
                          '${LanguageService.choosenLanguage['key']!.bakiye!} $content',
                      color: ColorConstants.defaultTextColor,
                      fontSize: 12,
                      isBold: true),
                  const SizedBox()
                ],
              )),
        ],
      );

  GestureDetector _listContainer(
          {required String text,
          required String image,
          required BuildContext context,
          required Function() onPressed}) =>
      GestureDetector(
        onTap: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: context.getSizeHeight(size: 0.08),
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
