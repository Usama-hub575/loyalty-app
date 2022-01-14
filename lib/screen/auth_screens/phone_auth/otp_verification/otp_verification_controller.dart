import 'dart:async';

import 'package:aactivpay/export.dart';
import 'package:domain/export.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';

class OTPVerificationController extends GetxController
    with StateMixin<OTPVerificationScreen> {
  OTPVerificationController(
    this._authUseCase,
  );

  final AuthUseCase _authUseCase;

  final verificationCodeController = TextEditingController();
  OTPVerificationComponent component;

  String errorMessage = "";
  bool loading = false;
  bool disabled = false;
  String phoneNumber;

  void initialize() {
    component = OTPVerificationComponent();
  }

  onBack() {
    Get.back();
  }

  void verifyCode(String code, String verificationId) async {
    final result = _authUseCase.verifyOTP(
      code,
      verificationId,
    );
    result.then((value) {}, onError: (e) {
      if (e is PlatformException) {
        errorMessage = e.message;
      } else {
        errorMessage = e.toString();
      }
      // view.showErrorMessage(AppError(title: errorMessage));
    });
  }

  resendOTP(String number) async {
    await _authUseCase.resendOTP(number).then((signInResponse) async {},
        onError: (e) {
      if (e is PlatformException) {
        errorMessage = e.message;
      } else {
        errorMessage = e.toString();
      }
      // view.showErrorMessage(AppError(title: errorMessage));
    });
  }

  resend() {
    if (phoneNumber == null) {
      //   showSnackBarWithGlobalKeyAndAppErrors(
      //       _globalKey, AppError(title: ERROR_INVALID_PHONE_NUMBER),
      //       backgroundColor: colors.colorRedCard);
      // } else if (!_loading) {
      //   final result = controller.resendOTP(widget.phoneNumber);
    }
  }

  navigateToTabsPage() {
    // Navigator.of(_globalKey.currentContext)
    //     .pushReplacementNamed(AppRoutes.tabs);
  }

  //
  // showErrorMessage(AppError message) {
  //   showSnackBarWithGlobalKeyAndAppErrors(_globalKey, message,
  //       backgroundColor: colors.colorRedCard);
  // }

  showOTPResendMessage(String key) {
    // showSnackBar(_globalKey, key, backgroundColor: colors.appColor);
  }

  showAutoVerifyMessage(String msg) async {
    // showSnackBar(_globalKey, msg, backgroundColor: colors.colorGreenCard);
  }

  showOTPVerifySuccessMessage(String msg) async {
    // showSnackBar(_globalKey, msg, backgroundColor: colors.colorGreenCard);
  }

  onConfirmTap() {
    // verifyCode(_smsController.value.text, verificationId);
    navigateToUserDetailPage();
  }

  navigateToUserDetailPage() {
    AppRoutes.appRoutes(RouteNames.userDetailsScreen);
  }
}
