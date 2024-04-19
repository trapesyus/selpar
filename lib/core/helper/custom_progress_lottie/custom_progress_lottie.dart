import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mobx/mobx.dart';
import 'package:selpar/core/widgets/appbar_widget.dart';

import 'custom_progress_lottie_model/custom_progress_lottie_model.dart';

class CustomProgressLottie extends StatelessWidget {
  final BuildContext context;
  Widget? widget;
  CustomProgressLottie({super.key, required this.context, this.widget}) {
    reaction(
        (_) async => await _customProgressLottieModel.initialize(
            context: context, widget: widget ?? const SizedBox()),
        (_) {});
  }
  final CustomProgresslottieModel _customProgressLottieModel =
      CustomProgresslottieModel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: const CustomAppBar(
            leading: SizedBox(),
            title: 'Selpar',
            titleStyle: true,
            centerTitle: true),
        body: Center(
          child: Lottie.asset('assets/lottie/circularProgress.json',
              filterQuality: FilterQuality.high,
              alignment: Alignment.center,
              fit: BoxFit.cover),
        ),
      ),
    );
  }
}
