import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:selpar/core/extensions/navigate_effective_extension.dart';
import 'package:selpar/screen/home_screen/subscreen/siparis_girisi/alinan_siparis_girisi/alinan_siparis_girisi.dart';
import 'package:selpar/screen/navigation_bar_items/buy_sell_screen/subscreen/alis_evrak_listesi/alis_evrak_listesi.dart';
import 'package:selpar/screen/navigation_bar_items/buy_sell_screen/subscreen/alis_islemi/alis_islemi.dart';
import 'package:selpar/screen/navigation_bar_items/buy_sell_screen/subscreen/satis_evrak_listesi/satis_evrak_listesi.dart';
import 'package:selpar/screen/navigation_bar_items/buy_sell_screen/subscreen/satis_islemi/satis_islemi.dart';
import 'package:selpar/screen/navigation_bar_items/finance_screen/subscreen/cari_listesi/cari_listesi.dart';
import 'package:selpar/screen/navigation_bar_items/finance_screen/subscreen/odeme_ekle/odeme_ekle.dart';
import 'package:selpar/screen/navigation_bar_items/finance_screen/subscreen/odeme_listesi/odeme_listesi.dart';
import 'package:selpar/screen/navigation_bar_items/finance_screen/subscreen/tahsilat_ekle/tahsilat_ekle.dart';
import 'package:selpar/screen/navigation_bar_items/finance_screen/subscreen/tahsilat_listesi/tahsilat_listesi.dart';
import 'package:selpar/screen/navigation_bar_items/online_operation_screen/subscreen/gelen_fatura/gelen_fatura.dart';
import 'package:selpar/screen/navigation_bar_items/online_operation_screen/subscreen/giden_fatura/giden_fatura.dart';
import 'package:selpar/screen/navigation_bar_items/stock_screen/subscreen/orjinal_stok_listesi/orjinal_stok_listesi.dart';
import 'package:selpar/screen/navigation_bar_items/stock_screen/subscreen/stok_listesi/stok_listesi.dart';
import 'package:selpar/screen/navigation_bar_items/vehicle_screen/subscreen/%C3%B6nceki_onarimlar/onceki_onarimlar.dart';
import 'package:selpar/screen/navigation_bar_items/vehicle_screen/subscreen/kapali_onarimlar/kapali_onarimlar.dart';
import 'package:selpar/screen/navigation_bar_items/vehicle_screen/subscreen/silinen_kabul_listesi/silinen_kabul_listesi.dart';
import 'package:selpar/screen/navigation_bar_items/vehicle_screen/subscreen/tahsilati_yapilmayan_onarimlar/tahsilati_yapilmayan_onarimlar.dart';
import 'package:selpar/service/language/language_service/language_service.dart';
part 'home_screen_model.g.dart';

// ignore: library_private_types_in_public_api
class HomeScreenModel = _HomeScreenModelBase with _$HomeScreenModel;

abstract class _HomeScreenModelBase with Store {
  @observable
  bool isSearching = false;

  @observable
  List dataAdvert = ObservableList.of([
    'https://images.pexels.com/photos/712618/pexels-photo-712618.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/1637859/pexels-photo-1637859.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/627678/pexels-photo-627678.jpeg'
  ]);

