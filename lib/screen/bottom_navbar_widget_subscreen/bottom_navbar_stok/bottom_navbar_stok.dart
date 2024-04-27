import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selpar/core/constants/color_constants.dart';
import 'package:selpar/core/extensions/padding_extension.dart';
import 'package:selpar/core/extensions/size_extension.dart';
import 'package:selpar/core/helper/custom_container_button/custom_container_button.dart';
import 'package:selpar/core/helper/custom_stok_listesi_list_view/custom_stok_listesi_list_view.dart';
import 'package:selpar/core/widgets/icon_button_widget.dart';
import 'package:selpar/core/widgets/textfield_widget.dart';
import 'package:selpar/service/language/language_service/language_service.dart';

import '../../../../../core/widgets/text_widget.dart';

class BottomNavbarStok extends StatelessWidget {
  const BottomNavbarStok({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomStokListesiListView(isAddingTitle: true);
  }
}
