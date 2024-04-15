import 'package:mobx/mobx.dart';
import 'package:selpar/core/helper/shared_calendar_widget/shared_calendar_widget_model/shared_calendar_widget_model.dart';
part 'satis_evrak_listesi_model.g.dart';

// ignore: library_private_types_in_public_api
class SatisEvrakListesiModel = _SatisEvrakListesiModelBase
    with _$SatisEvrakListesiModel;

abstract class _SatisEvrakListesiModelBase with Store {
  SharedCalendarWidgetModel sharedCalendarStart =
      SharedCalendarWidgetModel.internal();
  SharedCalendarWidgetModel sharedCalendarFinish =
      SharedCalendarWidgetModel.internal();
}
