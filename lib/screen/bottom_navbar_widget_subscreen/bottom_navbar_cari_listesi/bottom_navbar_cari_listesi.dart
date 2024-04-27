import 'package:flutter/material.dart';
import 'package:selpar/core/constants/color_constants.dart';
import 'package:selpar/core/helper/custom_cari_listesi_listView/custom_cari_listesi_list_view.dart';
import 'package:selpar/core/widgets/label_text_widget.dart';
import 'package:selpar/core/widgets/text_widget.dart';
import 'package:selpar/service/language/language_service/language_service.dart';

class BottomNavbarCariListesi extends StatelessWidget {
  const BottomNavbarCariListesi({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCariListesiListView(isAddingTitle: true);
  }
}
