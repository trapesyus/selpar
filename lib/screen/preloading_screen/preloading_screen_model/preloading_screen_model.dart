import 'dart:developer';

import 'package:mobx/mobx.dart';
import 'package:selpar/app_operations/initial/initial.dart';
part 'preloading_screen_model.g.dart';

class PreloadingScreenModel = _PreloadingScreenModelBase
    with _$PreloadingScreenModel;

abstract class _PreloadingScreenModelBase with Store {
  @observable
  bool isInitial = false;
  Future<void> initialize() async {
    await Initial.initialize().whenComplete(() => isInitial = true);
    log(isInitial.toString());
  }
}
