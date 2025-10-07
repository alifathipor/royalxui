import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royalxui/pages/main/settings/settings_ctrl.dart';
import 'package:royalxui/uikit.dart' as u;
import 'package:royalxui/toolkit.dart' as t;

class SettingsScreen extends GetView<SettingsController> {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            u.ListTile(
              icon: t.Icons.brightness,
              title: t.LocaleConst.changeTheme.tr,
              subtitle: controller.themeSwitchController.value
                  ? t.LocaleConst.dark.tr
                  : t.LocaleConst.light.tr,
              trailing: u.Switch(
                value: controller.themeSwitchController.value,
                onChanged: controller.changeThemeMode,
              ),
            ),
            SizedBox(height: 10),
            u.ListTile(
              icon: t.Icons.language,
              title: t.LocaleConst.changeLanguage.tr,
              subtitle: controller.languageSwitchController.value
                  ? t.LocaleConst.fa.tr
                  : t.LocaleConst.en.tr,
              trailing: u.Switch(
                value: controller.languageSwitchController.value,
                onChanged: controller.changeLanguageMode,
              ),
            ),
            SizedBox(height: 10),
            InkWell(
              onTap: () {
                controller.menuCtrl.open();
              },
              focusColor: Colors.transparent,
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              child: u.ListTile(
                icon: t.Icons.colorLens,
                title: controller.themeCtrl.selectedColorName.value.tr,
                subtitle: t.LocaleConst.changeColor.tr,
                trailing: MenuAnchor(
                  controller: controller.menuCtrl,
                  builder: (_, ctrl, __) => IconButton(
                    icon: CircleAvatar(
                      backgroundColor: controller.themeCtrl.selectedColor,
                    ),
                    onPressed: () => ctrl.isOpen ? ctrl.close() : ctrl.open(),
                  ),
                  menuChildren: controller.themeCtrl.colorOptions.entries.map((
                    e,
                  ) {
                    return MenuItemButton(
                      onPressed: () {
                        controller.themeCtrl.setSelectedColor(e.key);
                        controller.menuCtrl.close();
                        FocusScope.of(context).unfocus();
                      },
                      child: Row(
                        children: [
                          CircleAvatar(backgroundColor: e.value, radius: 10),
                          SizedBox(width: 8),
                          u.Text(e.key),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
