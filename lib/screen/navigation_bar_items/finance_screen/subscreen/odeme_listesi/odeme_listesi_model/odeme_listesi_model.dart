import 'package:mobx/mobx.dart';
import 'package:selpar/core/helper/shared_calendar_widget/shared_calendar_widget_model/shared_calendar_widget_model.dart';
part 'odeme_listesi_model.g.dart';

// ignore: library_private_types_in_public_api
class OdemeListesiModel = _OdemeListesiModelBase with _$OdemeListesiModel;

abstract class _OdemeListesiModelBase with Store {
  @observable
  SharedCalendarWidgetModel sharedCalendarStart =
      SharedCalendarWidgetModel.internal();
  @observable
  SharedCalendarWidgetModel sharedCalendarFinish =
      SharedCalendarWidgetModel.internal();
}
