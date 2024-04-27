import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:mobx/mobx.dart';
import 'package:selpar/core/constants/color_constants.dart';

import 'package:selpar/core/helper/custom_cari_listesi_listView/custom_cari_listesi_list_view.dart';
import 'package:selpar/core/widgets/appbar_widget.dart';
import 'package:selpar/core/widgets/icon_button_widget.dart';
import 'package:selpar/screen/navigation_bar_items/finance_screen/subscreen/cari_listesi/cari_listesi_model/cari_listesi_model.dart';
import 'package:selpar/service/language/language_service/language_service.dart';

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
          body: CustomCariListesiListView(isAddingTitle: false)),
    );
  }
}
