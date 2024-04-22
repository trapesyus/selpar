import 'package:mobx/mobx.dart';
import 'package:selpar/service/cari_listesi/cari_listesi_model/cari_listesi_service_model.dart';
import 'package:selpar/service/cari_listesi/cari_listesi_service/cari_listesi_service.dart';
part 'cari_listesi_model.g.dart';

// ignore: library_private_types_in_public_api
class CariListesiModel = _CariListesiModelBase with _$CariListesiModel;

abstract class _CariListesiModelBase with Store {
  @observable
  bool isLoading = false;

  @observable
  List<CariData> data = ObservableList.of([]);

  final CariListesiService _cariListesiService = CariListesiService();
  Future<void> initialize() async {
    await getCariListesiData().whenComplete(() => isLoading = true);
  }

  Future<void> getCariListesiData() async {
    data = await _cariListesiService.getCariListesiData();
  }
}
