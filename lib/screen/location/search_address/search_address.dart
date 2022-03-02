import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';

class SearchAddressPage extends GetView<SearchAddressController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          verticalSpacer(40),
          Obx(
            () => SearchField(
              controller.searchController,
              hint: 'Enter your address',
              onBack: controller.onBack,
              onClear: controller.onClear,
              onTextChange: controller.onTextChange,
              isCross: controller.isCross.value,
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: LongButton(
              'Select',
              onPressed: controller.onSelect,
            ),
          ),
        ],
      ),
    );
  }
}
