import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'tahsilat_ekle_model.g.dart';

// ignore: library_private_types_in_public_api
class TahsilatEkleModel = _TahsilatEkleModelBase with _$TahsilatEkleModel;

abstract class _TahsilatEkleModelBase with Store {
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
  DateTime selectedDate = DateTime.now();
  @action
  Future<void> initialize() async {}
  @action
  Future<void> selectDate({required BuildContext context}) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Başlangıçta seçili olacak tarih
      firstDate: DateTime.now(), // Seçilebilecek en erken tarih
      lastDate: DateTime(2101), // Seçilebilecek en geç tarih
    );
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
    }
  }
}
