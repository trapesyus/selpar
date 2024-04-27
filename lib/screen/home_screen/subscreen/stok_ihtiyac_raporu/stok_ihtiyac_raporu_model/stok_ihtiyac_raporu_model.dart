import 'package:mobx/mobx.dart';
import 'package:selpar/core/helper/shared_calendar_widget/shared_calendar_widget_model/shared_calendar_widget_model.dart';
part 'stok_ihtiyac_raporu_model.g.dart';

// ignore: library_private_types_in_public_api
class StokIhtiyacRaporuModel = _StokIhtiyacRaporuModelBase
    with _$StokIhtiyacRaporuModel;

abstract class _StokIhtiyacRaporuModelBase with Store {
  SharedCalendarWidgetModel sharedCalendarStart =
      SharedCalendarWidgetModel.internal();
  SharedCalendarWidgetModel sharedCalendarFinish =
      SharedCalendarWidgetModel.internal();
}
