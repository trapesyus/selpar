import 'package:mobx/mobx.dart';

import '../../../../../../core/helper/shared_calendar_widget/shared_calendar_widget_model/shared_calendar_widget_model.dart';
part 'alinan_cek_senet_model.g.dart';

// ignore: library_private_types_in_public_api
class AlinanCekSenetModel = _AlinanCekSenetModelBase with _$AlinanCekSenetModel;

abstract class _AlinanCekSenetModelBase with Store {
  SharedCalendarWidgetModel sharedCalendarStart =
      SharedCalendarWidgetModel.internal();
  SharedCalendarWidgetModel sharedCalendarFinish =
      SharedCalendarWidgetModel.internal();
}
