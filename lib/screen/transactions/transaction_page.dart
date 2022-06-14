import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'widgets/filter_pills_transaction.dart';

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
            labelColor: colors.primaryDark,
            unselectedLabelColor: colors.primaryDark.withOpacity(0.5),
            labelPadding: EdgeInsets.symmetric(vertical: 10),
            tabs: [
              Text(
                'All',
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Manrope",
                    fontWeight: FontWeight.w500),
              ),
              Text(
                'Approved',
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Manrope",
                    fontWeight: FontWeight.w500),
              ),
              Text(
                'Pending',
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Manrope",
                    fontWeight: FontWeight.w500),
              ),
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
              Container(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: FilterPillsTransaction(
                    dataList: controller.pillsList,
                    backGroundColor: colors.primaryLight,
                    pillsCount: 6,
                    size: 1.7,
                    onTap: controller.onPillsTap,
                  ),
                ),
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
