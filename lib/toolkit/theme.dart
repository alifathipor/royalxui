import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royalxui/navigations/global/global_ctrl.dart';
import 'package:royalxui/toolkit.dart' as t;

class ThemeController extends GetxController {
  final colorOptions = {
    t.LocaleConst.teal.tr: const Color(0xFF009688),
    t.LocaleConst.deepPurple.tr: Color(0xff6750a4),
    t.LocaleConst.blue.tr: const Color(0xFF2196F3),
    t.LocaleConst.royal.tr: const Color(0xFF3F51B5),
  };

  var selectedColorName = t.LocaleConst.royal.obs;
  Color get selectedColor => colorOptions[selectedColorName.value] ?? Color(0xFF3F51B5);

  ThemeData getTheme(Brightness brightness) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: selectedColor,
      brightness: brightness,
    );
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.surface,
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        elevation: 0,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorScheme.surfaceContainerHighest,
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(12),
        //   borderSide: BorderSide.none,
        // ),
      ),
    );
  }

  void setSelectedColor(String value) {
    final globalCtrl = Get.find<GlobalController>();
    selectedColorName.value = value;
    globalCtrl.colorSave(value);
    Get.forceAppUpdate();
  }
}