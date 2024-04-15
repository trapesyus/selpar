import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:selpar/screen/navigation_bar_items/buy_sell_screen/buy_sell_screen.dart';
import 'package:selpar/screen/navigation_bar_items/finance_screen/finance_screen.dart';
import 'package:selpar/screen/navigation_bar_items/order_screen/order_screen.dart';
import 'package:selpar/screen/navigation_bar_items/stock_screen/stock_screen.dart';
import 'package:selpar/screen/navigation_bar_items/vehicle_screen/vehicle_screen.dart';

import '../../../../screen/home_screen/home_screen.dart';
import '../../../../screen/navigation_bar_items/online_operation_screen/online_operation_screen.dart';
part 'bottom_navbar_widget_model.g.dart';

// ignore: library_private_types_in_public_api
class BottomNavbarWidgetModel = _BottomNavbarWidgetModelBase
    with _$BottomNavbarWidgetModel;

abstract class _BottomNavbarWidgetModelBase with Store {
  @observable
  int currentIndex = 0;
  @observable
  List<Widget> pages = const <Widget>[
    HomeScreen(),
    VehicleScreen(),
    FinanceScreen(),
    StockScreen(),
    BuySellScreen(),
    OnlineOperationScreen(),
    OrderScreen()
  ];

  Future<void> initialize() async {}

  @action
  void setIndex(int index) {
    currentIndex = index;
  }
}
