

import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomContainer extends StatelessWidget {
  Function onAttachmentTap;
  Function onUploadButtonTap;
  bool isButtonEnable;

   BottomContainer({Key key,this.onAttachmentTap, this.onUploadButtonTap, this.isButtonEnable=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: sizes.width,
      height: sizes.heightRatio * 70,
      padding: EdgeInsets.symmetric(horizontal: horizontalValue(20), vertical: verticalValue(10)),
      color: colors.white,
      child: Row(
        children: [
          GestureDetector(
            onTap: onAttachmentTap,
            child: SvgPicture.asset(
              assets.icAttachment,
              height: 30,
            ),
          ),
          horizontalSpacer(20),
          LongButton(
            "Upload",
            enable: isButtonEnable,
            onPressed: onUploadButtonTap,
            isLoading: false,
            width: sizes.width / 1.5,
          ),
        ],
      ),
    );
  }
}
