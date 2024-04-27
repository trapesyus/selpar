import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mobx/mobx.dart';
import 'package:selpar/core/extensions/size_extension.dart';
import 'package:selpar/core/helper/custom_progress_lottie/custom_progress_lottie_without_scaffold/custom_progress_lottie_without_scaffold.dart';
import 'package:selpar/core/widgets/appbar_widget.dart';

import 'custom_progress_lottie_model/custom_progress_lottie_model.dart';

// ignore: must_be_immutable
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
    return const SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: CustomAppBar(
              leading: SizedBox(),
              title: 'Selpar',
              titleStyle: true,
              centerTitle: true),
          body: CustomProgressLottieWithoutScaffold()),
    );
  }
}
