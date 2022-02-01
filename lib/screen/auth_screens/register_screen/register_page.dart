import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends GetView<RegisterController> {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Container(
          height: sizes.height,
          padding: const EdgeInsets.symmetric(horizontal: 17.0, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpacer(40),
              AppBarWidget(
                title: 'Registration',
                onBack: controller.onBack,
              ),
              verticalSpacer(50),
              ProfileImage(
                  // pickImageCallBack: () => controller.displayPickImageBottomSheet(
                  //     context, _scaffoldKey.currentState),
                  ),
              verticalSpacer(10),
              Center(
                child: BodySmallText(
                  'Upload profile picture',
                  color: colors.primaryDark,
                ),
              ),
              verticalSpacer(30),
              RegisterTextField(
                controller.userNameController.value,
                hint: 'Enter your name',
                onTextChange: controller.onTextChange,
              ),
              verticalSpacer(10),
              RegisterTextField(
                controller.emailController.value,
                hint: 'Enter your email address',
                onTextChange: controller.onTextChange,
              ),
              verticalSpacer(10),
              RegisterTextField(
                controller.phoneController.value,
                readOnly: true,
                suffixIcon: assets.icVerified,
              ),
              Spacer(),
              Obx(
                () => LongButton(
                  constants.register,
                  enable: controller.isEnable.value,
                  onPressed: controller.onContinue,
                  isLoading: controller.isLoading.value,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
