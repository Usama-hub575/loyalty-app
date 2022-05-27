import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TransactionBuilder extends StatelessWidget {
  final List<Transaction> transaction;

  const TransactionBuilder({Key key, this.transaction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return getTransactionItem(transaction[index]);

      },
      itemCount: transaction.length,
     padding: EdgeInsets.symmetric(horizontal: 20),
      separatorBuilder: (BuildContext context, int index) {
        return verticalSpacer(10);
      },
    );
  }

  getTransactionItem(Transaction transaction) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              BodyExtraSmallText(transaction.date),
              Spacer(),
              SvgPicture.asset(
                transaction.isPending ? assets.icCoin : assets.icVerified,
                width: 11,
                height: 11,
              ),
            ],
          ),
          verticalSpacer(10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: sizes.width * 0.7,
                child: transaction.isPending
                    ? BodyRegularText(
                        'You need to upload the receipt in order to activate your earned points.🪙')
                    : BodyRegularText(
                        'You have earned ${transaction.earnedPoints.toInt()} points on the transaction of Rs ${transaction.amount.toInt()}.'),
              ),
              Spacer(),
              GestureDetector(
                onTap: (){
                AppRoutes.appRoutes(RouteNames.proceedTransactionDetailsPage);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: SvgPicture.asset(assets.icForward),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  getPendingTransaction(Transaction transaction) {
    return Container(
      padding: EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        color: colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 10,
            height: 120,
            decoration: BoxDecoration(
              color: colors.error,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
            ),
          ),
          horizontalSpacer(20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpacer(10),
              BodyExtraSmallText(transaction.date),
              verticalSpacer(5),
              Container(
                width: sizes.width * 0.7,
                child: transaction.isPending
                    ? BodyRegularText(
                        'You need to upload the receipt in order to activate your earned points.🪙')
                    : BodyRegularText(
                        'You have earned ${transaction.earnedPoints.toInt()} points on the transaction of Rs ${transaction.amount.toInt()}.'),
              ),
              verticalSpacer(10),
            ],
          ),
          Spacer(),
          SvgPicture.asset(assets.icForward),
        ],
      ),
    );
  }
}
