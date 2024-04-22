import 'package:mobx/mobx.dart';

import '../../../../service/language/language_service/language_service.dart';

part 'bottom_navbar_widget_model.g.dart';

// ignore: library_private_types_in_public_api
class BottomNavbarWidgetModel = _BottomNavbarWidgetModelBase
    with _$BottomNavbarWidgetModel;

abstract class _BottomNavbarWidgetModelBase with Store {
  @observable
  int currentIndex = 0;
  @observable
  bool isInitializeLanguage = false;

  @action
  Future<void> initialize() async {
    await initializeLanguage().whenComplete(() => isInitializeLanguage = true);
  }

  Future<void> initializeLanguage() async {
    await LanguageService().getLanguage();
  }

  @action
  void setIndex(int index) {
    currentIndex = index;
  }
}
