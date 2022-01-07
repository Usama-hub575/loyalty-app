import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aactivpay/export.dart';

import 'export.dart';

class OTPVerificationScreen extends GetView<OTPVerificationController> {
  final String verificationId;
  final String phoneNumber;

  OTPVerificationScreen({Key key, this.verificationId, this.phoneNumber})
      : super(key: key);

  final TextEditingController _smsController = TextEditingController();
  final _globalKey = GlobalKey<ScaffoldState>();
  bool _loading = false;
  bool _disabled = false;
  OTPVerificationComponent _component = OTPVerificationComponent();

  _onPressedBack(context) {
    Navigator.of(context).pop();
  }

  _onTap() {
    controller.verifyCode(_smsController.value.text, verificationId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      // backgroundColor:
      body: SafeArea(
        top: true,
        child: Stack(
          children: <Widget>[
            // _component.getMobileForm(
            //     context,
            //     _appLocalizations,
            //     _smsController,
            //     () => _onTap(),
            //     _loading,
            //     _globalKey,
            //     widget.phoneNumber,
            //     () => resend()),
            _component.getAuthBackButton(() => _onPressedBack(context))
          ],
        ),
      ),
    );
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

  showProgressBar() {
    // setState(() {
    _loading = true;
    // });
  }

  hideProgressBar() {
    // setState(() {
    _loading = false;
    // });
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

  @override
  showOTPResendMessage(String key) {
    // showSnackBar(_globalKey, key, backgroundColor: colors.appColor);
  }

  showAutoVerifyMessage(String msg) async {
    // showSnackBar(_globalKey, msg, backgroundColor: colors.colorGreenCard);
  }

  showOTPVerifySuccessMessage(String msg) async {
    // showSnackBar(_globalKey, msg, backgroundColor: colors.colorGreenCard);
  }


  @override
  navigateToUserDetailPage() {
    // Navigator.of(context)
    //     .pushNamedAndRemoveUntil(AppRoutes.userDetail, (route) => false);
  }
}
