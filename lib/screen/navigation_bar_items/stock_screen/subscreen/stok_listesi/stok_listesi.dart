import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selpar/core/constants/color_constants.dart';
import 'package:selpar/core/helper/custom_stok_listesi_list_view/custom_stok_listesi_list_view.dart';
import 'package:selpar/core/widgets/appbar_widget.dart';
import 'package:selpar/core/widgets/icon_button_widget.dart';
import 'package:selpar/service/language/language_service/language_service.dart';

class StokListesi extends StatelessWidget {
  const StokListesi({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: CustomAppBar(
              title: LanguageService.choosenLanguage['key']!.stokListesi!,
              leading: CustomIconButton(
                  icon: const Icon(CupertinoIcons.back,
                      color: ColorConstants.buttonColor),
                  onPressed: () => Navigator.of(context).pop()),
            ),
            body: const CustomStokListesiListView(isAddingTitle: false)));
  }
}
