import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';

class TransactionPage extends GetView<TransactionController> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: colors.primaryLight,
        appBar: AppBar(
          backgroundColor: colors.primaryLight,
          leading: Padding(
            padding: const EdgeInsets.all(20),
            child: AppIconButton(
              assets.icBack,
              onTap: controller.onBack,
            ),
          ),
          bottom: TabBar(
            indicatorColor: colors.accentPrimary,
            labelPadding: EdgeInsets.symmetric(vertical: 10),
            tabs: [
              BodyRegularText('All'),
              BodyRegularText('Approved'),
              BodyRegularText('Pending'),
            ],
          ),
          title: HeadingRegularText(
            'Transactions',
          ),
          centerTitle: true,
        ),
        body: controller.obx(
          (state) => Column(
            children: [
              FilterPills(
                dataList: controller.pillsList,
                backGroundColor: colors.primaryLight,
                pillsCount: 6,
                size: 1.7,
                onTap: controller.onPillsTap,
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    getAllTransactions(),
                    getApprovedTransactions(),
                    getPendingTransactions(),
                  ],
                ),
              ),
            ],
          ),
          onLoading: ShimmerEffectTransactionPage(),
        ),
      ),
    );
  }

  getAllTransactions() {
    return TransactionBuilder(
      transaction: controller.allTransactions,
    );
  }

  getApprovedTransactions() {
    return TransactionBuilder(
      transaction: controller.allTransactions,
    );
  }

  getPendingTransactions() {
    return TransactionBuilder(
      transaction: controller.allTransactions,
    );
  }
}
