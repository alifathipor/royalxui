import 'package:get/get.dart';
import 'package:royalxui/pages/main/settings/settings_ctrl.dart';

class SettingsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SettingsController>(SettingsController());
  }
}
