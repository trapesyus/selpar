import 'package:mobx/mobx.dart';
import 'package:selpar/core/helper/shared_calendar_widget/shared_calendar_widget_model/shared_calendar_widget_model.dart';
part 'tahsilat_listesi_model.g.dart';

// ignore: library_private_types_in_public_api
class TahsilatListesiModel = _TahsilatListesiModelBase
    with _$TahsilatListesiModel;

abstract class _TahsilatListesiModelBase with Store {
  @observable
  SharedCalendarWidgetModel sharedCalendarStart =
      SharedCalendarWidgetModel.internal();
  @observable
  SharedCalendarWidgetModel sharedCalendarFinish =
      SharedCalendarWidgetModel.internal();
}
