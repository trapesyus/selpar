import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:selpar/core/constants/color_constants.dart';
import 'package:selpar/core/extensions/padding_extension.dart';
import 'package:selpar/core/widgets/icon_button_widget.dart';
import 'package:selpar/core/widgets/text_widget.dart';
import 'package:selpar/core/widgets/textfield_widget.dart';
import 'package:selpar/screen/bottom_navbar_widget_subscreen/bottom_navbar_kart/bottom_navbar_kart_model/bottom_navbar_kart_model.dart';
import 'package:selpar/service/language/language_service/language_service.dart';

class BottomNavbarKart extends StatelessWidget {
  BottomNavbarKart({super.key});
  final BottomNavBarKartModel _kartModel = BottomNavBarKartModel();
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Observer(builder: (context) {
          return CustomText(
                  text: _kartModel.index == 0
                      ? LanguageService
                          .choosenLanguage['key']!.bugunAcilanKabulKartlari!
                      : _kartModel.index == 1
                          ? LanguageService.choosenLanguage['key']!.acikKartlar!
                          : _kartModel.index == 2
                              ? LanguageService.choosenLanguage['key']!
                                  .bugunKapatilanKartlar!
                              : LanguageService
                                  .choosenLanguage['key']!.oncekiOnarimlar!,
                  color: ColorConstants.defaultTextColor,
                  isBold: true,
                  fontSize: 16)
              .getPaddingOnly(context: context, bottom: 0.02);
        }),
        Observer(builder: (context) {
          return Row(
            children: [
              Expanded(
                child: _containerIcons(
                        index: 0,
                        icon: CupertinoIcons.doc_append,
                        onTap: () => _kartModel.selectIndex(newIndex: 0))
                    .getPaddingOnly(context: context, right: 0.02),
              ),
              Expanded(
                  child: _containerIcons(
                          index: 1,
                          icon: CupertinoIcons.doc_text_search,
                          onTap: () => _kartModel.selectIndex(newIndex: 1))
                      .getPaddingOnly(context: context, right: 0.02)),
              Expanded(
                  child: _containerIcons(
                          index: 2,
                          icon: CupertinoIcons.doc,
                          onTap: () => _kartModel.selectIndex(newIndex: 2))
                      .getPaddingOnly(context: context, right: 0.02)),
              Expanded(
                  child: _containerIcons(
                          index: 3,
                          icon: CupertinoIcons.doc_checkmark,
                          onTap: () => _kartModel.selectIndex(newIndex: 3))
                      .getPaddingOnly(context: context, right: 0.02)),
            ],
          );
        }),
        Observer(builder: (context) {
          return _kartModel.index == 0
              ? const SizedBox()
              : CustomTextField(
                  horizontalHeight: 0.04,
                  verticalHeight: 0.01,
                  sizeTop: 0.02,
                  sizeBottom: 0.02,
                  label:
                      LanguageService.choosenLanguage['key']!.plakaCariVsArama!,
                  labelStyle: true,
                );
        })
      ],
    ).getPadding(context: context, sizeWidth: 0.02, sizeHeight: 0);
  }

  Container _containerIcons(
      {required int index, required IconData icon, required Function() onTap}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: _kartModel.index == index
            ? ColorConstants.buttonColor
            : ColorConstants.hintDarkContainerColor,
      ),
      child: CustomIconButton(
          icon: Icon(icon,
              color: _kartModel.index == index
                  ? ColorConstants.whiteColor
                  : ColorConstants.bgColor),
          onPressed: onTap),
    );
  }
}
