import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:royalxui/pages/auth/auth_ctrl.dart';
import 'package:royalxui/uikit.dart' as u;
import 'package:royalxui/toolkit.dart' as t;

class AuthScreen extends GetView<AuthController> {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Obx(() {
                  return Column(
                    children: [
                      SizedBox(height: 50),
                      u.Text(
                        t.LocaleConst.loginToYourAccount.tr,
                        fontSize: t.EnumFontSize.title,
                      ),
                      SizedBox(height: 2),
                      u.Text(
                        t.LocaleConst.sendVerificationEmail.tr,
                        fontSize: t.EnumFontSize.body,
                      ),
                      SizedBox(height: 20),
                      Spacer(),
                      SizedBox(
                        height: t.Utils.size(context).height / 2,
                        width: t.Utils.isMobile(context)
                            ? t.Utils.size(context).width
                            : t.Utils.size(context).height / 2,
                      ),
                      if (controller.authScreensValue.value ==
                          t.EnumAuthScreensType.signIn) ...[
                        Center(
                          child: SizedBox(
                            width: !t.Utils.isMobile(context) ? 600 : null,
                            child: u.TextField(
                              controller: controller.emailCtrl,
                              focusNode: controller.emailFocus,
                              // onChanged: controller.onEmailChanged,
                              labelText: t.LocaleConst.email.tr,
                              errorText: controller.emailErr.value?.tr,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          width: !t.Utils.isMobile(context) ? 600 : null,
                          child: u.TextField(
                            controller: controller.parentTagCtrl,
                            focusNode: controller.parentTagFocus,
                            // onChanged: controller.onParentTagChanged,
                            labelText: t.LocaleConst.parentTag.tr,
                            errorText: controller.parentTagErr.value?.tr,
                          ),
                        ),
                      ],
                      if (controller.authScreensValue.value ==
                          t.EnumAuthScreensType.verifyOTP)
                        Pinput(
                          validator: (s) {
                            return s == '2222' ? null : 'Pin is incorrect';
                          },
                          controller: controller.verifyOTPCtrl,
                          focusNode: controller.passFocus,
                          pinputAutovalidateMode:
                              PinputAutovalidateMode.onSubmit,
                          showCursor: true,
                          onCompleted: (pin) => controller.verifyEmployee,
                        ),
                      SizedBox(height: 20),
                      Spacer(),
                      if (controller.authScreensValue.value ==
                          t.EnumAuthScreensType.signIn)
                        SizedBox(
                          width: t.Utils.isMobile(context)
                              ? t.Utils.size(context).width
                              : null,
                          child: u.Button(
                            onPressed: () => controller.registerEmployee(
                              controller.emailCtrl.text,
                              controller.parentTagCtrl.text,
                              context,
                            ),
                            actions: t.EnumActionsButtons.filledButton,
                            child: controller.isLoadings.value
                                ? CircularProgressIndicator()
                                : Text(
                                    controller.authScreensValue.value ==
                                            t.EnumAuthScreensType.signIn
                                        ? t.LocaleConst.verifyEmail.tr
                                        : t.LocaleConst.confirmCode.tr,
                                  ),
                          ),
                        ),
                        Spacer(),
                      SizedBox(height: 20),
                    ],
                  );
                }),
              ),
            ),
          );
        },
      ),
    );
  }
}
