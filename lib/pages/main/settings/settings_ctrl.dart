import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royalxui/navigations/global/global_ctrl.dart';
import 'package:royalxui/toolkit.dart' as t;
import 'package:royalxui/toolkit/theme.dart';

class SettingsController extends GetxController {
  final globalCtrl = Get.find<GlobalController>();
  final themeCtrl = Get.find<ThemeController>();

  RxBool themeSwitchController = false.obs;
  RxBool languageSwitchController = false.obs;

  final menuCtrl = MenuController();

  void changeLanguageMode(bool value) {
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

  void changeThemeMode(bool value) {
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
    }
    super.onInit();
  }
}
