import 'dart:async';
import 'package:aactivpay/export.dart';
import 'package:flutter/widgets.dart';

class PhoneAuthController extends GetxController
    with StateMixin<PhoneAuthScreen> {
  final AuthUseCase _authUseCase;
  final SharedPreferences _sharedPreferences;

  PhoneAuthController(this._authUseCase, this._sharedPreferences);

  Rx<TextEditingController> phoneNumberController = TextEditingController().obs;
  Rx<bool> isError = false.obs;
  Rx<bool> isButtonActive = false.obs;
  Rx<bool> isLoading = false.obs;
  String countryCode = '+92';
  int phoneNumMaxLength = 10;
  Rx<bool> isCheck = false.obs;
  Rx<bool> isFocus = false.obs;

  void initialize() {
    _initListener();
  }

  _initListener() {
    phoneNumberController.value.addListener(() {
      if (phoneNumberController.value.text.length >= phoneNumMaxLength &&
          isCheck.value) {
        isButtonActive.value = true;
      } else {
        isButtonActive.value = false;
      }
    });
  }

  navigateToOTPVerificationPage(arg) async {
    isLoading.value = false;
    AppRoutes.appRoutes(RouteNames.otpScreen, arg: arg);
  }

  navigateToHomePage() async {
    isLoading.value = false;
    _sharedPreferences.setBool(constants.isLogin, true);
    AppRoutes.appRoutes(RouteNames.homeScreen);
  }

  navigateToRegisterPage() async {
    isLoading.value = false;
    _sharedPreferences.setBool(constants.isLogin, true);
    AppRoutes.appRoutes(
      RouteNames.registerScreen,
    );
  }

  Future<void> onContinueTap() async {
    isLoading.value = true;
    if (!validateNumber(phoneNumberController.value.text)) {
      isError.value = true;
      isLoading.value = false;
    } else {
      isError.value = false;
      String phoneNumber = countryCode + phoneNumberController.value.text;
      await _authUseCase.signInWithPhone(
        phoneNumber,
        navigateToOTPVerificationPage,
        navigateToHomePage,
        navigateToRegisterPage,
      );
    }
  }

  Future showErrorMessage(appError) async {
    // showSnackBarWithGlobalKeyAndAppErrors(widget.globalKey, appError,
    //     backgroundColor: colors.colorRedCard);
  }

  bool validateNumber(String text) {
    return (text.length >= 10 && text[0] == '3');
  }

  onTapCheckBox(bool value) {
    isCheck.value = value;
    if (phoneNumberController.value.text.length >= phoneNumMaxLength &&
        isCheck.value) {
      isButtonActive.value = true;
    } else {
      isButtonActive.value = false;
    }
  }

  navigateToTermsAndConditionsPage() {
    AppRoutes.appRoutes(
      RouteNames.termsAndConditionsPage,
    );
  }
}
