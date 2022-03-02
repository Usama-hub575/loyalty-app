import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RecentTransactions extends StatelessWidget {
  final List<Transaction> recentTransaction;

  const RecentTransactions(this.recentTransaction, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      color: colors.primaryLight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              HeadingRegularText('Recent Transactions'),
              Spacer(),
              BodySmallText(
                'SeeAll',
                color: colors.accentPrimary,
              ),
            ],
          ),
          verticalSpacer(26),
          Container(
            child: Expanded(
              child: TransactionBuilder(
                transaction: recentTransaction,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
