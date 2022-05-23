import 'package:aactivpay/export.dart';

class ProceedTransactionController extends GetxController
    with StateMixin<ProceedTransactionPage> {
  final ImagePicker picker = ImagePicker();
  dynamic pickImageError;
  List<dynamic> imagesList = List.empty(growable: true).obs;

  Rx<bool> isEnable= false.obs;

  String image = '';

  @override
  void onInit() {
    super.onInit();
  }

  onBack() {
    Get.back();
  }

  set _imageFile(XFile value) {
    imagesList.add(value);
    _isEnable= imagesList.isNotEmpty;
  }

  set _isEnable(bool value){
    isEnable.value = value;
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

  removeImageFromList(int index) {
    imagesList.removeAt(index);
    _isEnable= imagesList.isNotEmpty;
  }
}
