import 'package:mobx/mobx.dart';
import 'package:selpar/core/helper/custom_buy_sell_widget/custom_buy_sell_widget_model/custom_buy_sell_widget_model.dart';
part 'satis_islemi_model.g.dart';

// ignore: library_private_types_in_public_api
class SatisIslemiModel = _SatisIslemiModelBase with _$SatisIslemiModel;

abstract class _SatisIslemiModelBase with Store {
  CustomBuySellWidgetModel buySellWidgetModel =
      CustomBuySellWidgetModel.internal();
  @action
  void initialize() {}
}
