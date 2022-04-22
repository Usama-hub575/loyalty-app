import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';

class SeeAllBranchesPage extends GetView<SeeAllBranchesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.obx(
        (state) => getBody(),
        onError: getErrorState(),
        onLoading: getErrorState(),
        onEmpty: getErrorState(),
      ),
    );
  }

  getBody() {
    return Column(
      children: [
        AppBarWidget(),
      ],
    );
  }

  getErrorState() {}

  getEmptyState() {}

  getLoadingState() {}
}
