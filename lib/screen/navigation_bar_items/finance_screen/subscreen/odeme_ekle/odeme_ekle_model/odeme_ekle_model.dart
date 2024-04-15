import 'package:mobx/mobx.dart';

import '../../../../../../core/helper/shared_calendar_widget/shared_calendar_widget_model/shared_calendar_widget_model.dart';
part 'odeme_ekle_model.g.dart';

// ignore: library_private_types_in_public_api
class OdemeEkleModel = _OdemeEkleModelBase with _$OdemeEkleModel;

abstract class _OdemeEkleModelBase with Store {
  List<String> paymentItems = const [
    'Ödeme Türü Seçiniz',
    'Nakit',
    'Kredi Kartı',
    'Havala',
    'Virman'
  ];
  List<String> accountItems = const [
    'Hesap Seçiniz',
    'Kasa Hesabı',
    'Eklenen Cari Yeni'
  ];
  List<String> moneyItems = const [
    'Para Birimi Seçiniz',
    'Amerikan Doları',
    'Euro',
    'Japon Yeni',
    'Sterlin',
    'Altın'
  ];
  List<String> plasiyerItems = const [
    'Plasiyer Seçiniz',
    'Demo Personel',
    'X Personel',
    'Y Personel'
  ];
  @observable
  SharedCalendarWidgetModel calendarSelectDate =
      SharedCalendarWidgetModel.internal();
  @action
  Future<void> initialize() async {}
}
