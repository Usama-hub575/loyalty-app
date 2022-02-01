import 'package:flutter/material.dart';
import 'package:aactivpay/export.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return fullScreenLoader();
  }
}

Widget fullScreenLoader() => Material(
      color: colors.primaryLight.withOpacity(0.05),
      child: InkWell(
        onTap: () {},
        splashColor: colors.primaryLight.withOpacity(0.0),
        hoverColor: colors.primaryLight.withOpacity(0.0),
        highlightColor: colors.primaryLight.withOpacity(0.0),
        child: SizedBox(
          width: sizes.width,
          height: sizes.height,
          child: Center(
            child: CircularProgressIndicator(
              backgroundColor: colors.primaryLight,
              valueColor: AlwaysStoppedAnimation<Color>(
                colors.accentPrimary,
              ),
            ),
          ),
        ),
      ),
    );
