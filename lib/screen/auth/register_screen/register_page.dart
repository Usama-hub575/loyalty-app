import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends GetView<RegisterController> {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Column(children: [
        verticalSpacer(30),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: horizontalValue(20), vertical: verticalValue(20)),
          child: AppBarWidget(
            title: controller.title,
            onBack: controller.onBack,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalValue(20)),
          child: Expanded(
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                  ],
                ),
              ],
            ),
          ),
        ),
        Spacer(),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: horizontalValue(20), vertical: verticalValue(10)),
          child: Obx(
            () => LongButton(
              controller.buttonText,
              enable: controller.isEnable.value,
              onPressed: controller.onContinue,
              isLoading: controller.isLoading.value,
            ),
          ),
        ),
      ]),
    return GestureDetector(
      onTap: ()=> FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        key: _scaffoldKey,
        body: Column(children: [
          verticalSpacer(25),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20,vertical: verticalValue(10)),
            child: AppBarWidget(
              title: controller.title,
              onBack: controller.onBack,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                height: sizes.height * 0.89,
                padding:
                     EdgeInsets.symmetric(horizontal: 20.0, vertical: verticalValue(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpacer(40),
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
                    verticalSpacer(20),
                    Center(
                      child: BodySmallText(
                        'Upload profile picture',
                        color: colors.primaryDark,
                      ),
                    ),
                    verticalSpacer(54),
                    Obx(
                      () => AppTextField(
                        controller.userNameController.value,
                        hint: 'Enter your name',
                        onTextChange: controller.onTextChange,
                        isError: !controller.isNameValid.value,
                        error: 'Enter valid name',
                        maxLength: controller.nameMaxLength,
                        isEnable: controller.isTextFieldEnable.value,
                      ),
                    ),
                    verticalSpacer(10),
                    Obx(
                      () => AppTextField(
                        controller.emailController.value,
                        hint: 'Enter your email address',
                        onTextChange: controller.onEmailTextChange,
                        isError: !controller.isEmailValid.value,
                        error: 'Enter valid email',
                        isEnable: controller.isTextFieldEnable.value,
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
          ),
        ]),
      ),
    );
  }
}
