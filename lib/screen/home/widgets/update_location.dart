import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:aactivpay/export.dart';

class UpdateLocation extends StatelessWidget {
  final Function onUpdateLocationTap;
  const UpdateLocation({Key key, this.onUpdateLocationTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: onUpdateLocationTap,
              child: Text(
                'Update Location',
                style: textStyles.bodySmall
                    .copyWith(color: colors.accentPrimary),
              ),
            ),
            Spacer(),
            SvgPicture.asset(
              assets.icRightArrow,
              width: 15,
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
