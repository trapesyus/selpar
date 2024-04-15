import 'package:mobx/mobx.dart';
import 'package:selpar/core/helper/custom_buy_sell_widget/custom_buy_sell_widget_model/custom_buy_sell_widget_model.dart';
part 'teklif_model.g.dart';

class TeklifModel = _TeklifModelBase with _$TeklifModel;

abstract class _TeklifModelBase with Store {
  CustomBuySellWidgetModel customBuySellWidgetModel =
      CustomBuySellWidgetModel.internal();
}