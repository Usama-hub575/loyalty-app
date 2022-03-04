import 'dart:io';

import 'package:aactivpay/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

class ProfileImage extends StatelessWidget {
  final onTap;
  final String networkImage;
  final XFile image;

  const ProfileImage({
    Key key,
    this.onTap,
    this.networkImage,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: CircleAvatar(
          radius: 40,
          backgroundColor: Color(0xffFDCF09),
          child: networkImage.isNotEmpty
              ? Container(
                  height: sizes.widthRatio * 80,
                  width: sizes.widthRatio * 80,
                  padding: EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: colors.accentPrimary,
                  ),
                  child: Image.network(
                    assets.icProfile,
                    errorBuilder: (context, _, error) {
                      return SvgPicture.asset(
                        assets.icProfile,
                      );
                    },
                  ),
                )
              : image != null && image.path.isNotEmpty
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.file(
                        File(image.path),
                        height: sizes.widthRatio * 100,
                        width: sizes.widthRatio * 100,
                        fit: BoxFit.fill,
                      ),
                    )
                  : Container(
                      height: sizes.widthRatio * 80,
                      width: sizes.widthRatio * 80,
                      padding: EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: colors.accentPrimary,
                      ),
                      child: SvgPicture.asset(
                        assets.icProfile,
                      ),
                    ),
        ),
      ),
    );
  }
}
