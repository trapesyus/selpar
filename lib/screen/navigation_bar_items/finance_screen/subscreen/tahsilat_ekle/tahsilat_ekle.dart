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
import 'package:selpar/service/language/language_service/language_service.dart';

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
        appBar: _appBar(context),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          children: [
            _makbuzNo(),
            Row(
              children: [
                Expanded(
                  child: _cariAdi(),
                ),
                _searchButton().getPaddingOnly(
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
            _selectDate()
                .getPadding(context: context, sizeWidth: 0.02, sizeHeight: 0),
            _dropDownContainer(
                    context: context, items: _tahsilatEkleModel.moneyItems)
                .getPadding(
                    context: context, sizeWidth: 0.02, sizeHeight: 0.02),
            _tutar(),
            _aciklama(),
            _tahsilatEkleButton().getPaddingOnly(
                context: context, right: 0.02, left: 0.02, bottom: 0.04)
          ],
        ).getPadding(context: context, sizeWidth: 0.02, sizeHeight: 0),
      ),
    );
  }

  CustomElevatedButton _tahsilatEkleButton() {
    return CustomElevatedButton(
        buttonText: LanguageService.choosenLanguage['key']!.tahsilatEkle!,
        onPressed: () {});
  }

  CustomTextField _aciklama() {
    return CustomTextField(
      controller: null,
      sizeLeft: 0.02,
      sizeRight: 0.02,
      horizontalHeight: 0.04,
      verticalHeight: 0.01,
      label: LanguageService.choosenLanguage['key']!.aciklama!,
      labelStyle: true,
    );
  }

  CustomTextField _tutar() {
    return CustomTextField(
      controller: null,
      sizeBottom: 0.02,
      sizeLeft: 0.02,
      sizeRight: 0.02,
      horizontalHeight: 0.04,
      verticalHeight: 0.01,
      label: LanguageService.choosenLanguage['key']!.tutar!,
      labelStyle: true,
    );
  }

  SharedCalendarWidget _selectDate() {
    return SharedCalendarWidget(
        store: _calendarWidgetModel,
        title: LanguageService.choosenLanguage['key']!.tarihSec!,
        isTitleRow: true);
  }

  CustomContainerButton _searchButton() {
    return CustomContainerButton(
        buttonText: LanguageService.choosenLanguage['key']!.ara!, onTap: () {});
  }

  CustomTextField _cariAdi() {
    return CustomTextField(
      controller: null,
      sizeBottom: 0.02,
      sizeLeft: 0.02,
      sizeRight: 0.02,
      horizontalHeight: 0.04,
      verticalHeight: 0.01,
      label: LanguageService.choosenLanguage['key']!.cariAdi!,
      labelStyle: true,
    );
  }

  CustomTextField _makbuzNo() {
    return CustomTextField(
      controller: null,
      sizeBottom: 0.02,
      sizeLeft: 0.02,
      sizeRight: 0.02,
      sizeTop: 0.02,
      horizontalHeight: 0.04,
      verticalHeight: 0.01,
      label: LanguageService.choosenLanguage['key']!.makbuzNo!,
      labelStyle: true,
    );
  }

  CustomAppBar _appBar(BuildContext context) {
    return CustomAppBar(
      leading: CustomIconButton(
          icon: const Icon(CupertinoIcons.back,
              color: ColorConstants.buttonColor),
          onPressed: () => HomeScreen().navigateToBack(context: context)),
      title: LanguageService.choosenLanguage['key']!.tahsilatEkle!,
      centerTitle: false,
      titleStyle: true,
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
