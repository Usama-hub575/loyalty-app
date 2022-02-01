import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class RegisterController extends GetxController
    with StateMixin<RegisterScreen> {
  final ImagePicker picker = ImagePicker();
  XFile imageFileList;
  dynamic pickImageError;
  Rx<bool> isError = false.obs;
  Rx<bool> isEnable = false.obs;
  Rx<bool> isLoading = false.obs;
  Rx<TextEditingController> userNameController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> phoneController =
      TextEditingController(text: '+92   3244702507').obs;

  set _imageFile(XFile value) {
    imageFileList = value;
  }

  onBack() {
    Get.back();
  }

  onTextChange() {
    if (userNameController.value.text.trim().isNotEmpty &&
        emailController.value.text.trim().isNotEmpty) {
      isEnable.value = true;
    } else
      isEnable.value = false;
  }

  onContinue() {
    isLoading.value = true;
    Future.delayed(Duration(seconds: 2)).then((value) {
      isLoading.value = false;
      AppRoutes.appRoutes(RouteNames.homeScreen);
    });
  }

  openLocationPage() {
    AppRoutes.appRoutes(RouteNames.locationScreen);
  }

  pickImageCallBack(context, source) async {
    try {
      final pickedFile = await picker.pickImage(
        source: source,
        // maxWidth: maxWidth,
        // maxHeight: maxHeight,
        // imageQuality: quality,
      );
      _imageFile = pickedFile;
    } catch (e) {
      pickImageError = e;
    }
  }

  displayPickImageBottomSheet(context, state) {
    state.showBottomSheet<void>(
      (context) => Container(
        color: colors.primaryDark.withOpacity(0.5),
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            getIcon(
              Icons.camera_alt_outlined,
              onTap: () => pickImageCallBack(context, ImageSource.camera),
            ),
            horizontalSpacer(30),
            getIcon(
              Icons.image,
              onTap: () => pickImageCallBack(context, ImageSource.gallery),
            ),
          ],
        ),
      ),
    );
  }

  getIcon(icon, {onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        icon,
        color: colors.accentPrimary,
        size: 30,
      ),
    );
  }
}
