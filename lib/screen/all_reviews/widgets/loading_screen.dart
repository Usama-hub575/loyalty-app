import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ReviewLoadingScreen extends StatelessWidget {
  const ReviewLoadingScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return getShimmerLoader();
  }

  Widget getShimmerLoader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpacer(20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            horizontalSpacer(20),
            getRating(),
            Spacer(),
            getRatingBars(),
            horizontalSpacer(30),
          ],
        ),
        verticalSpacer(
          18,
        ),
        Divider(
          color: colors.primaryDark.withOpacity(
            0.1,
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 4,
            itemBuilder: (_, index) {
              return Container(
                padding: EdgeInsets.fromLTRB(
                  horizontalValue(20),
                  verticalValue(
                    18,
                  ),
                  horizontalValue(20),
                  verticalValue(
                    34,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: verticalValue(
                            15,
                          ),
                          backgroundColor: colors.primaryDark.withOpacity(
                            0.1,
                          ),
                        ),
                        horizontalSpacer(
                          15,
                        ),
                        Container(
                          height: sizes.heightRatio * 10,
                          width: sizes.widthRatio * 123,
                          decoration: BoxDecoration(
                            color: colors.primaryDark.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(
                              2,
                            ),
                          ),
                        ),
                      ],
                    ),
                    verticalSpacer(
                      18,
                    ),
                    Container(
                      height: sizes.heightRatio * 10,
                      width: sizes.widthRatio * 123,
                      decoration: BoxDecoration(
                        color: colors.primaryDark.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(
                          2,
                        ),
                      ),
                    ),
                    verticalSpacer(
                      24,
                    ),
                    Container(
                      height: sizes.heightRatio * 10,
                      decoration: BoxDecoration(
                        color: colors.primaryDark.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(
                          2,
                        ),
                      ),
                    ),
                    verticalSpacer(
                      11,
                    ),
                    Container(
                      height: sizes.heightRatio * 10,
                      width: sizes.widthRatio * 136,
                      decoration: BoxDecoration(
                        color: colors.primaryDark.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(
                          2,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget getRating() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: sizes.heightRatio * 10,
          width: sizes.widthRatio * 70,
          decoration: BoxDecoration(
            color: colors.primaryDark.withOpacity(0.1),
            borderRadius: BorderRadius.circular(
              2,
            ),
          ),
        ),
        verticalSpacer(
          10,
        ),
        RatingStar(
          5,
          fillColor: colors.primaryDark.withOpacity(0.3,),
          itemSize: 16,
          itemPadding: 0.5,
        ),
        verticalSpacer(
          5,
        ),
        Container(
          height: sizes.heightRatio * 10,
          width: sizes.widthRatio * 70,
          decoration: BoxDecoration(
            color: colors.primaryDark.withOpacity(0.1),
            borderRadius: BorderRadius.circular(
              2,
            ),
          ),
        ),
      ],
    );
  }

  Widget getRatingBars() {
    return Column(
      children: [
        ratingBarItem(90),
        verticalSpacer(10),
        ratingBarItem(30),
        verticalSpacer(10),
        ratingBarItem(50),
        verticalSpacer(10),
        ratingBarItem(40),
        verticalSpacer(10),
        ratingBarItem(20),
      ],
    );
  }

  Widget ratingBarItem(int rating) {
    return Row(
      children: [
        horizontalSpacer(6),
        Container(
          width: sizes.width * 0.46,
          child: ProgressBar(
            max: 100.0,
            current: rating.toDouble(),
            color: colors.primaryDark.withOpacity(
              0.1,
            ),
          ),
        )
      ],
    );
  }
}
