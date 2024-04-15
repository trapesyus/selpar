import 'package:mobx/mobx.dart';
import 'package:selpar/core/helper/shared_calendar_widget/shared_calendar_widget_model/shared_calendar_widget_model.dart';
part 'silinen_kabul_listesi_model.g.dart';

// ignore: library_private_types_in_public_api
class SilinenKabulListesiModel = _SilinenKabulListesiModelBase
    with _$SilinenKabulListesiModel;

abstract class _SilinenKabulListesiModelBase with Store {
  @observable
  SharedCalendarWidgetModel sharedCalendarStart =
      SharedCalendarWidgetModel.internal();
  @observable
  SharedCalendarWidgetModel sharedCalendarFinish =
      SharedCalendarWidgetModel.internal();
}
