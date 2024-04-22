import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:selpar/core/constants/color_constants.dart';
import 'package:selpar/core/extensions/navigate_effective_extension.dart';
import 'package:selpar/core/extensions/padding_extension.dart';
import 'package:selpar/core/extensions/size_extension.dart';
import 'package:selpar/core/helper/custom_progress_lottie/custom_progress_lottie.dart';
import 'package:selpar/core/widgets/appbar_widget.dart';
import 'package:selpar/core/widgets/bottom_navbar_widget/bottom_navbar_widget_model/bottom_navbar_widget_model.dart';
import 'package:selpar/core/widgets/icon_button_widget.dart';
import 'package:selpar/core/widgets/label_text_widget.dart';
import 'package:selpar/core/widgets/text_widget.dart';
import 'package:selpar/screen/bottom_navbar_end_drawer_subscreen/hesap_screen.dart';
import 'package:selpar/screen/bottom_navbar_widget_subscreen/bottom_navbar_cari_listesi/bottom_navbar_cari_listesi.dart';
import 'package:selpar/screen/bottom_navbar_widget_subscreen/bottom_navbar_kapali_onarimlar/bottom_navbar_kapali_onarimlar.dart';
import 'package:selpar/screen/bottom_navbar_widget_subscreen/bottom_navbar_kart/bottom_navbar_kart.dart';
import 'package:selpar/screen/home_screen/subscreen/siparis_girisi/alinan_siparis_girisi/alinan_siparis_girisi.dart';
import 'package:selpar/screen/home_screen/subscreen/siparis_girisi/verilen_siparis_girisi/verilen_siparis_girisi.dart';
import 'package:selpar/screen/language_screen/language_screen.dart';
import 'package:selpar/screen/navigation_bar_items/buy_sell_screen/subscreen/alis_evrak_listesi/alis_evrak_listesi.dart';
import 'package:selpar/screen/navigation_bar_items/buy_sell_screen/subscreen/alis_islemi/alis_islemi.dart';
import 'package:selpar/screen/navigation_bar_items/buy_sell_screen/subscreen/satis_evrak_listesi/satis_evrak_listesi.dart';
import 'package:selpar/screen/navigation_bar_items/buy_sell_screen/subscreen/satis_islemi/satis_islemi.dart';
import 'package:selpar/screen/home_screen/home_screen.dart';
import 'package:selpar/screen/navigation_bar_items/finance_screen/subscreen/cari_listesi/cari_listesi.dart';
import 'package:selpar/screen/navigation_bar_items/finance_screen/subscreen/odeme_ekle/odeme_ekle.dart';
import 'package:selpar/screen/navigation_bar_items/finance_screen/subscreen/odeme_listesi/odeme_listesi.dart';
import 'package:selpar/screen/navigation_bar_items/finance_screen/subscreen/tahsilat_ekle/tahsilat_ekle.dart';
import 'package:selpar/screen/navigation_bar_items/finance_screen/subscreen/tahsilat_listesi/tahsilat_listesi.dart';
import 'package:selpar/screen/navigation_bar_items/online_operation_screen/subscreen/gelen_fatura/gelen_fatura.dart';
import 'package:selpar/screen/navigation_bar_items/online_operation_screen/subscreen/giden_fatura/giden_fatura.dart';
import 'package:selpar/screen/navigation_bar_items/vehicle_screen/subscreen/%C3%B6nceki_onarimlar/%C3%B6nceki_onarimlar.dart';
import 'package:selpar/screen/navigation_bar_items/vehicle_screen/subscreen/kapali_onarimlar/kapali_onarimlar.dart';
import 'package:selpar/screen/navigation_bar_items/vehicle_screen/subscreen/silinen_kabul_listesi/silinen_kabul_listesi.dart';
import 'package:selpar/screen/navigation_bar_items/vehicle_screen/subscreen/tahsilati_yapilmayan_onarimlar/tahsilati_yapilmayan_onarimlar.dart';
import 'package:selpar/service/language/language_service/language_service.dart';

import '../../../screen/bottom_navbar_widget_subscreen/bottom_navbar_stok/bottom_navbar_stok.dart';
import '../../../screen/navigation_bar_items/stock_screen/subscreen/stok_listesi/stok_listesi.dart';

