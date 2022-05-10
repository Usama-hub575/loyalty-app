import 'package:aactivpay/export.dart';

class SeeAllController extends GetxController
    with StateMixin<SeeAllStoresPage> {
  final AllStoresUseCase allStoresUseCase;

  SeeAllController(this.allStoresUseCase);

  List<Category> pillsList = [];

  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.loading());
    allStoresUseCase.getAllStores().then(
        (value) => {
              if (value.isRight())
                {
                  if (allStoresUseCase.data.isNotEmpty)
                    {
                      change(null, status: RxStatus.success()),
                    }
                  else
                    {
                      change(null, status: RxStatus.empty()),
                    }
                }
              else
                {
                  change(null, status: RxStatus.error()),
                },
            }, onError: (error) {
      change(null, status: RxStatus.error());
    });
    pillsList = Get.arguments;
  }

  onBack() {
    Get.back();
  }



  void onPillsTap(
    index,
  ) {
    if (index == 0 && !pillsList[index].isActive.value) {
      pillsList.forEach((element) {
        element.isActive.value = false;
      });
      pillsList[index].isActive.value = true;
    } else if (index != 0) {
      pillsList[0].isActive.value = false;
      pillsList[index].isActive.value = !pillsList[index].isActive.value;
    }
  }
}
