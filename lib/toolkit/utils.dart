import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:universal_io/io.dart';
import 'package:royalxui/uikit.dart' as u;

class Utils {
  static bool get isPlatformWeb => kIsWeb;

  static bool get isPlatformAndroid => Platform.isAndroid;

  static bool get isPlatformIos => Platform.isIOS;

  static bool get isPlatformMobile => Platform.isAndroid || Platform.isIOS;

  static bool get isPlatformDesktop =>
      Platform.isWindows || Platform.isMacOS || Platform.isMacOS;
  static bool isDesktop(BuildContext context) => size(context).width > 1025;
  static bool isTaplet(BuildContext context) =>
      size(context).width > 768 && size(context).width < 1025;
  static bool isMobile(BuildContext context) => size(context).width < 768;

  static void mobileInit() {
    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //   statusBarColor: t.Colors.blue,
    // ));
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  static void onBack() {
    Get.back();
  }

  static Future<void> dbInit() async {
    await GetStorage.init();
  }

  static Size size(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static scrollList(GlobalKey key, {int milliseconds = 400}) =>
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: Duration(milliseconds: milliseconds),
      );

  // static Future<void> initWindow() async {
  //   await DesktopWindow.setWindowSize(const Size(1100, 700));
  //   await DesktopWindow.setMinWindowSize(const Size(900, 600));
  // }

  static Future<void> showModalBtms(
    BuildContext context, {
    required Widget child,
    double radius = 16,
    bool isDismissible = true,
    double heightFraction = 0.5,
  }) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: isDismissible,
      showDragHandle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(radius)),
      ),
      builder: (context) {
        final screenHeight = MediaQuery.of(context).size.height;
        final viewInsets = MediaQuery.of(context).viewInsets.bottom;
        return AnimatedPadding(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
          padding: EdgeInsets.only(bottom: viewInsets),
          child: Container(
            height: screenHeight * heightFraction, // 👈 کنترل ارتفاع
            padding: const EdgeInsets.symmetric(horizontal:  15),
            child: child,
          ),
        );
      },
    );
  }

  static showSnackBar({
    required u.SnackbarType type,
    String? text,
    Duration? duration,
  }) {
    showOverlay(
      (context, t) => u.SnackBar(message: text ?? '', t: t, type: type),
      duration: const Duration(milliseconds: 4000),
      curve: Curves.fastOutSlowIn,
    );
  }
}
