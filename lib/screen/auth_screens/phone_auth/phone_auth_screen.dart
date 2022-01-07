import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aactivpay/export.dart';

class PhoneAuthScreen extends GetView<PhoneAuthController>{
  final _phoneNumberController = TextEditingController();
  String number = "";
  PhoneAuthComponent _component = PhoneAuthComponent();
  bool _loading = false;
  bool _disabled = true;
  bool _phoneNumberEntered = false;
  String _countryCode;
  int _phoneNumMinLengthToEnableButton = 5;
  int _phoneNumMaxLength = 10;


  @override
  Widget build(BuildContext context) {
    return Container();
  }

  _initListener() {
    _phoneNumberController.addListener(() {
      if (_phoneNumberController.text.toString().length >=
              _phoneNumMinLengthToEnableButton &&
          _phoneNumberController.text.toString().length <= _phoneNumMaxLength) {
        // setState(() {
          _disabled = false;
          _phoneNumberEntered = true;
        // });
      } else {
        // setState(() {
          _disabled = true;
          _phoneNumberEntered = false;
        // });
      }
    });
  }

  navigateToOTPVerificationPage(String _verificationId) async {
    // await Navigator.pushNamed(context, AppRoutes.otpVerify,
    //     arguments: [_verificationId, number]);
    hideProgressBar();
  }

  showProgressBar() {
    // setState(() {
      _loading = true;
      _disabled = true;
    // });
  }

  hideProgressBar() {
    // setState(() {
      _loading = false;
      _disabled = false;
    // });
  }


  navigateToTabsPage() {
    // Navigator.of(context).pushReplacementNamed(AppRoutes.tabs);
  }

  void _onTap() {
    // setState(() {
      number = _countryCode + _phoneNumberController.text;
    // });
    if (_phoneNumberController.value == null ||
        _phoneNumberController.text.length > _phoneNumMaxLength) {
      // showSnackBarWithGlobalKeyAndAppErrors(
      //     widget.globalKey, AppError(title: ERROR_INVALID_PHONE_NUMBER),
      //     backgroundColor: colors.colorRedCard);
    } else if (!_loading) {
      final result = controller
          .verifyPhoneNumber(_countryCode + _phoneNumberController.value.text);
    }
  }


  Future showErrorMessage(appError) async {
    // showSnackBarWithGlobalKeyAndAppErrors(widget.globalKey, appError,
    //     backgroundColor: colors.colorRedCard);
  }

  String getTextFromKey(String key) {
    // return translate(context, key);
  }

  navigateToUserDetailPage() {
    // Navigator.of(context)
    //     .pushNamedAndRemoveUntil(AppRoutes.userDetail, (route) => false);
  }


}
