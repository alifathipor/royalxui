import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royalxui/navigations/global/global_ctrl.dart';
import 'package:royalxui/pages/onboarding/onboarding_sc.dart';
import 'package:royalxui/toolkit.dart' as t;
import 'package:royalxui/toolkit/theme.dart';

class OnBoardingController extends GetxController {
  final themeCtrl = Get.find<ThemeController>();
  final globalCtrl = Get.find<GlobalController>();

  RxBool themeSwitchController = false.obs;
  RxBool languageSwitchController = false.obs;

  final menuCtrl = MenuController();

  void selectColor(String value) {
    themeCtrl.setSelectedColor(value);
  }

  void setLanguageMode(bool value) {
    if (value) {
      languageSwitchController.value = true;
      Get.updateLocale(Locale(t.Constants.fa));
      globalCtrl.currentLocale.value = Locale(t.Constants.fa);
      globalCtrl.languageSave(Locale(t.Constants.fa));
    } else {
      languageSwitchController.value = false;
      Get.updateLocale(Locale(t.Constants.en));
      globalCtrl.currentLocale.value = Locale(t.Constants.en);
      globalCtrl.languageSave(Locale(t.Constants.en));
    }
  }

  void setThemeMode(bool value) {
    if (value) {
      themeSwitchController.value = true;
      Get.changeThemeMode(ThemeMode.dark);
      globalCtrl.themeSave(ThemeMode.dark);
    } else {
      themeSwitchController.value = false;
      Get.changeThemeMode(ThemeMode.light);
      globalCtrl.themeSave(ThemeMode.light);
    }
    Get.forceAppUpdate();
  }

  @override
  Future<void> onInit() async {
    if (t.DataBase.hasData(t.Constants.themeDB)) {
      if (await t.DataBase.read(t.Constants.themeDB) == t.Constants.dark) {
        themeSwitchController.value = true;
      } else {
        themeSwitchController.value = false;
      }
    }
    if (t.DataBase.hasData(t.Constants.languageDB)) {
      if (await t.DataBase.read(t.Constants.languageDB) == t.Constants.en) {
        languageSwitchController.value = false;
      } else {
        languageSwitchController.value = true;
      }
    } else {
      languageSwitchController.value = true;
    }
    super.onInit();
  }

  showModalBtmsSelectedColor(BuildContext context) {
    t.Utils.showModalBtms(context, child: SelectableOptionListColors());
  }

  void start() {
    Get.offNamed(t.Routes.authScreen);
  }
}
