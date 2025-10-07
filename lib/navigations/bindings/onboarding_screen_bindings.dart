import 'package:get/get.dart';
import 'package:royalxui/pages/onboarding/onboarding_ctrl.dart';

class OnBoardingBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<OnBoardingController>(OnBoardingController());
  }
}
