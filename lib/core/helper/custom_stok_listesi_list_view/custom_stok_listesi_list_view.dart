import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selpar/core/extensions/padding_extension.dart';
import 'package:selpar/core/extensions/size_extension.dart';

import '../../../service/language/language_service/language_service.dart';
import '../../constants/color_constants.dart';
import '../../widgets/icon_button_widget.dart';
import '../../widgets/text_widget.dart';
import '../../widgets/textfield_widget.dart';
import '../custom_container_button/custom_container_button.dart';

class CustomStokListesiListView extends StatelessWidget {
  final bool isAddingTitle;
  const CustomStokListesiListView({super.key, required this.isAddingTitle});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      children: [
        isAddingTitle
            ? CustomText(
                    text: LanguageService.choosenLanguage['key']!.stokListesi!,
                    color: ColorConstants.defaultTextColor,
                    isBold: true,
                    fontSize: 16)
                .getPaddingOnly(context: context, bottom: 0.02)
            : const SizedBox(),
        Row(
          children: [
            Expanded(
              child: _searchStockNumber(),
            ),
            _cameraButton(context)
                .getPaddingOnly(context: context, bottom: 0.015),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: _searchStokName(),
            ),
            _searchButton().getPaddingOnly(context: context, bottom: 0.02)
          ],
        ),
        SizedBox(
          height: context.getSizeHeight(size: 0.7),
          child: _searchResultList(),
        )
      ],
    ).getPadding(context: context, sizeWidth: 0.04, sizeHeight: 0);
  }

  ListView _searchResultList() => ListView.separated(
        separatorBuilder: (context, index) =>
            SizedBox(height: context.getSizeHeight(size: 0.02)),
        itemCount: 10,
        itemBuilder: (context, index) => Container(
          height: context.getSizeHeight(size: 0.2),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ColorConstants.hintDarkContainerColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _listElementTitle().getPaddingOnly(context: context, top: 0.02),
              Row(children: [
                _image().getPaddingOnly(context: context, right: 0.04),
                _rafYeriFiyat(context)
              ]).getPaddingOnly(context: context, left: 0.04),
              const SizedBox()
            ],
          ),
        ),
      );

  CustomText _listElementTitle() => CustomText(
      text: 'Pancur Ön Tampon', color: ColorConstants.defaultTextColor);

  CircleAvatar _image() => const CircleAvatar();

  Column _rafYeriFiyat(BuildContext context) =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _fiyati().getPaddingOnly(context: context, bottom: 0.02),
        _rafYeri()
      ]);

  CustomText _fiyati() =>
      CustomText(text: 'Fiyatı: 00.00₺', color: ColorConstants.bgColor);

  CustomText _rafYeri() =>
      CustomText(text: 'Raf Yeri: ', color: ColorConstants.bgColor);

  CustomContainerButton _searchButton() => CustomContainerButton(
      buttonText: LanguageService.choosenLanguage['key']!.ara!, onTap: () {});

  CustomTextField _searchStokName() => CustomTextField(
        controller: null,
        horizontalHeight: 0.04,
        verticalHeight: 0.01,
        sizeBottom: 0.02,
        sizeLeft: 0.02,
        sizeRight: 0.02,
        label: LanguageService.choosenLanguage['key']!.stokAdinaGoreAra!,
        labelStyle: true,
        isIcon: true,
        isIconTap: true,
        isIconOnTap: () {},
      );

  Container _cameraButton(BuildContext context) => Container(
        width: context.getSizeWidth(size: 0.2),
        height: context.getSizeHeight(size: 0.06),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: ColorConstants.buttonColor),
        child: CustomIconButton(
            icon: const Icon(CupertinoIcons.camera,
                color: ColorConstants.whiteColor),
            onPressed: () {}),
      );

  CustomTextField _searchStockNumber() => CustomTextField(
        controller: null,
        horizontalHeight: 0.04,
        verticalHeight: 0.01,
        sizeLeft: 0.02,
        sizeRight: 0.02,
        label: LanguageService.choosenLanguage['key']!.stokNoyaGoreAra!,
        labelStyle: true,
        isIcon: true,
        isIconTap: true,
        isIconOnTap: () {},
      );
}
