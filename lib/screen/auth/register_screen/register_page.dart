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
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpacer(10),
              AppBarWidget(
                title: controller.title,
                onBack: controller.onBack,
              ),
              verticalSpacer(50),
              Obx(
                () => ProfileImage(
                  networkImage: controller.image,
                  image: controller.imageFile.value,
                  onTap: () => bottomSheetWidget(
                    context,
                    controller.pickImageCallBack,
                  ),
                ),
              ),
              verticalSpacer(10),
              Center(
                child: BodySmallText(
                  'Upload profile picture',
                  color: colors.primaryDark,
                ),
              ),
              verticalSpacer(30),
              Obx(
                () => AppTextField(
                  controller.userNameController.value,
                  hint: 'Enter your name',
                  onTextChange: controller.onTextChange,
                  isError: !controller.isNameValid.value,
                  error: 'Enter valid name',
                ),
              ),
              verticalSpacer(10),
              Obx(
                () => AppTextField(
                  controller.emailController.value,
                  hint: 'Enter your email address',
                  onTextChange: controller.onTextChange,
                  isError: !controller.isEmailValid.value,
                  error: 'Enter valid email',
                ),
              ),
              verticalSpacer(10),
              AppTextField(
                controller.phoneController,
                readOnly: true,
                suffixIcon: assets.icVerified,
              ),
              Spacer(),
              Obx(
                () => LongButton(
                  controller.buttonText,
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
