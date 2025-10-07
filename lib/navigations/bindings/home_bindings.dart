import 'package:get/get.dart';
import 'package:royalxui/pages/main/home/home_ctrl.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
  }
}
