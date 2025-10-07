import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royalxui/toolkit.dart' as t;
import 'package:royalxui/toolkit/theme.dart';
// import 'package:package_info_plus/package_info_plus.dart';

class GlobalController extends FullLifeCycleController {
  // PackageInfo? packageInfo;

  // Future<void> getPackageInfo() async {
  //   packageInfo = await PackageInfo.fromPlatform();
  // }

  // @override
  // Future<void> onInit() async {
  //   await getPackageInfo();
  //   super.onInit();
  // }

  final currentLocale = Locale(t.Constants.fa).obs;
  void languageSave(Locale mode) {
    if (t.DataBase.hasData(t.Constants.languageDB)) {
      t.DataBase.remove(t.Constants.languageDB);
    }
    if (mode == Locale(t.Constants.en)) {
      t.DataBase.write(t.Constants.languageDB, t.Constants.en);
    } else {
      t.DataBase.write(t.Constants.languageDB, t.Constants.fa);
    }
  }

  void themeSave(ThemeMode mode) {
    if (t.DataBase.hasData(t.Constants.themeDB)) {
      t.DataBase.remove(t.Constants.themeDB);
    }
    if (mode == ThemeMode.dark) {
      t.DataBase.write(t.Constants.themeDB, t.Constants.dark);
    } else {
      t.DataBase.write(t.Constants.themeDB, t.Constants.light);
    }
  }

  void colorSave(String color) {
    if (t.DataBase.hasData(t.Constants.colorDB)) {
      t.DataBase.remove(t.Constants.colorDB);
    }
    t.DataBase.write(t.Constants.colorDB, color);
  }

  @override
  Future<void> onInit() async {
    // t.DataBase.remove(t.Constants.languageDB);
    if (t.DataBase.hasData(t.Constants.themeDB)) {
      if (await t.DataBase.read(t.Constants.themeDB) == t.Constants.dark) {
        Get.changeThemeMode(ThemeMode.dark);
      } else {
        Get.changeThemeMode(ThemeMode.light);
      }
    }
    if (t.DataBase.hasData(t.Constants.languageDB)) {
      if (await t.DataBase.read(t.Constants.languageDB) == t.Constants.en) {
        Get.updateLocale(Locale(t.Constants.en));
        currentLocale.value = Locale(t.Constants.en);
      } else {
        Get.updateLocale(Locale(t.Constants.fa));
        currentLocale.value = Locale(t.Constants.fa);
      }
    }
    if (t.DataBase.hasData(t.Constants.colorDB)) {
      final themeCtrl = Get.find<ThemeController>();
      themeCtrl.selectedColorName.value = await t.DataBase.read(
        t.Constants.colorDB,
      );
    }
    Get.forceAppUpdate();
    super.onInit();
  }
}
