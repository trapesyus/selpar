import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';
import 'package:mobx/mobx.dart';
import 'package:selpar/core/constants/color_constants.dart';
import 'package:selpar/core/constants/error_message.dart';
import 'package:selpar/core/constants/images_home_screen_constants.dart';
import 'package:selpar/core/extensions/padding_extension.dart';
import 'package:selpar/core/extensions/size_extension.dart';
import 'package:selpar/core/widgets/appbar_widget.dart';
import 'package:selpar/core/widgets/icon_button_widget.dart';
import 'package:selpar/core/widgets/textfield_widget.dart';
import 'package:selpar/screen/navigation_bar_items/finance_screen/subscreen/cari_listesi/cari_listesi_model/cari_listesi_model.dart';
import 'package:selpar/service/language/language_service/language_service.dart';
import 'package:simple_icons/simple_icons.dart';

import '../../../../../core/widgets/text_widget.dart';

class CariListesi extends StatelessWidget {
  CariListesi({super.key}) {
    reaction((_) async => await _cariListesiModel.initialize(), (_) {});
  }
  final CariListesiModel _cariListesiModel = CariListesiModel();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
          title: LanguageService.choosenLanguage['key']!.cariListesi!,
          titleStyle: true,
          centerTitle: false,
          leading: CustomIconButton(
              icon: const Icon(CupertinoIcons.back,
                  color: ColorConstants.buttonColor),
              onPressed: () => Navigator.of(context).pop()),
        ),
        body: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            CustomTextField(
              controller: null,
              horizontalHeight: 0.04,
              verticalHeight: 0.01,
              sizeBottom: 0.02,
              sizeLeft: 0.02,
              sizeRight: 0.02,
              sizeTop: 0.02,
              label:
                  LanguageService.choosenLanguage['key']!.cariyeGoreAramaYapin!,
              labelStyle: true,
            ),
            SizedBox(
              height: context.getSizeHeight(size: 0.7),
              width: context.getSizeWidth(size: 0.94),
              child: Observer(builder: (context) {
                return _cariListesiModel.isLoading
                    ? ListView.separated(
                        separatorBuilder: (context, index) => SizedBox(
                          height: context.getSizeHeight(size: 0.02),
                        ),
                        itemCount: _cariListesiModel.data.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) => Column(
                          children: [
                            Container(
                              height: context.getSizeHeight(size: 0.2),
                              decoration: BoxDecoration(
                                  color: _cariListesiModel.data[index].bakiye!
                                          .contains('-')
                                      ? ColorConstants
                                          .bottomNavigationBarActiveColor
                                      : ColorConstants.hintDarkContainerColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListTile(
                                    title: CustomText(
                                        text: _cariListesiModel
                                                .data[index].cariunvan ??
                                            ErrorMessage.textLoadError,
                                        color: _cariListesiModel
                                                .data[index].bakiye!
                                                .contains('-')
                                            ? ColorConstants.whiteColor
                                            : ColorConstants.defaultTextColor),
                                    subtitle: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: CustomText(
                                              text: _cariListesiModel
                                                      .data[index].adresi ??
                                                  ErrorMessage.textLoadError,
                                              color: _cariListesiModel
                                                      .data[index].bakiye!
                                                      .contains('-')
                                                  ? ColorConstants.whiteColor
                                                  : ColorConstants.bgColor),
                                        ),
                                        Expanded(
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: CustomText(
                                                    text: _cariListesiModel
                                                            .data[index].bakiye!
                                                            .contains('-')
                                                        ? 'Alacak'
                                                        : 'Borç',
                                                    isBold: false,
                                                    color:
                                                        ColorConstants.bgColor),
                                              ),
                                              Expanded(
                                                child: CustomText(
                                                  text: _cariListesiModel
                                                          .data[index].bakiye ??
                                                      ErrorMessage
                                                          .textLoadError,
                                                  color: ColorConstants.bgColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ).getPaddingOnly(
                                        context: context, top: 0.04),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          CustomIconButton(
                                            icon: Icon(
                                              CupertinoIcons.phone,
                                              color: _cariListesiModel
                                                      .data[index].bakiye!
                                                      .contains('-')
                                                  ? ColorConstants.whiteColor
                                                  : ColorConstants.bgColor,
                                            ),
                                            onPressed: () {},
                                          ),
                                          CustomIconButton(
                                              icon: Icon(
                                                SimpleIcons.whatsapp,
                                                color: _cariListesiModel
                                                        .data[index].bakiye!
                                                        .contains('-')
                                                    ? ColorConstants.whiteColor
                                                    : ColorConstants.bgColor,
                                              ),
                                              onPressed: () {}),
                                          CustomIconButton(
                                            icon: Icon(
                                              Icons.person_search_outlined,
                                              color: _cariListesiModel
                                                      .data[index].bakiye!
                                                      .contains('-')
                                                  ? ColorConstants.whiteColor
                                                  : ColorConstants.bgColor,
                                            ),
                                            onPressed: () {},
                                          ),
                                        ],
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          _cariListButton(
                                                  context: context,
                                                  index: index,
                                                  buttonName: LanguageService
                                                      .choosenLanguage['key']!
                                                      .ekstra!,
                                                  onTap: () {})
                                              .getPaddingOnly(
                                                  context: context,
                                                  right: 0.02),
                                          _cariListButton(
                                              context: context,
                                              index: index,
                                              buttonName: LanguageService
                                                  .choosenLanguage['key']!
                                                  .detay!,
                                              onTap: () {})
                                        ],
                                      )
                                    ],
                                  ).getPadding(
                                      context: context,
                                      sizeWidth: 0.02,
                                      sizeHeight: 0)
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    : Lottie.asset('assets/lottie/circularProgress.json');
              }),
            ).getPaddingOnly(context: context, left: 0.02, right: 0.02)
          ],
        ).getPadding(context: context, sizeWidth: 0.02, sizeHeight: 0),
      ),
    );
  }

  Padding _cariListButton(
      {required BuildContext context,
      required int index,
      required String buttonName,
      required Function() onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: _cariListesiModel.data[index].bakiye!.contains('-')
                ? ColorConstants.whiteColor
                : ColorConstants.buttonColor),
        width: context.getSizeWidth(size: 0.2),
        height: context.getSizeHeight(size: 0.05),
        child: CustomText(
            text: buttonName,
            isBold: true,
            color: _cariListesiModel.data[index].bakiye!.contains('-')
                ? ColorConstants.defaultTextColor
                : ColorConstants.whiteColor),
      ),
    ).getPaddingOnly(context: context, bottom: 0.01);
  }
}