  @observable
  List<String> pagesData = ObservableList.of([]);
  List<String> tempList = [
    LanguageService.choosenLanguage['key']!.servisIslemleri!,
    LanguageService.choosenLanguage['key']!.kapaliOnarimlar!,
    LanguageService.choosenLanguage['key']!.tahsilatiYapilmayanOnarimlar!,
    LanguageService.choosenLanguage['key']!.oncekiOnarimlar!,
    LanguageService.choosenLanguage['key']!.silinenKabulListesi!,
    LanguageService.choosenLanguage['key']!.finansIslemleri!,
    LanguageService.choosenLanguage['key']!.cariListesi!,
    LanguageService.choosenLanguage['key']!.tahsilatEkle!,
    LanguageService.choosenLanguage['key']!.tahsilatListesi!,
    LanguageService.choosenLanguage['key']!.bugunYapilacakTahsilatlar!,
    LanguageService.choosenLanguage['key']!.odemeEkle!,
    LanguageService.choosenLanguage['key']!.odemeListesi!,
    LanguageService.choosenLanguage['key']!.bugunYapilacakOdemeler!,
    LanguageService.choosenLanguage['key']!.butunAlacaklarOdemeler!,
    LanguageService.choosenLanguage['key']!.stokIslemleri!,
    LanguageService.choosenLanguage['key']!.stokListesi!,
    LanguageService.choosenLanguage['key']!.orjinalStokListesi!,
    LanguageService.choosenLanguage['key']!.alimSatimIslemleri!,
    LanguageService.choosenLanguage['key']!.alisEvrakListesi!,
    LanguageService.choosenLanguage['key']!.satisIslemi!,
    LanguageService.choosenLanguage['key']!.alisIslemi!,
    LanguageService.choosenLanguage['key']!.satisEvrakListesi!,
    LanguageService.choosenLanguage['key']!.eIslemler!,
    LanguageService.choosenLanguage['key']!.gelenFatura!,
    LanguageService.choosenLanguage['key']!.gidenFatura!,
    LanguageService.choosenLanguage['key']!.gidenEIrsaliye!,
    LanguageService.choosenLanguage['key']!.siparisIslemleri!,
    LanguageService.choosenLanguage['key']!.alinanSiparisGirisi!,
    LanguageService.choosenLanguage['key']!.verilenSiparisGirisi!,
    LanguageService.choosenLanguage['key']!.alinanSiparisListesi!,
    LanguageService.choosenLanguage['key']!.verilenSiparisListesi!
  ];

  @observable
  TextEditingController pageSearchController = TextEditingController();

  @action
  void pageSearchOperation({required String pageSearchControllerValue}) {
    pageSearchController.value.text == ''
        ? isSearching = false
        : isSearching = true;

    pagesData.clear();

    for (var element in tempList) {
      if (element
          .toLowerCase()
          .contains(pageSearchControllerValue.toLowerCase())) {
        pagesData.add(element);
      }
    }
    log(pagesData.length.toString());
  }

