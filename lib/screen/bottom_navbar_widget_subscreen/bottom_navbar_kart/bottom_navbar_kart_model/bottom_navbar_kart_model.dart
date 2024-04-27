import 'dart:developer';

import 'package:mobx/mobx.dart';
part 'bottom_navbar_kart_model.g.dart';

// ignore: library_private_types_in_public_api
class BottomNavBarKartModel = _BottomNavBarKartModelBase
    with _$BottomNavBarKartModel;

abstract class _BottomNavBarKartModelBase with Store {
  @observable
  int index = 0;

  @action
  void selectIndex({required int newIndex}) {
    index = newIndex;
    log(index.toString());
  }
}
