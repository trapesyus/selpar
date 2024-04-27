import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:selpar/core/extensions/navigate_effective_extension.dart';
import 'package:selpar/core/extensions/padding_extension.dart';
import 'package:selpar/core/extensions/size_extension.dart';
import 'package:selpar/core/helper/custom_cari_listesi_listView/custom_cari_listesi_list_view_model/custom_cari_listesi_list_view_model.dart';
import 'package:selpar/core/helper/custom_progress_lottie/custom_progress_lottie_without_scaffold/custom_progress_lottie_without_scaffold.dart';
import 'package:simple_icons/simple_icons.dart';
import '../../../screen/navigation_bar_items/finance_screen/subscreen/cari_listesi/subscreen/detay/detay.dart';
import '../../../screen/navigation_bar_items/finance_screen/subscreen/cari_listesi/subscreen/esktre/ekstre.dart';
import '../../../service/language/language_service/language_service.dart';
import '../../constants/color_constants.dart';
import '../../constants/error_message.dart';
import '../../widgets/icon_button_widget.dart';
import '../../widgets/text_widget.dart';
import '../../widgets/textfield_widget.dart';

class CustomCariListesiListView extends StatelessWidget {
  final bool isAddingTitle;
  CustomCariListesiListView({super.key, required this.isAddingTitle}) {
    reaction((_) async => await _cariListesiListViewModel.initialize(), (_) {});
  }
  final CustomCariListesiListViewModel _cariListesiListViewModel =
      CustomCariListesiListViewModel();
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        isAddingTitle
            ? CustomText(
                text: LanguageService.choosenLanguage['key']!.cariListesi!,
                color: ColorConstants.defaultTextColor,
                fontSize: 16,
                isBold: true,
              )
            : const SizedBox(),
        _searchField(),
        SizedBox(
          height: context.getSizeHeight(size: 0.7),
          width: context.getSizeWidth(size: 0.94),
          child: Observer(builder: (context) {
            return _cariListesiListViewModel.isLoading
                ? _onSearchResultList()
                : const CustomProgressLottieWithoutScaffold();
          }),
        ).getPaddingOnly(context: context, left: 0.02, right: 0.02)
      ],
    ).getPadding(context: context, sizeWidth: 0.02, sizeHeight: 0);
  }

  ListView _onSearchResultList() => ListView.separated(
        separatorBuilder: (context, index) => SizedBox(
          height: context.getSizeHeight(size: 0.02),
        ),
        itemCount: _cariListesiListViewModel.data.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => Column(
          children: [
            Container(
              height: context.getSizeHeight(size: 0.2),
              decoration: BoxDecoration(
                  color: _cariListesiListViewModel.data[index].bakiye!
                          .contains('-')
                      ? ColorConstants.bottomNavigationBarActiveColor
                      : ColorConstants.hintDarkContainerColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: _cariUnvan(index),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: _adress(index),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: _alacakBorc(index),
                              ),
                              Expanded(
                                child: _bakiye(index),
                              ),
                            ],
                          ),
                        )
                      ],
                    ).getPaddingOnly(context: context, top: 0.04),
                  ),
                  _iconButtons(index, context).getPadding(
                      context: context, sizeWidth: 0.02, sizeHeight: 0)
                ],
              ),
            )
          ],
        ),
      );

  CustomText _cariUnvan(int index) => CustomText(
      text: _cariListesiListViewModel.data[index].cariunvan ??
          ErrorMessage.textLoadError,
      color: _cariListesiListViewModel.data[index].bakiye!.contains('-')
          ? ColorConstants.whiteColor
          : ColorConstants.defaultTextColor);

  CustomText _adress(int index) => CustomText(
      text: _cariListesiListViewModel.data[index].adresi ??
          ErrorMessage.textLoadError,
      color: _cariListesiListViewModel.data[index].bakiye!.contains('-')
          ? ColorConstants.whiteColor
          : ColorConstants.bgColor);

  CustomText _alacakBorc(int index) => CustomText(
      text: _cariListesiListViewModel.data[index].bakiye!.contains('-')
          ? LanguageService.choosenLanguage['key']!.alacak!
          : LanguageService.choosenLanguage['key']!.borc!,
      isBold: false,
      color: _cariListesiListViewModel.data[index].bakiye!.contains('-')
          ? ColorConstants.whiteColor
          : ColorConstants.bgColor);

  CustomText _bakiye(int index) => CustomText(
        text: _cariListesiListViewModel.data[index].bakiye ??
            ErrorMessage.textLoadError,
        color: _cariListesiListViewModel.data[index].bakiye!.contains('-')
            ? ColorConstants.whiteColor
            : ColorConstants.bgColor,
      );

  Row _iconButtons(int index, BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CustomIconButton(
                icon: Icon(
                  CupertinoIcons.phone,
                  color: _cariListesiListViewModel.data[index].bakiye!
                          .contains('-')
                      ? ColorConstants.whiteColor
                      : ColorConstants.bgColor,
                ),
                onPressed: () {},
              ),
              CustomIconButton(
                  icon: Icon(
                    SimpleIcons.whatsapp,
                    color: _cariListesiListViewModel.data[index].bakiye!
                            .contains('-')
                        ? ColorConstants.whiteColor
                        : ColorConstants.bgColor,
                  ),
                  onPressed: () {}),
              CustomIconButton(
                icon: Icon(
                  Icons.person_search_outlined,
                  color: _cariListesiListViewModel.data[index].bakiye!
                          .contains('-')
                      ? ColorConstants.whiteColor
                      : ColorConstants.bgColor,
                ),
                onPressed: () async => await Detay(
                        cariUnvan:
                            _cariListesiListViewModel.data[index].cariunvan!,
                        bakiye: _cariListesiListViewModel.data[index].bakiye!,
                        adres: _cariListesiListViewModel.data[index].adresi!,
                        alacak: _cariListesiListViewModel.data[index].alacak!,
                        borc: _cariListesiListViewModel.data[index].borc!,
                        telefon: _cariListesiListViewModel.data[index].telefon!,
                        vergiBilgileri:
                            _cariListesiListViewModel.data[index].vnumarasi!)
                    .navigateEffectiveTo(context: context),
              ),
            ],
          ),
          _extraDetailButtons(context, index)
        ],
      );

  Row _extraDetailButtons(BuildContext context, int index) => Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _cariListButton(
                  context: context,
                  index: index,
                  buttonName: LanguageService.choosenLanguage['key']!.ekstre!,
                  onTap: () async => await Ekstre(
                          cariUnvan:
                              _cariListesiListViewModel.data[index].cariunvan!,
                          bakiye: _cariListesiListViewModel.data[index].bakiye!)
                      .navigateEffectiveTo(context: context))
              .getPaddingOnly(context: context, right: 0.02),
          _cariListButton(
              context: context,
              index: index,
              buttonName: LanguageService.choosenLanguage['key']!.detay!,
              onTap: () async => await Detay(
                      cariUnvan:
                          _cariListesiListViewModel.data[index].cariunvan ??
                              ErrorMessage.textLoadError,
                      bakiye: _cariListesiListViewModel.data[index].bakiye ??
                          ErrorMessage.textLoadError,
                      adres: _cariListesiListViewModel.data[index].adresi ??
                          ErrorMessage.textLoadError,
                      alacak: _cariListesiListViewModel.data[index].alacak ??
                          ErrorMessage.textLoadError,
                      borc: _cariListesiListViewModel.data[index].borc ??
                          ErrorMessage.textLoadError,
                      telefon: _cariListesiListViewModel.data[index].telefon ??
                          ErrorMessage.textLoadError,
                      vergiBilgileri:
                          _cariListesiListViewModel.data[index].vnumarasi ??
                              ErrorMessage.textLoadError)
                  .navigateEffectiveTo(context: context))
        ],
      );

  CustomTextField _searchField() => CustomTextField(
        controller: null,
        horizontalHeight: 0.04,
        verticalHeight: 0.01,
        sizeBottom: 0.02,
        sizeLeft: 0.02,
        sizeRight: 0.02,
        sizeTop: 0.02,
        label: LanguageService.choosenLanguage['key']!.cariyeGoreAramaYapin!,
        labelStyle: true,
      );

  Padding _cariListButton(
          {required BuildContext context,
          required int index,
          required String buttonName,
          required Function() onTap}) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: _cariListesiListViewModel.data[index].bakiye!.contains('-')
                  ? ColorConstants.whiteColor
                  : ColorConstants.buttonColor),
          width: context.getSizeWidth(size: 0.22),
          height: context.getSizeHeight(size: 0.05),
          child: CustomText(
              text: buttonName,
              isBold: true,
              color: _cariListesiListViewModel.data[index].bakiye!.contains('-')
                  ? ColorConstants.defaultTextColor
                  : ColorConstants.whiteColor),
        ),
      ).getPaddingOnly(context: context, bottom: 0.01);
}
