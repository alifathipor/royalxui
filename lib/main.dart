import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:royalxui/navigations/routes/pages.dart';
import 'package:royalxui/navigations/global/global_ctrl.dart';
import 'package:royalxui/toolkit/theme.dart';
import 'package:royalxui/toolkit/locale.dart' as local;
import 'package:royalxui/toolkit.dart' as t;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GlobalController());
    final themeController = Get.put(ThemeController());
    return Obx(
      () => GetMaterialApp(
        initialRoute: t.Routes.splashScreen,
        translations: local.Locale(),
        locale: controller.currentLocale.value,
        fallbackLocale: Locale(t.Constants.fa),
        theme: themeController.getTheme(Brightness.light),
        darkTheme: themeController.getTheme(Brightness.dark),
        themeMode: ThemeMode.system,
        getPages: Pages.routes,
      ),
    );
  }
}