class BottomNavbarWidget extends StatelessWidget {
  BottomNavbarWidget({super.key}) {
    reaction((_) async => await _bottomNavbarWidgetModel.initialize(), (_) {});
  }
  final BottomNavbarWidgetModel _bottomNavbarWidgetModel =
      BottomNavbarWidgetModel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Observer(builder: (context) {
      return _bottomNavbarWidgetModel.isInitializeLanguage
          ? Scaffold(
              resizeToAvoidBottomInset: false,
              drawer: Drawer(
                backgroundColor: ColorConstants.whiteColor,
                elevation: 0,
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    const DrawerHeader(
                      child: CircleAvatar(),
                    ),
                    ExpansionTile(
                      title: Row(
                        children: [
                          const Icon(
                            CupertinoIcons.car,
                            color: ColorConstants.taskTextColor,
                          ).getPaddingOnly(context: context, right: 0.02),
                          Expanded(
                            child: CustomLabelText(
                              label: LanguageService
                                  .choosenLanguage['key']!.servisIslemleri!,
                              isColorNotWhite: true,
                            ),
                          ),
                        ],
                      ),
                      children: [
                        _drawerListTile(
                          context: context,
                          subTitle: LanguageService
                              .choosenLanguage['key']!.kapaliOnarimlar!,
                          onTap: () async => await const KapaliOnarimlar()
                              .navigateEffectiveTo(context: context),
                        ),
                        _drawerListTile(
                          context: context,
                          subTitle: LanguageService.choosenLanguage['key']!
                              .tahsilatiYapilmayanOnarimlar!,
                          onTap: () async =>
                              await TahsilatiYapilmayanOnarimlar()
                                  .navigateEffectiveTo(context: context),
                        ),
                        _drawerListTile(
                          context: context,
                          subTitle: LanguageService
                              .choosenLanguage['key']!.oncekiOnarimlar!,
                          onTap: () async => await const OncekiOnarimlar()
                              .navigateEffectiveTo(context: context),
                        ),
                        _drawerListTile(
                          context: context,
                          subTitle: LanguageService
                              .choosenLanguage['key']!.silinenKabulListesi!,
                          onTap: () async => await SilinenKabulListesi()
                              .navigateEffectiveTo(context: context),
                        ),
                      ],
                    ),
                    ExpansionTile(
                      title: Row(
                        children: [
                          const Icon(
                            CupertinoIcons.money_dollar,
                            color: ColorConstants.taskTextColor,
                          ).getPaddingOnly(context: context, right: 0.02),
                          Expanded(
                            child: CustomLabelText(
                                label: LanguageService
                                    .choosenLanguage['key']!.finansIslemleri!,
                                isColorNotWhite: true),
                          ),
                        ],
                      ),
                      children: [
                        _drawerListTile(
                            context: context,
                            subTitle: LanguageService
                                .choosenLanguage['key']!.cariListesi!,
                            onTap: () async => await CariListesi()
                                .navigateEffectiveTo(context: context)),
                        _drawerListTile(
                            context: context,
                            subTitle: LanguageService
                                .choosenLanguage['key']!.tahsilatEkle!,
                            onTap: () async => await TahsilatEkle()
                                .navigateEffectiveTo(context: context)),
                        _drawerListTile(
                            context: context,
                            subTitle: LanguageService
                                .choosenLanguage['key']!.tahsilatListesi!,
                            onTap: () async => await TahsilatListesi()
                                .navigateEffectiveTo(context: context)),
                        _drawerListTile(
                            context: context,
                            subTitle: LanguageService.choosenLanguage['key']!
                                .bugunYapilacakTahsilatlar!,
                            onTap: () {}),
                        _drawerListTile(
                            context: context,
                            subTitle: LanguageService
                                .choosenLanguage['key']!.odemeEkle!,
                            onTap: () async => await OdemeEkle()
                                .navigateEffectiveTo(context: context)),
                        _drawerListTile(
                            context: context,
                            subTitle: LanguageService
                                .choosenLanguage['key']!.odemeListesi!,
                            onTap: () async => await OdemeListesi()
                                .navigateEffectiveTo(context: context)),
                        _drawerListTile(
                            context: context,
                            subTitle: LanguageService.choosenLanguage['key']!
                                .bugunYapilacakOdemeler!,
                            onTap: () {}),
                        _drawerListTile(
                            context: context,
                            subTitle: LanguageService.choosenLanguage['key']!
                                .butunAlacaklarOdemeler!,
                            onTap: () {})
                      ],
                    ),
                    ExpansionTile(
                      title: Row(
                        children: [
                          const Icon(
                            CupertinoIcons.collections_solid,
                            color: ColorConstants.taskTextColor,
                          ).getPaddingOnly(context: context, right: 0.02),
                          Expanded(
                            child: CustomLabelText(
                                label: LanguageService
                                    .choosenLanguage['key']!.stokIslemleri!,
                                isColorNotWhite: true),
                          ),
                        ],
                      ),
                      children: [
                        _drawerListTile(
                            context: context,
                            subTitle: LanguageService
                                .choosenLanguage['key']!.stokListesi!,
                            onTap: () async => await const StokListesi()
                                .navigateEffectiveTo(context: context)),
                        _drawerListTile(
                            context: context,
                            subTitle: LanguageService
                                .choosenLanguage['key']!.orjinalStokListesi!,
                            onTap: () async => await const StokListesi()
                                .navigateEffectiveTo(context: context)),
                      ],
                    ),
                    ExpansionTile(
                      title: Row(
                        children: [
                          const Icon(
                            CupertinoIcons.cart_fill,
                            color: ColorConstants.taskTextColor,
                          ).getPaddingOnly(context: context, right: 0.02),
                          Expanded(
                            child: CustomLabelText(
                                label: LanguageService.choosenLanguage['key']!
                                    .alimSatimIslemleri!,
                                isColorNotWhite: true),
                          ),
                        ],
                      ),
                      children: [
                        _drawerListTile(
                            context: context,
                            subTitle: LanguageService
                                .choosenLanguage['key']!.satisIslemi!,
                            onTap: () async => await SatisIslemi()
                                .navigateEffectiveTo(context: context)),
                        _drawerListTile(
                            context: context,
                            subTitle: LanguageService
                                .choosenLanguage['key']!.alisIslemi!,
                            onTap: () async => await AlisIslemi()
                                .navigateEffectiveTo(context: context)),
                        _drawerListTile(
                            context: context,
                            subTitle: LanguageService
                                .choosenLanguage['key']!.satisEvrakListesi!,
                            onTap: () async => await SatisEvrakListesi()
                                .navigateEffectiveTo(context: context)),
                        _drawerListTile(
                            context: context,
                            subTitle: LanguageService
                                .choosenLanguage['key']!.alisEvrakListesi!,
                            onTap: () async => await AlisEvrakListesi()
                                .navigateEffectiveTo(context: context))
                      ],
                    ),
                    ExpansionTile(
                      title: Row(
                        children: [
                          const Icon(
                            Icons.wifi_protected_setup_sharp,
                            color: ColorConstants.taskTextColor,
                          ).getPaddingOnly(context: context, right: 0.02),
                          Expanded(
                            child: CustomLabelText(
                                label: LanguageService
                                    .choosenLanguage['key']!.eIslemler!,
                                isColorNotWhite: true),
                          ),
                        ],
                      ),
                      children: [
                        _drawerListTile(
                            context: context,
                            subTitle: LanguageService
                                .choosenLanguage['key']!.gelenFatura!,
                            onTap: () async => await const GelenFatura()
                                .navigateEffectiveTo(context: context)),
                        _drawerListTile(
                            context: context,
                            subTitle: LanguageService
                                .choosenLanguage['key']!.gidenFatura!,
                            onTap: () async => await const GidenFatura()
                                .navigateEffectiveTo(context: context)),
                        _drawerListTile(
                            context: context,
                            subTitle: LanguageService
                                .choosenLanguage['key']!.gidenEIrsaliye!,
                            onTap: () {})
                      ],
                    ),
                    ExpansionTile(
                      title: Row(
                        children: [
                          const Icon(
                            Icons.e_mobiledata,
                            color: ColorConstants.taskTextColor,
                          ).getPaddingOnly(context: context, right: 0.02),
                          Expanded(
                            child: CustomLabelText(
                                label: LanguageService
                                    .choosenLanguage['key']!.siparisIslemleri!,
                                isColorNotWhite: true),
                          ),
                        ],
                      ),
                      children: [
                        _drawerListTile(
                            context: context,
                            subTitle: LanguageService
                                .choosenLanguage['key']!.alinanSiparisGirisi!,
                            onTap: () async => await AlinanSiparisGirisi()
                                .navigateEffectiveTo(context: context)),
                        _drawerListTile(
                            context: context,
                            subTitle: LanguageService
                                .choosenLanguage['key']!.verilenSiparisGirisi!,
                            onTap: () async => await VerilenSiparisGirisi()
                                .navigateEffectiveTo(context: context)),
                        _drawerListTile(
                            context: context,
                            subTitle: LanguageService
                                .choosenLanguage['key']!.alinanSiparisListesi!,
                            onTap: () {}),
                        _drawerListTile(
                            context: context,
                            subTitle: LanguageService
                                .choosenLanguage['key']!.verilenSiparisListesi!,
                            onTap: () {})
                      ],
                    )
                  ],
                ),
              ),
              endDrawer: Drawer(
                backgroundColor: ColorConstants.whiteColor,
                elevation: 0,
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    const DrawerHeader(child: CircleAvatar()),
                    ListTile(
                      title: Row(
                        children: [
                          const Icon(
                            CupertinoIcons.person,
                            color: ColorConstants.taskTextColor,
                          ).getPaddingOnly(context: context, right: 0.02),
                          CustomLabelText(
                            label: 'Hesap',
                            isColorNotWhite: true,
                          )
                        ],
                      ),
                      onTap: () async => await const HesapScreen()
                          .navigateEffectiveTo(context: context),
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          const Icon(
                            Icons.language,
                            color: ColorConstants.taskTextColor,
                          ).getPaddingOnly(context: context, right: 0.02),
                          CustomLabelText(
                            label: 'Dil',
                            isColorNotWhite: true,
                          )
                        ],
                      ),
                      onTap: () async =>
                          await LanguageScreen(isPreloadingScreen: false)
                              .navigateEffectiveTo(context: context),
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          const Icon(
                            CupertinoIcons.square_arrow_left,
                            color: ColorConstants.taskTextColor,
                          ).getPaddingOnly(context: context, right: 0.02),
                          CustomLabelText(
                            label: 'Çıkış Yap',
                            isColorNotWhite: true,
                          )
                        ],
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              floatingActionButton: Observer(builder: (_) {
                return FloatingActionButton(
                  isExtended: true,
                  heroTag: 'homeScreen',
                  shape: const CircleBorder(),
                  backgroundColor:
                      ColorConstants.bottomNavigationBarActiveColor,
                  onPressed: () => _bottomNavbarWidgetModel.setIndex(0),
                  child: Icon(CupertinoIcons.home,
                      color: _bottomNavbarWidgetModel.currentIndex == 0
                          ? ColorConstants.whiteColor
                          : ColorConstants.bottomNavigationBarInactiveColor),
                );
              }),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              appBar: CustomAppBar(
                  title: 'Selpar',
                  leading: Builder(builder: (context) {
                    return CustomIconButton(
                        icon: const Icon(CupertinoIcons.list_bullet,
                            color: ColorConstants.bgColor),
                        onPressed: () => Scaffold.of(context).openDrawer());
                  }),
                  centerTitle: true,
                  actions: [
                    Builder(builder: (context) {
                      return CustomIconButton(
                          icon: const Icon(CupertinoIcons.person,
                              color: ColorConstants.bgColor),
                          onPressed: () =>
                              Scaffold.of(context).openEndDrawer());
                    })
                  ]),
              bottomNavigationBar: Observer(builder: (_) {
                return BottomAppBar(
                    padding: EdgeInsets.symmetric(
                        horizontal: context.getSizeWidth(size: 0.02)),
                    height: context.getSizeHeight(size: 0.07),
                    color: ColorConstants.bottomNavigationBarActiveColor,
                    shape: const CircularNotchedRectangle(),
                    notchMargin: 5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _bottomNavbarIcon(
                                  context: context,
                                  icon: CupertinoIcons.creditcard_fill,
                                  index: 1,
                                  onTap: () {
                                    _bottomNavbarWidgetModel.setIndex(1);
                                  }),
                              _bottomNavbarIcon(
                                  context: context,
                                  icon: CupertinoIcons.doc_person_fill,
                                  index: 2,
                                  onTap: () {
                                    _bottomNavbarWidgetModel.setIndex(2);
                                  }),
                            ],
                          ).getPaddingOnly(
                              context: context, left: 0.04, right: 0.14),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _bottomNavbarIcon(
                                  context: context,
                                  icon: Icons.car_repair,
                                  index: 3,
                                  onTap: () {
                                    _bottomNavbarWidgetModel.setIndex(3);
                                  }),
                              _bottomNavbarIcon(
                                  context: context,
                                  icon: CupertinoIcons.search,
                                  index: 4,
                                  onTap: () {
                                    _bottomNavbarWidgetModel.setIndex(4);
                                  })
                            ],
                          ).getPaddingOnly(
                              context: context, right: 0.04, left: 0.14),
                        ),
                      ],
                    ));
              }),
              body: Observer(builder: (context) {
                switch (_bottomNavbarWidgetModel.currentIndex) {
                  case 0:
                    return HomeScreen();
                  case 1:
                    return BottomNavbarKart();
                  case 2:
                    return const BottomNavbarCariListesi();
                  case 3:
                    return const BottomNavBarKapaliOnarimlar();
                  case 4:
                    return const BottomNavbarStok();

                  default:
                    return Container();
                }
              }).getPadding(context: context, sizeWidth: 0.02, sizeHeight: 0),
            )
          : CustomProgressLottie(context: context);
    }));
  }

  ListTile _drawerListTile(
      {required BuildContext context,
      required String subTitle,
      required Function() onTap}) {
    return ListTile(
        title: CustomText(
          text: subTitle,
          color: ColorConstants.bgColor,
          isBold: true,
        ),
        onTap: onTap);
  }

  GestureDetector _bottomNavbarIcon(
      {required BuildContext context,
      required IconData icon,
      required int index,
      required Function() onTap}) {
    return GestureDetector(
        onTap: onTap,
        child: CustomIconButton(
          icon: Icon(
            icon,
            size: 28,
            color: _bottomNavbarWidgetModel.currentIndex == index
                ? ColorConstants.whiteColor
                : ColorConstants.bottomNavigationBarInactiveColor,
          ),
          onPressed: onTap,
        ));
  }
}
