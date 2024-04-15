import 'package:flutter/material.dart';
import 'package:selpar/core/helper/custom_check_bill_widget/custom_check_bill_widget.dart';

import 'alinan_cek_senet_model/alinan_cek_senet_model.dart';

class AlinanCekSenet extends StatelessWidget {
  AlinanCekSenet({super.key});
  final AlinanCekSenetModel _cekSenetModel = AlinanCekSenetModel();
  @override
  Widget build(BuildContext context) {
    return CustomCheckBillWidget(
        pageTitle: 'Alınan Çek-Senet',
        firstContent: 'Burası Alınan Çek bölümü ',
        secondContent: 'Burası Alınan Senet Bölümü',
        firstSubTitle: 'Alınan Çek',
        secondSubTitle: 'Alınan Senet',
        finishDate: _cekSenetModel.sharedCalendarFinish,
        startDate: _cekSenetModel.sharedCalendarStart,
        showButtonOnTap: () {});
  }
}
