import 'package:mobx/mobx.dart';
part 'custom_buy_sell_widget_model.g.dart';

final CustomBuySellWidgetModel globalInstance =
    CustomBuySellWidgetModel.internal();

// ignore: library_private_types_in_public_api
class CustomBuySellWidgetModel = _CustomBuySellWidgetModel
    with _$CustomBuySellWidgetModel;

abstract class _CustomBuySellWidgetModel with Store {
  static final CustomBuySellWidgetModel _instance =
      CustomBuySellWidgetModel.internal();

  factory _CustomBuySellWidgetModel() => _instance;

  // ignore: unused_element
  _CustomBuySellWidgetModel.internal();
  List<String> faturaItems = const [
    'E-Arşiv',
    'E-Fatura',
    'E-İrsaliye',
    'Fatura',
    'Fiş',
    'İade Faturası',
    'Serbest Fatura',
    'Teklif'
  ];
  List<String> kdvTypeItems = const ['Dahil', 'Hariç', 'Yok'];
  List<String> districtItems = const [
    'İlçe Seçiniz',
    'Eryaman',
    'Test',
    'Deneme'
  ];
  List<String> provinceItems = const [
    'İl Seçiniz',
    'Ankara',
    'İstanbul',
    'İzmir'
  ];
  List<String> kdvCount = const ['10', '20', '30'];
  List<String> typeItems = const [
    'Adet',
    'Litre',
    'Koli',
    'Paket',
    'Takım',
    'Varil',
    'Teneke',
    'Bidon',
    'IBC',
    'Kilo',
    'Galon',
    'Metre',
    'Tüp',
    'Top',
    'Milimetre',
    'Metrekare',
    'Metreküp',
    'Gram',
    'Ton',
    'Çift',
    'KWH',
    'Kutu',
    'Tabaka',
    'Düzine',
    'CN',
    'Kit',
    'Set',
    'ML',
    'FT',
    'HD',
    'Şişe',
    'PG',
    'DR',
    'Rulo',
    'TU',
    'BT',
    'BX',
    'KT',
    'Saat',
    'Gün',
    'Ay',
    'Libre',
    'Çuval',
    'Torba'
  ];
  @action
  void initialize() {}
}
