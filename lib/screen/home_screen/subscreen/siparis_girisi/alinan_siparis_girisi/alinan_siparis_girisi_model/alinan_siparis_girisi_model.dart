import 'package:mobx/mobx.dart';
import 'package:selpar/core/helper/custom_buy_sell_widget/custom_buy_sell_widget_model/custom_buy_sell_widget_model.dart';
part 'alinan_siparis_girisi_model.g.dart';

// ignore: library_private_types_in_public_api
class AlinanSiparisGirisiModel = _AlinanSiparisGirisiModelBase
    with _$AlinanSiparisGirisiModel;

abstract class _AlinanSiparisGirisiModelBase with Store {
  CustomBuySellWidgetModel buySellWidgetModel =
      CustomBuySellWidgetModel.internal();
}
