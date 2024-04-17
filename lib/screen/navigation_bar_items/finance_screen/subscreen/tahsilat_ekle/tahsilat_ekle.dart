import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:selpar/core/constants/color_constants.dart';
import 'package:selpar/core/extensions/navigate.extension.dart';
import 'package:selpar/core/extensions/padding_extension.dart';
import 'package:selpar/core/extensions/size_extension.dart';
import 'package:selpar/core/helper/custom_container_button/custom_container_button.dart';
import 'package:selpar/core/helper/custom_dropdown_button/custom_dropdown_button.dart';
import 'package:selpar/core/helper/shared_calendar_widget/shared_calendar_widget.dart';
import 'package:selpar/core/helper/shared_calendar_widget/shared_calendar_widget_model/shared_calendar_widget_model.dart';
import 'package:selpar/core/widgets/appbar_widget.dart';
import 'package:selpar/core/widgets/elevated_button_widget.dart';
import 'package:selpar/core/widgets/icon_button_widget.dart';
import 'package:selpar/core/widgets/textfield_widget.dart';
import 'package:selpar/screen/home_screen/home_screen.dart';
import 'package:selpar/screen/navigation_bar_items/finance_screen/subscreen/tahsilat_ekle/tahsilat_ekle_model/tahsilat_ekle_model.dart';

class TahsilatEkle extends StatelessWidget {
  TahsilatEkle({super.key}) {
    reaction((_) async => await _tahsilatEkleModel.initialize(), (_) {});
  }
  final TahsilatEkleModel _tahsilatEkleModel = TahsilatEkleModel();
  final SharedCalendarWidgetModel _calendarWidgetModel =
      SharedCalendarWidgetModel.internal();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
          leading: CustomIconButton(
              icon: const Icon(CupertinoIcons.back,
                  color: ColorConstants.buttonColor),
              onPressed: () =>
                  const HomeScreen().navigateToBack(context: context)),
          title: 'Tahsilat Ekle',
          centerTitle: false,
          titleStyle: true,
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          children: [
            CustomTextField(
              controller: null,
              sizeBottom: 0.02,
              sizeLeft: 0.02,
              sizeRight: 0.02,
              sizeTop: 0.02,
              horizontalHeight: 0.04,
              verticalHeight: 0.01,
              label: 'Makbuz No',
              labelStyle: true,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    controller: null,
                    sizeBottom: 0.02,
                    sizeLeft: 0.02,
                    sizeRight: 0.02,
                    horizontalHeight: 0.04,
                    verticalHeight: 0.01,
                    label: 'Cardi Adı',
                    labelStyle: true,
                  ),
                ),
                CustomContainerButton(buttonText: 'Ara', onTap: () {})
                    .getPaddingOnly(
                        context: context, bottom: 0.02, right: 0.02),
              ],
            ),
            _dropDownContainer(
                    context: context, items: _tahsilatEkleModel.plasiyerItems)
                .getPaddingOnly(
                    context: context, right: 0.02, left: 0.02, bottom: 0.02),
            _dropDownContainer(
                    context: context, items: _tahsilatEkleModel.paymentItems)
                .getPadding(context: context, sizeWidth: 0.02, sizeHeight: 0),
            _dropDownContainer(
                    context: context, items: _tahsilatEkleModel.accountItems)
                .getPadding(
                    context: context, sizeWidth: 0.02, sizeHeight: 0.02),
            SharedCalendarWidget(
                    store: _calendarWidgetModel,
                    title: 'Tarih Seç',
                    isTitleRow: true)
                .getPadding(context: context, sizeWidth: 0.02, sizeHeight: 0),
            _dropDownContainer(
                    context: context, items: _tahsilatEkleModel.moneyItems)
                .getPadding(
                    context: context, sizeWidth: 0.02, sizeHeight: 0.02),
            CustomTextField(
              controller: null,
              sizeBottom: 0.02,
              sizeLeft: 0.02,
              sizeRight: 0.02,
              horizontalHeight: 0.04,
              verticalHeight: 0.01,
              label: 'Tutar',
              labelStyle: true,
            ),
            CustomTextField(
              controller: null,
              sizeBottom: 0.02,
              sizeLeft: 0.02,
              sizeRight: 0.02,
              horizontalHeight: 0.04,
              verticalHeight: 0.01,
              label: 'Açıklama',
              labelStyle: true,
            ),
            CustomElevatedButton(buttonText: 'Tahsilat Ekle', onPressed: () {})
                .getPadding(context: context, sizeWidth: 0.02, sizeHeight: 0)
          ],
        ).getPadding(context: context, sizeWidth: 0.02, sizeHeight: 0),
      ),
    );
  }

  Container _dropDownContainer(
      {required BuildContext context, required List<String> items}) {
    return Container(
        width: context.getSizeWidth(size: 0.42),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(color: ColorConstants.textFieldHintTextColor),
            borderRadius: BorderRadius.circular(20)),
        child: CustomDropDownbutton(items: items));
  }
}