  @action
  Future<void> navigateToSerachinPage(
      String pageName, BuildContext context) async {
    switch (pageName.toLowerCase()) {
      case 'kapalı onarımlar' ||
            'closed repairs' ||
            'geschlossene reparaturen' ||
            'закрытые ремонты' ||
            'gesloten reparaties':
        await const KapaliOnarimlar().navigateEffectiveTo(context: context);
        break;
      case 'tahsilatı yapılmayan onarımlar' ||
            'uncollected repairs' ||
            'nicht-geïnde reparaturen' ||
            'несобранные ремонты' ||
            'niet-geïnde reparaties':
        await TahsilatiYapilmayanOnarimlar()
            .navigateEffectiveTo(context: context);
        break;
      case 'önceki onarımlar' ||
            'previous repairs' ||
            'frühere reparaturen' ||
            'предыдущие ремонты' ||
            'vorige reparaties':
        await const OncekiOnarimlar().navigateEffectiveTo(context: context);
        break;
      case 'silinen kabul listesi' ||
            'deleted acceptance list' ||
            'gelöschte akzeptanzliste' ||
            'удаленный список приема' ||
            'verwijderde acceptatielijst':
        await SilinenKabulListesi().navigateEffectiveTo(context: context);
        break;
      case 'cari listesi (hesap ekstresi)' ||
            'account statement (ledger list)' ||
            'kontenübersicht (kontoauszug)' ||
            'список текущих счетов (выписка)' ||
            'rekeningoverzicht (rekeningafschrift)':
        await CariListesi().navigateEffectiveTo(context: context);
        break;
      case 'tahsilat ekle' ||
            'add collection' ||
            'zahlungseingang hinzufügen' ||
            'добавить платеж' ||
            'incasso toevoegen':
        await TahsilatEkle().navigateEffectiveTo(context: context);
        break;
      case 'tahsilat listesi' ||
            'collection list' ||
            'zahlungsliste' ||
            'список платежей' ||
            'incassolijst':
        await TahsilatListesi().navigateEffectiveTo(context: context);
        break;
      case 'bugün yapılacak tahsilatlar' ||
            'collections to be made today' ||
            'heutige zahlungseingänge' ||
            'платежи на сегодня' ||
            'te innen vandaag':
        //   await BugunYapilacakTahsilatlar().navigateEffectiveTo(context: context);
        break;
      case 'ödeme ekle' ||
            'add payment' ||
            'zahlung hinzufügen' ||
            'добавить оплату' ||
            'betaling toevoegen':
        await OdemeEkle().navigateEffectiveTo(context: context);
        break;
      case 'odeme listesi' ||
            'payment list' ||
            'betalingslijst' ||
            'список оплат' ||
            'betalingslijst':
        await OdemeListesi().navigateEffectiveTo(context: context);
        break;
      case 'bugün yapılacak ödemeler' ||
            'payments to be made today' ||
            'heutige zahlungen' ||
            'оплаты на сегодня' ||
            'betalingen vandaag':
        // await BugunYapilacakOdemeler().navigateEffectiveTo(context: context);
        break;
      case 'bütün alacaklar - ödemeler' ||
            'all receivables - payments' ||
            'alle vorderungen und zahlungen' ||
            'все долги и платежи' ||
            'alle vorderingen en betalingen':
// await ButunAlacaklarOdemeler().navigateEffectiveTo(context: context);
        break;

//stok sayfaları
      case 'stok listesi' ||
            'stock list' ||
            'lagerliste' ||
            'список запасов' ||
            'voorraadlijst':
        await const StokListesi().navigateEffectiveTo(context: context);
        break;
      case 'orjinal stok listesi' ||
            'original stock list' ||
            'originele voorraadlijst' ||
            'оригинальный список запасов' ||
            'originele voorraadlijst':
        await const OrjinalStokListesi().navigateEffectiveTo(context: context);
        break;
      case 'alış işlemi' ||
            'purchase transaction' ||
            'kaufvorgang' ||
            'процесс покупки' ||
            'aankooptransactie':
        await AlisIslemi().navigateEffectiveTo(context: context);
        break;
      case 'satış işlemi' ||
            'sales transaction' ||
            'verkaufsvorgang' ||
            'процесс продажи' ||
            'verkooptransactie':
        await SatisIslemi().navigateEffectiveTo(context: context);
        break;
      case 'satış evrak listesi' ||
            'sales documents list' ||
            'verkaufsdokumentenliste' ||
            'список продажных документов' ||
            'verkoopdocumentenlijst':
        await SatisEvrakListesi().navigateEffectiveTo(context: context);
        break;
      case 'alış evrak listesi' ||
            'purchase document list' ||
            'kaufdokumentenliste' ||
            'список документов на закупку' ||
            'aankoopdocumentenlijst':
        await AlisEvrakListesi().navigateEffectiveTo(context: context);
        break;

      //e-işlemler sayfaları
      case 'gelen fatura' ||
            'incoming invoice' ||
            'eingehende rechnung' ||
            'входящий счет' ||
            'inkomende factuur':
        await const GelenFatura().navigateEffectiveTo(context: context);
        break;
      case 'giden fatura' ||
            'outgoing invoice' ||
            'ausgehende rechnung' ||
            'исходящий счет' ||
            'uitgaande factuur':
        await const GidenFatura().navigateEffectiveTo(context: context);
        break;
      case 'giden e-irsaliye' ||
            'outgoing e-delivery note' ||
            'ausgehende e-lieferschein' ||
            'исходящая электронная накладная' ||
            'uitgaande e-leveringsbon':
        //await GidenEIrsaliye().navigateEffectiveTo(context: context);
        break;

      //sipariş sayfaları
      case 'alınan sipariş girişi' ||
            'received order entry' ||
            'erhaltene bestelleingang' ||
            'полученный входной заказ' ||
            'ontvangen bestelling invoer':
        await AlinanSiparisGirisi().navigateEffectiveTo(context: context);
        break;
      case 'verilen sipariş girişi' ||
            'given order entry' ||
            'gegebene bestelleingang' ||
            'данный входной заказ' ||
            'gegeven bestelling invoer':
        await SilinenKabulListesi().navigateEffectiveTo(context: context);
        break;
      case 'alınan sipariş listesi' ||
            'received order list' ||
            'erhaltene bestelliste' ||
            'список полученных заказов' ||
            'ontvangen bestellingslijst':
        //await AlinanSiparisListesi().navigateEffectiveTo(context: context);
        break;
      case 'verilen sipariş listesi' ||
            'given order list' ||
            'gegebene bestelliste' ||
            'список данных заказов' ||
            'gegeven bestellingslijst':
        // await VerilenSiparisListesi().navigateEffectiveTo(context: context);
        break;
      default:
        break;
    }
  }
}
