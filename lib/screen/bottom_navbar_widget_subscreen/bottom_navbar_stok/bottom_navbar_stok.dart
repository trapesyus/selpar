import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selpar/core/constants/color_constants.dart';
import 'package:selpar/core/extensions/padding_extension.dart';
import 'package:selpar/core/extensions/size_extension.dart';
import 'package:selpar/core/helper/custom_container_button/custom_container_button.dart';
import 'package:selpar/core/widgets/icon_button_widget.dart';
import 'package:selpar/core/widgets/textfield_widget.dart';
import 'package:selpar/service/language/language_service/language_service.dart';

import '../../../../../core/widgets/text_widget.dart';

class BottomNavbarStok extends StatelessWidget {
  const BottomNavbarStok({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      children: [
        CustomText(
                text: LanguageService.choosenLanguage['key']!.stokListesi!,
                color: ColorConstants.defaultTextColor,
                isBold: true,
                fontSize: 16)
            .getPaddingOnly(context: context, bottom: 0.02),
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                controller: null,
                horizontalHeight: 0.04,
                verticalHeight: 0.01,
                sizeLeft: 0.02,
                sizeRight: 0.02,
                label: "Stok No'ya göre ara",
                labelStyle: true,
                isIcon: true,
                isIconTap: true,
                isIconOnTap: () {},
              ),
            ),
            Container(
              width: context.getSizeWidth(size: 0.2),
              height: context.getSizeHeight(size: 0.06),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: ColorConstants.buttonColor),
              child: CustomIconButton(
                  icon: const Icon(CupertinoIcons.camera,
                      color: ColorConstants.whiteColor),
                  onPressed: () {}),
            ).getPaddingOnly(context: context, bottom: 0.015),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                controller: null,
                horizontalHeight: 0.04,
                verticalHeight: 0.01,
                sizeBottom: 0.02,
                sizeLeft: 0.02,
                sizeRight: 0.02,
                label: "Stok adına göre ara",
                labelStyle: true,
                isIcon: true,
                isIconTap: true,
                isIconOnTap: () {},
              ),
            ),
            CustomContainerButton(buttonText: 'Ara', onTap: () {})
                .getPaddingOnly(context: context, bottom: 0.02)
          ],
        ),
        SizedBox(
          height: context.getSizeHeight(size: 0.7),
          child: ListView.separated(
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
                  CustomText(
                          text: 'Pancur Ön Tampon',
                          color: ColorConstants.defaultTextColor)
                      .getPaddingOnly(context: context, top: 0.02),
                  Row(children: [
                    const CircleAvatar()
                        .getPaddingOnly(context: context, right: 0.04),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                                  text: 'Fiyatı: 00.00₺',
                                  color: ColorConstants.bgColor)
                              .getPaddingOnly(context: context, bottom: 0.02),
                          CustomText(
                              text: 'Raf Yeri: ', color: ColorConstants.bgColor)
                        ])
                  ]).getPaddingOnly(context: context, left: 0.04),
                  const SizedBox()
                ],
              ),
            ),
          ),
        )
      ],
    ).getPadding(context: context, sizeWidth: 0.04, sizeHeight: 0);
  }
}
