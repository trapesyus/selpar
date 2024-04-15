import 'package:mobx/mobx.dart';
import 'package:selpar/core/helper/custom_buy_sell_widget/custom_buy_sell_widget_model/custom_buy_sell_widget_model.dart';
part 'verilen_siparis_girisi_model.g.dart';

class VerilenSiparisGirisiModel = _VerilenSiparisGirisiModelBase
    with _$VerilenSiparisGirisiModel;

abstract class _VerilenSiparisGirisiModelBase with Store {
  CustomBuySellWidgetModel buySellWidgetModel =
      CustomBuySellWidgetModel.internal();
}
