import 'package:mobx/mobx.dart';
part 'detay_model.g.dart';

// ignore: library_private_types_in_public_api
class DetayModel = _DetayModelBase with _$DetayModel;

abstract class _DetayModelBase with Store {
  @action
  Future<void> initialize() async {}
}
