import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ShimmerEffectTransactionPage extends StatelessWidget {
  const ShimmerEffectTransactionPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: horizontalValue(
          20,
        ),
      ),
      child: Column(
        children: [
          verticalSpacer(
            16.5,
          ),
          _pillsList(),
          verticalSpacer(
            16.5,
          ),
          _transactionList(),
        ],
      ),
    );
  }

  Widget _pillsList() {
    return SizedBox(
      height: verticalValue(
        30,
      ),
      child: ListView.separated(
        itemBuilder: (_, index) {
          return _pill(
            width: horizontalValue(
              _pillWidth(
                index: index,
              ),
            ),
          );
        },
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        separatorBuilder: (_, index) {
          return SizedBox(
            width: horizontalValue(
              10,
            ),
          );
        },
        itemCount: 4,
      ),
    );
  }

  Widget _pill({@required double width}) {
    return Container(
      width: width,
      height: verticalValue(
        30,
      ),
      decoration: BoxDecoration(
        color: colors.primaryDark.withOpacity(
          0.05,
        ),
        borderRadius: BorderRadius.circular(
          100,
        ),
      ),
    );
  }

  double _pillWidth({@required int index}) {
    switch (index) {
      case 0:
        return 85;
      case 1:
        return 76;
      case 2:
        return 107;
      case 3:
        return 72;
      default:
        return 85;
    }
  }

  Widget _transactionList() {
    return Container(
      padding: EdgeInsets.only(
        right: horizontalValue(
          20,
        ),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (_, index) {
          return _transactionItem();
        },
        separatorBuilder: (_, index) {
          return SizedBox(
            height: verticalValue(
              10,
            ),
          );
        },
        itemCount: 3,
      ),
    );
  }

  Widget _transactionItem() {
    return Container(
      height: verticalValue(91),
      decoration: BoxDecoration(
        color: colors.white,
        borderRadius: BorderRadius.circular(
          8,
        ),
      ),
      child: Column(
        children: [
          verticalSpacer(
            15,
          ),
          Row(
            children: [
              horizontalSpacer(
                20,
              ),
              _shimmerBar(
                width: 64,
              ),
            ],
          ),
          verticalSpacer(
            15,
          ),
          Row(
            children: [
              horizontalSpacer(
                20,
              ),
              Expanded(
                child: _shimmerBar(
                  width: sizes.width,
                ),
              ),
              horizontalSpacer(
                22,
              ),
              SvgPicture.asset(
                assets.icForward,
                color: colors.primaryDark.withOpacity(
                  0.1,
                ),
              ),
              horizontalSpacer(
                15,
              ),
            ],
          ),
          verticalSpacer(
            15,
          ),
          Row(
            children: [
              horizontalSpacer(
                20,
              ),
              _shimmerBar(
                width: 125,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _shimmerBar({@required double width}) {
    return Container(
      height: verticalValue(
        10,
      ),
      width: horizontalValue(width),
      decoration: BoxDecoration(
        color: colors.primaryDark.withOpacity(
          0.1,
        ),
        borderRadius: BorderRadius.circular(
          2,
        ),
      ),
    );
  }
}
