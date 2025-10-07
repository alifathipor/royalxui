import 'package:get/get.dart';
import 'package:royalxui/pages/splashScreen/splash_screen_ctrl.dart';

class SplashScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SplashScreenController>(SplashScreenController());
  }
}
