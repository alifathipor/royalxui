import 'package:get/get.dart';
import 'package:royalxui/pages/auth/auth_ctrl.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController());
  }
}
