import 'package:get/get.dart';
import 'package:royalxui/toolkit.dart' as t;

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 3), () {
      checkOnboarding();
    });
    super.onInit();
  }

  Future<void> checkOnboarding() async {
    if (t.DataBase.hasData(t.Constants.checkOnboarding)) {
      // Get.offNamed(t.Routes.authScreen);
       Get.offNamed(t.Routes.onBoardingScreen);
    } else {
      Get.offNamed(t.Routes.onBoardingScreen);
    }
  }
}
