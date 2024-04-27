import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:selpar/core/extensions/size_extension.dart';

class CustomProgressLottieWithoutScaffold extends StatelessWidget {
  const CustomProgressLottieWithoutScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/logo/logo_default.jpeg",
            filterQuality: FilterQuality.high,
            alignment: Alignment.center,
            fit: BoxFit.cover,
            width: context.getSizeWidth(size: 0.8),
          ),
          Lottie.asset('assets/lottie/circularProgress.json',
              filterQuality: FilterQuality.high,
              alignment: Alignment.center,
              fit: BoxFit.cover),
        ],
      ),
    );
  }
}
