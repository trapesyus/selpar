import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selpar/core/constants/color_constants.dart';
import 'package:selpar/core/constants/images_home_screen_constants.dart';
import 'package:selpar/core/extensions/padding_extension.dart';
import 'package:selpar/core/extensions/size_extension.dart';
import 'package:selpar/core/widgets/icon_button_widget.dart';
import 'package:selpar/core/widgets/textfield_widget.dart';
import 'package:selpar/service/language/language_service/language_service.dart';
import 'package:simple_icons/simple_icons.dart';

import '../../../../../core/widgets/text_widget.dart';

class BottomNavbarCariListesi extends StatelessWidget {
  const BottomNavbarCariListesi({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        CustomText(
            text: LanguageService.choosenLanguage['key']!.cariListesi!,
            fontSize: 16,
            color: ColorConstants.defaultTextColor,
            isBold: true),
        CustomTextField(
          controller: null,
          horizontalHeight: 0.04,
          verticalHeight: 0.01,
          sizeBottom: 0.02,
          sizeLeft: 0.02,
          sizeRight: 0.02,
          sizeTop: 0.02,
          label: "Cari'ye göre arama yapın",
          labelStyle: true,
        ),
        SizedBox(
          height: context.getSizeHeight(size: 0.7),
          width: context.getSizeWidth(size: 0.94),
          child: ListView.separated(
            separatorBuilder: (context, index) => SizedBox(
              height: context.getSizeHeight(size: 0.02),
            ),
            itemCount: 10,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => Column(
              children: [
                Container(
                  height: context.getSizeHeight(size: 0.2),
                  decoration: BoxDecoration(
                      color: ColorConstants.hintDarkContainerColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: CustomText(
                            text: 'Plaka Başlığı',
                            color: ColorConstants.defaultTextColor),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomText(
                                text: 'Alacak / Verecek: ',
                                isBold: false,
                                color: ColorConstants.bgColor),
                            CustomText(
                              text: '1166',
                              color: ColorConstants.bgColor,
                            ),
                            Image.asset(
                                ImagesHomeScreenConstants.imageTurkLirasi,
                                scale: 2.0,
                                filterQuality: FilterQuality.high,
                                fit: BoxFit.cover)
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CustomIconButton(
                                icon: const Icon(
                                  CupertinoIcons.phone,
                                  color: ColorConstants.bgColor,
                                ),
                                onPressed: () {},
                              ),
                              CustomIconButton(
                                  icon: const Icon(SimpleIcons.whatsapp,
                                      color: ColorConstants.bgColor),
                                  onPressed: () {}),
                              CustomIconButton(
                                icon: const Icon(
                                  Icons.person_search_outlined,
                                  color: ColorConstants.bgColor,
                                ),
                                onPressed: () {},
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              _cariListButton(
                                      context: context,
                                      buttonName: 'Ekstra',
                                      onTap: () {})
                                  .getPaddingOnly(
                                      context: context, right: 0.02),
                              _cariListButton(
                                  context: context,
                                  buttonName: 'Detay',
                                  onTap: () {})
                            ],
                          )
                        ],
                      ).getPadding(
                          context: context, sizeWidth: 0.02, sizeHeight: 0)
                    ],
                  ),
                )
              ],
            ),
          ),
        ).getPaddingOnly(context: context, left: 0.02, right: 0.02)
      ],
    ).getPadding(context: context, sizeWidth: 0.02, sizeHeight: 0);
  }

  Padding _cariListButton(
      {required BuildContext context,
      required String buttonName,
      required Function() onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: ColorConstants.hintContainerColor),
        width: context.getSizeWidth(size: 0.2),
        height: context.getSizeHeight(size: 0.05),
        child: CustomText(
            text: buttonName,
            isBold: true,
            color: ColorConstants.defaultTextColor),
      ),
    ).getPaddingOnly(context: context, bottom: 0.01);
  }
}
