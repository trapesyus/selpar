import 'package:flutter/material.dart';
import 'package:selpar/core/helper/custom_check_bill_widget/custom_check_bill_widget.dart';

import 'verilen_cek_senet_model/verilen_cek_senet_model.dart';

class VerilenCekSenet extends StatelessWidget {
  VerilenCekSenet({super.key});
  final VerilenCekSenetModel _verilenCekSenetModel = VerilenCekSenetModel();
  @override
  Widget build(BuildContext context) {
    return CustomCheckBillWidget(
        pageTitle: 'Verilen Çek-Senet',
        firstContent: 'Burası Verilen Çek Bölümü',
        secondContent: 'Burası Verilen Senet Bölümü',
        firstSubTitle: 'Verilen Çek',
        secondSubTitle: 'Verilen Senet',
        showButtonOnTap: () {},
        startDate: _verilenCekSenetModel.sharedCalendarStart,
        finishDate: _verilenCekSenetModel.sharedCalendarFinish);
  }
}
