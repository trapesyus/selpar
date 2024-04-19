import 'package:flutter/material.dart';
import 'package:selpar/core/constants/color_constants.dart';
import 'package:selpar/core/extensions/padding_extension.dart';
import 'package:selpar/core/extensions/size_extension.dart';
import 'package:selpar/core/helper/custom_list_page_widget/custom_list_page_widget.dart';
import 'package:selpar/core/widgets/text_widget.dart';
import 'package:selpar/core/widgets/textfield_widget.dart';
import 'package:selpar/screen/home_screen/subscreen/stok_ihtiyac_raporu/stok_ihtiyac_raporu_model/stok_ihtiyac_raporu_model.dart';

class StokIhtiyacRaporu extends StatelessWidget {
  StokIhtiyacRaporu({super.key});
  final StokIhtiyacRaporuModel _ihtiyacRaporuModel = StokIhtiyacRaporuModel();
  @override
  Widget build(BuildContext context) {
    return CustomListPageWidget(
      pageTitle: 'Stok İhtiyaç Raporu',
      finishDate: _ihtiyacRaporuModel.sharedCalendarFinish,
      startDate: _ihtiyacRaporuModel.sharedCalendarStart,
      onTap: () {},
      child: Column(
        children: [
          Row(children: [
            Expanded(
                child: CustomTextField(
              controller: null,
              horizontalHeight: 0.04,
              verticalHeight: 0.01,
              sizeBottom: 0.02,
              sizeTop: 0.02,
              sizeRight: 0.02,
              label: 'Stok No Girin',
              labelStyle: true,
            ).getPaddingOnly(context: context, right: 0.02)),
            Expanded(
                child: CustomTextField(
              controller: null,
              horizontalHeight: 0.04,
              verticalHeight: 0.01,
              sizeBottom: 0.02,
              sizeTop: 0.02,
              sizeLeft: 0.02,
              label: 'Ürün Adı Girin',
              labelStyle: true,
            ))
          ]).getPaddingOnly(context: context, bottom: 0.02),
          IntrinsicHeight(
            child: Row(
              children: [
                VerticalDivider(
                    width: context.getSizeWidth(size: 0.02),
                    thickness: 2,
                    color: ColorConstants.hintDarkContainerColor),
                Expanded(
                  child: CustomText(
                      text: 'Stok Numarası',
                      color: ColorConstants.defaultTextColor),
                ),
                VerticalDivider(
                    width: context.getSizeWidth(size: 0.02),
                    thickness: 2,
                    color: ColorConstants.hintDarkContainerColor),
                Expanded(
                  child: CustomText(
                      text: 'Stok Adı', color: ColorConstants.defaultTextColor),
                ),
                VerticalDivider(
                    width: context.getSizeWidth(size: 0.02),
                    thickness: 2,
                    color: ColorConstants.hintDarkContainerColor),
                Expanded(
                  child: CustomText(
                      text: 'İhtiyaç Adedi',
                      color: ColorConstants.defaultTextColor),
                ),
                VerticalDivider(
                    width: context.getSizeWidth(size: 0.02),
                    thickness: 2,
                    color: ColorConstants.hintDarkContainerColor),
                Expanded(
                  child: CustomText(
                      text: 'Mevcut', color: ColorConstants.defaultTextColor),
                ),
                VerticalDivider(
                    width: context.getSizeWidth(size: 0.02),
                    thickness: 2,
                    color: ColorConstants.hintDarkContainerColor),
              ],
            ),
          ),
          const Divider(
              thickness: 2, color: ColorConstants.hintDarkContainerColor),
        ],
      ),
    );
  }
}
