import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selpar/core/extensions/padding_extension.dart';
import 'package:selpar/core/extensions/size_extension.dart';

import '../../../../../core/constants/color_constants.dart';
import '../../../../../core/widgets/appbar_widget.dart';
import '../../../../../core/widgets/icon_button_widget.dart';
import '../../../../../core/widgets/textfield_widget.dart';

class OrjinalStokListesi extends StatelessWidget {
  const OrjinalStokListesi({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Orjinal Stok Listesi',
          leading: CustomIconButton(
              icon: const Icon(CupertinoIcons.back,
                  color: ColorConstants.buttonColor),
              onPressed: () => Navigator.of(context).pop()),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(
              horizontal: context.getSizeWidth(size: 0.04)),
          children: [
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    controller: null,
                    horizontalHeight: 0.04,
                    verticalHeight: 0.01,
                    sizeLeft: 0.04,
                    sizeRight: 0.04,
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
          ],
        ),
      ),
    );
  }
}
