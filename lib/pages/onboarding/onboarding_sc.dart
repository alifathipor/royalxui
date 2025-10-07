import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royalxui/pages/onboarding/onboarding_ctrl.dart';
import 'package:royalxui/toolkit.dart' as t;
import 'package:royalxui/uikit.dart' as u;

class OnBoardingScreen extends GetView<OnBoardingController> {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: u.Text(
          t.LocaleConst.initialSetup.tr,
          fontSize: t.EnumFontSize.title,
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        return Column(
          children: [
            Expanded(
              child: Center(
                child: Text('Royal XUI', style: TextStyle(fontSize: 50)),
              ),
            ),
            u.ListTile(
              icon: t.Icons.language,
              title: t.LocaleConst.changeLanguage.tr,
              subtitle: controller.languageSwitchController.value
                  ? t.LocaleConst.fa.tr
                  : t.LocaleConst.en.tr,
              trailing: u.Switch(
                value: controller.languageSwitchController.value,
                onChanged: controller.setLanguageMode,
              ),
              width: t.Utils.isMobile(context)
                  ? t.Utils.size(context).width
                  : t.Utils.size(context).width / 2,
            ),
            u.ListTile(
              icon: t.Icons.brightness,
              title: t.LocaleConst.changeTheme.tr,
              subtitle: controller.themeSwitchController.value
                  ? t.LocaleConst.dark.tr
                  : t.LocaleConst.light.tr,
              trailing: u.Switch(
                value: controller.themeSwitchController.value,
                onChanged: controller.setThemeMode,
              ),
              width: t.Utils.isMobile(context)
                  ? t.Utils.size(context).width
                  : t.Utils.size(context).width / 2,
            ),
            u.ListTile(
              icon: t.Icons.colorLens,
              title: t.LocaleConst.changeColor.tr,
              subtitle: controller.themeCtrl.selectedColorName.value.tr,
              onTap: () => controller.showModalBtmsSelectedColor(context),
              trailing: CircleAvatar(
                backgroundColor: controller.themeCtrl.selectedColor,
                radius: 15,
              ),
              width: t.Utils.isMobile(context)
                  ? t.Utils.size(context).width
                  : t.Utils.size(context).width / 2,
            ),
            u.Button(
              actions: t.EnumActionsButtons.filledButton,
              onPressed: controller.start,
              child: u.Text(t.LocaleConst.start.tr),
            ),
            SizedBox(height: 30),
          ],
        );
      }),
    );
  }
}

class SelectableOptionListColors extends GetView<OnBoardingController> {
  const SelectableOptionListColors({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: controller.themeCtrl.colorOptions.entries.map((e) {
        return Column(
          children: [
            u.SelectableOption(
              text: e.key.tr,
              selected: controller.themeCtrl.selectedColor == e.value,
              onTap: () {
                controller.themeCtrl.setSelectedColor(e.key);
                Navigator.pop(context);
              },
            ),
            SizedBox(height: 10),
          ],
        );
        // MenuItemButton(
        //   onPressed: () {
        //     controller.themeCtrl.setSelectedColor(e.key);
        //     controller.menuCtrl.close();
        //     FocusScope.of(context).unfocus();
        //   },
        //   child: Row(
        //     children: [
        //       CircleAvatar(backgroundColor: e.value, radius: 10),
        //       SizedBox(width: 8),
        //       u.Text(e.key),
        //     ],
        //   ),
        // );
      }).toList(),

      // [
      //   u.SelectableOption(text: 'test', selected: false, onTap: () {}),
      //   u.SelectableOption(text: 'test2', selected: true, onTap: () {}),
      // ],
    );
  }
}
