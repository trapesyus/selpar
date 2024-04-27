import 'package:mobx/mobx.dart';

import '../../../../service/cari_listesi/cari_listesi_model/cari_listesi_service_model.dart';
import '../../../../service/cari_listesi/cari_listesi_service/cari_listesi_service.dart';
part 'custom_cari_listesi_list_view_model.g.dart';

// ignore: library_private_types_in_public_api
class CustomCariListesiListViewModel = _CustomCariListesiListViewModelBase
    with _$CustomCariListesiListViewModel;

abstract class _CustomCariListesiListViewModelBase with Store {
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
