import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:selpar/core/extensions/navigate_effective_extension.dart';

part 'custom_progress_lottie_model.g.dart';

class CustomProgresslottieModel = _CustomProgresslottieModelBase
    with _$CustomProgresslottieModel;

abstract class _CustomProgresslottieModelBase with Store {
  Future<void> initialize(
      {required BuildContext context, required Widget widget}) async {
    await Future.delayed(
        const Duration(seconds: 1),
        () async => widget == const SizedBox()
            ? {}
            : await widget.navigateEffectiveToPushReplacement(
                context: context));
  }
}
