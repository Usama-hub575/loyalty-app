import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

void bottomSheetWidget(
  BuildContext context,
  Function(ImageSource) onPressed,
) {
  showModalBottomSheet(
      context: context,
      backgroundColor: colors.transparent,
      builder: (BuildContext context) {
        return Container(
            height: 220,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            color: colors.primaryLight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeadingRegularText('Select source'),
                verticalSpacer(30),
                LongButton(
                  'Camera',
                  onPressed: () => onPressed(ImageSource.camera),
                ),
                verticalSpacer(8),
                LongButton(
                  'Gallery',
                  onPressed: () => onPressed(ImageSource.gallery),
                ),
              ],
            ));
      });
}
