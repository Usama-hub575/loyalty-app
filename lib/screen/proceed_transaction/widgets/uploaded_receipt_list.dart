import 'dart:io';

import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UploadedReceiptList extends StatelessWidget {
  List<dynamic> receiptImages;

  Function onCrossTap;

  UploadedReceiptList(this.receiptImages, this.onCrossTap);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          width: sizes.width,
          height: sizes.heightRatio * 70,
          padding: EdgeInsets.only(left: 20, right: 20, top: 14),
          color: receiptImages.isNotEmpty? colors.white : colors.transparent,
          child: receiptImages.isNotEmpty
              ? ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: receiptImages.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.file(
                              File(receiptImages[index].path),
                              height: 60,
                              width: 50,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Positioned(
                            right: 0,
                            child: GestureDetector(
                              onTap: () => onCrossTap(index),
                              child: SvgPicture.asset(
                                assets.icRemoveButton,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }, separatorBuilder: (BuildContext context, int index) { return horizontalSpacer(18); },
                )
              : SizedBox.shrink(),
        ));
  }
}
