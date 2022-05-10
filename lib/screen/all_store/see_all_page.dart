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
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        children: [
          verticalSpacer(20),
          AppBarWidget(
            title: 'Stores',
            onBack: controller.onBack,
          ),
          verticalSpacer(10),
          FilterPills(
            dataList: controller.pillsList,
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => Container(
                height: sizes.height / 4.8,
                child: LargeCard(
                  data: controller.allStoresUseCase.data[index],
                ),
              ),
              separatorBuilder: (context, index) => verticalSpacer(20),
              itemCount: controller.allStoresUseCase.data.length,
            ),
          ),
        ],
      ),
    );
  }
}
