import 'package:aactivpay/export.dart';
import 'package:aactivpay/screen/all_store/widgets/export.dart';
import 'package:flutter/material.dart';

class SeeAllStoresPage extends GetView<SeeAllController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.primaryLight,
      body: controller.obx((state) => getBody(context),
          onLoading: AllStoresLoadingScreen()),
    );
  }

  getBody(BuildContext context) {
    return Container(
      height: sizes.height,
      width: sizes.width,
      // padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        children: [
          verticalSpacer(30),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: horizontalValue(20.0), vertical: verticalValue(10)),
            child: AppBarWidget(
              title: 'Stores',
              onBack: controller.onBack,
            ),
          ),
          verticalSpacer(10),
          CategoriesFilter(
            dataList: controller.pillsList,
          ),
          Expanded(
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => controller.onStoreTap(
                    controller.allStoresUseCase.data[index].storeId,
                    controller.allStoresUseCase.data[index].name),
                child: LargeCard(
                  data: controller.allStoresUseCase.data[index],
                ),
              ),
              separatorBuilder: (context, index) => verticalSpacer(20),
              itemCount: controller.allStoresUseCase.data.length,
              padding: EdgeInsets.only(bottom: verticalValue(20)),
            ),
          ),
        ],
      ),
    );
  }
}
