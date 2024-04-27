import 'package:mobx/mobx.dart';
import 'package:selpar/core/helper/shared_calendar_widget/shared_calendar_widget_model/shared_calendar_widget_model.dart';
part 'ekstre_model.g.dart';

// ignore: library_private_types_in_public_api
class EkstreModel = _EkstreModelBase with _$EkstreModel;

abstract class _EkstreModelBase with Store {
  SharedCalendarWidgetModel sharedCalendarStart =
      SharedCalendarWidgetModel.internal();
  SharedCalendarWidgetModel sharedCalendarFinish =
      SharedCalendarWidgetModel.internal();
  Future<void> initialize() async {}
}
