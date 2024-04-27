import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:selpar/core/constants/color_constants.dart';
import 'package:selpar/core/extensions/size_extension.dart';
import 'package:selpar/core/helper/custom_progress_lottie/custom_progress_lottie.dart';
import 'package:selpar/core/widgets/appbar_widget.dart';
import 'package:selpar/core/widgets/icon_button_widget.dart';
import 'package:selpar/core/widgets/text_widget.dart';
import 'package:selpar/screen/language_screen/language_screen_model/language_screen_model.dart';
import 'package:selpar/service/language/language_service/language_service.dart';

class LanguageScreen extends StatelessWidget {
  final bool isPreloadingScreen;
  LanguageScreen({super.key, required this.isPreloadingScreen}) {
    reaction((_) async => await _languageScreenModel.initialize(), (_) {});
  }
  final LanguageScreenModel _languageScreenModel = LanguageScreenModel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _appBar(context),
        body: _languageScreenModel.isSelectedLanguage
            ? Center(
                child: Container(
                  height: context.getSizeHeight(size: 0.5),
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(
                      horizontal: context.getSizeWidth(size: 0.04)),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: ColorConstants.hintDarkContainerColor),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _div(),
                      Observer(
                        builder: (_) => RadioListTile<String>(
                          activeColor: ColorConstants.buttonColor,
                          title: CustomText(
                            text:
                                LanguageService.choosenLanguage['key']!.turkce!,
                            color: ColorConstants.bgColor,
                            fontSize: 16,
                          ),
                          value:
                              LanguageService.choosenLanguage['key']!.turkce!,
                          groupValue: _languageScreenModel.selectedLanguage,
                          onChanged: (value) =>
                              _languageScreenModel.setSelectedLanguage(
                                  isPreloadingScreen: isPreloadingScreen,
                                  language: value!,
                                  context: context),
                        ),
                      ),
                      _div(),
                      Observer(
                        builder: (_) => RadioListTile<String>(
                          activeColor: ColorConstants.buttonColor,
                          title: CustomText(
                            text: LanguageService
                                .choosenLanguage['key']!.ingilizce!,
                            color: ColorConstants.bgColor,
                            fontSize: 16,
                          ),
                          value: LanguageService
                              .choosenLanguage['key']!.ingilizce!,
                          groupValue: _languageScreenModel.selectedLanguage,
                          onChanged: (value) =>
                              _languageScreenModel.setSelectedLanguage(
                                  isPreloadingScreen: isPreloadingScreen,
                                  language: value!,
                                  context: context),
                        ),
                      ),
                      _div(),
                      Observer(
                        builder: (_) => RadioListTile<String>(
                          activeColor: ColorConstants.buttonColor,
                          title: CustomText(
                            text: LanguageService
                                .choosenLanguage['key']!.almanca!,
                            color: ColorConstants.bgColor,
                            fontSize: 16,
                          ),
                          value:
                              LanguageService.choosenLanguage['key']!.almanca!,
                          groupValue: _languageScreenModel.selectedLanguage,
                          onChanged: (value) =>
                              _languageScreenModel.setSelectedLanguage(
                                  isPreloadingScreen: isPreloadingScreen,
                                  language: value!,
                                  context: context),
                        ),
                      ),
                      _div(),
                      Observer(
                        builder: (_) => RadioListTile<String>(
                          activeColor: ColorConstants.buttonColor,
                          title: CustomText(
                            text:
                                LanguageService.choosenLanguage['key']!.rusca!,
                            color: ColorConstants.bgColor,
                            fontSize: 16,
                          ),
                          value: LanguageService.choosenLanguage['key']!.rusca!,
                          groupValue: _languageScreenModel.selectedLanguage,
                          onChanged: (value) =>
                              _languageScreenModel.setSelectedLanguage(
                                  isPreloadingScreen: isPreloadingScreen,
                                  language: value!,
                                  context: context),
                        ),
                      ),
                      _div(),
                      Observer(
                        builder: (_) => RadioListTile<String>(
                          activeColor: ColorConstants.buttonColor,
                          title: CustomText(
                            text: LanguageService
                                .choosenLanguage['key']!.flemenkce!,
                            color: ColorConstants.bgColor,
                            fontSize: 16,
                          ),
                          value: LanguageService
                              .choosenLanguage['key']!.flemenkce!,
                          groupValue: _languageScreenModel.selectedLanguage,
                          onChanged: (value) =>
                              _languageScreenModel.setSelectedLanguage(
                                  isPreloadingScreen: isPreloadingScreen,
                                  language: value!,
                                  context: context),
                        ),
                      ),
                      _div()
                    ],
                  ),
                ),
              )
            : CustomProgressLottie(context: context),
      ),
    );
  }

  Divider _div() {
    return const Divider(
        thickness: 2, color: ColorConstants.hintDarkContainerColor);
  }

  CustomAppBar _appBar(BuildContext context) {
    return CustomAppBar(
      leading: CustomIconButton(
          icon: const Icon(CupertinoIcons.back,
              color: ColorConstants.buttonColor),
          onPressed: () => Navigator.of(context).pop()),
      title: LanguageService.choosenLanguage['key']!.dilSeciniz!,
      titleStyle: true,
    );
  }
}
