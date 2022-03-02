import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';

class RegisterController extends GetxController
    with StateMixin<RegisterScreen> {
  final RegisterUseCase _useCase;
  final SharedPreferences _sharedPreferences;

  RegisterController(this._useCase, this._sharedPreferences);

  final ImagePicker picker = ImagePicker();
  dynamic pickImageError;
  Rx<XFile> imageFile = XFile('').obs;
  Rx<bool> isNameValid = true.obs;
  Rx<bool> isEmailValid = true.obs;
  Rx<bool> isEnable = false.obs;
  Rx<bool> isLoading = false.obs;
  Rx<TextEditingController> userNameController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  TextEditingController phoneController = TextEditingController();
  String title = '';
  String image = '';
  String buttonText = '';

  @override
  void onInit() {
    super.onInit();
    title = Get.arguments[0];
    userNameController.value.text = _useCase.user.name;
    emailController.value.text = _useCase.user.email;
    image = _useCase.user.imageUrl;

    phoneController.text =
        '${_useCase?.user?.countryCode}${_useCase?.user?.number}';
    if (phoneController.text.isEmpty)
      phoneController.text = '${Get.arguments[1].toString().substring(0, 3)}' +
          '\t\t' +
          '${Get.arguments[1].toString().substring(3)}';
    buttonText = Get.arguments[2];
  }

  set _imageFile(XFile value) {
    imageFile.value = value;
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

  Future<void> onContinue() async {
    if (validateName(userNameController.value.text) &&
        validateEmail(emailController.value.text)) {
      isLoading.value = true;

      String imageLink = '';
      if (imageFile.value.path.isNotEmpty)
        imageLink = await _useCase.uploadImage(imageFile.value.path);

      final either = await _useCase.registerUser(
        UserModel(
          name: userNameController.value.text,
          email: emailController.value.text,
          countryCode: Get.arguments.toString().substring(0, 3),
          number: Get.arguments.toString().substring(3),
          imageUrl: imageLink,
        ),
      );
      either.fold(
        (l) => {
          print(l),
          isLoading.value = false,
        },
        (r) => {
          isLoading.value = false,
          navigateToHomePage(),
        },
      );
    }
  }

  navigateToHomePage() {
    _sharedPreferences.setBool(constants.isLogin, true);
    AppRoutes.appRoutes(RouteNames.homeScreen);
  }

  bool validateName(String name) {
    isNameValid.value = !name.contains(RegExp(r'[^A-Za-z ]'));
    return isNameValid.value;
  }

  bool validateEmail(String email) {
    isEmailValid.value = EmailValidator.validate(email);
    return isEmailValid.value;
  }

  void pickImageCallBack(source) async {
    try {
      final pickedFile = await picker.pickImage(
        source: source,
        maxWidth: 100,
        maxHeight: 100,
        imageQuality: 70,
      );
      if (pickedFile.path.isNotEmpty) {
        _imageFile = pickedFile;
        onBack();
      }
    } catch (e) {
      pickImageError = e;
    }
  }
}
