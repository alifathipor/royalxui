import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:royalxui/pages/auth/auth_md.dart' as md;
// import 'package:royalxui/pages/auth/auth_rp.dart' as rp;
import 'package:royalxui/toolkit.dart' as t;

class AuthController extends GetxController {
  var authScreensValue = t.EnumAuthScreensType.signIn.obs;

  final emailFocus = FocusNode();
  final passFocus = FocusNode();
  final parentTagFocus = FocusNode();

  TextEditingController emailCtrl = TextEditingController(text: '');
  TextEditingController verifyOTPCtrl = TextEditingController(text: '');
  TextEditingController parentTagCtrl = TextEditingController(text: '');

  final menuCtrl = MenuController();

  var isLoadings = false.obs;
  var isError = false.obs;
  CancelToken cancelToken = CancelToken();

  // md.AuthResponseModel? res;

  // md.AppUser? users;

  RxnString emailErr = RxnString();
  RxnString parentTagErr = RxnString();

  void emailErrSetter(String value) {
    if (value != '') {
      emailErr.value = null;
    }
  }

  void parentTagErrSetter(String value) {
    if (value != '') {
      parentTagErr.value = null;
    }
  }

  bool validations() {
    var value = true;
    if (emailCtrl.text.isEmpty || parentTagCtrl.text.isEmpty) {
      emailErr.value = t.LocaleConst.emailCannotBeEmpty;
      parentTagErr.value = t.LocaleConst.parentTagCannotBeEmpty;
      value = false;
    }
    return value;
  }

  // Future<md.ConfirmPd> confirmDataBinder() async {
  //   return md.ConfirmPd(
  //     userName: await t.DataBase.read(t.Constants.userName),
  //     hashId: await t.DataBase.read(t.Constants.hashId),
  //     confirmCode: confirmationCodeCtrl.text,
  //   );
  // }

  Future<void> registerEmployee(
    String email,
    String parentTag,
    BuildContext context,
  ) async {
    if (validations()) {
      try {
        isLoadings.value = true;
        isError.value = false;
        cancelToken = CancelToken();
        if (email.isEmpty || parentTag.isEmpty) {
          throw ("Field are required");
        }
        // await rp.postSignInOtp(
        //   cancelToken: cancelToken,
        //   retryRequest: () => registerEmployee(email, parentTag, context),
        //   body:null
        //   //  md.OtpRequestModel(email: email, createUser: true),
        // );
      } catch (e) {
        isError.value = true;
      }
      isLoadings.value = false;
      if (!isError.value) {
        authScreensValue.value = t.EnumAuthScreensType.verifyOTP;
      }
    }
  }

  Future<void> verifyEmployee() async {
    try {
      isLoadings.value = true;
      isError.value = false;
      cancelToken = CancelToken();
      if (emailCtrl.text.isEmpty || verifyOTPCtrl.text.isEmpty) {
        throw ("Field are required");
      }
      // res = await rp.postOtpVerify(
      //   cancelToken: cancelToken,
      //   retryRequest: verifyEmployee,
      //   body: null
      //   // md.OtpVerifyRequestModel(
      //   //   email: emailCtrl.text,
      //   //   token: verifyOTPCtrl.text,
      //   // ),
      // );
    } catch (e) {
      isError.value = true;
    }
    isLoadings.value = false;
    if (!isError.value) {
      authScreensValue.value = t.EnumAuthScreensType.signIn;
      // t.DataBase.write(
      //   t.Constants.token,
      //   _supabase.auth.currentSession!.accessToken,
      // );
      Get.toNamed(t.Routes.homeScreen);
      // users = md.AppUser(
      //   id: res!.user.id,
      //   email: emailCtrl.text,
      //   parentTag: parentTagCtrl.text,
      //   tag: await generateUniqueTag(),
      //   createAt: DateTime.now(),
      //   customerLevel: 'basic',
      //   discountPercent: 0,
      //   isActive: true,
      //   role: 'costumer',
      //   sellerLevel: 'basic',
      //   wallet: 0,
      //   walletTotalTopup: 0,
      // );
      await postUser();
    }
  }

  Future<void> postUser() async {
    try {
      isLoadings.value = true;
      isError.value = false;
      cancelToken = CancelToken();
      // await rp.postUser(
      //   cancelToken: cancelToken,
      //   retryRequest: postUser,
      //   body: null
      //   // users!,
      // );
    } catch (e) {
      isError.value = true;
    }
    isLoadings.value = false;
    if (!isError.value) {}
  }
}
