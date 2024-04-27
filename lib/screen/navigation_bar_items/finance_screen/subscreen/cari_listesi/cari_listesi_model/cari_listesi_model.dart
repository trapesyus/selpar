import 'package:mobx/mobx.dart';

part 'cari_listesi_model.g.dart';

// ignore: library_private_types_in_public_api
class CariListesiModel = _CariListesiModelBase with _$CariListesiModel;

abstract class _CariListesiModelBase with Store {
  @action
  Future<void> initialize() async {}
}
