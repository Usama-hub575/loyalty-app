import 'package:flutter/cupertino.dart';
import 'export.dart';

AppAssets assets;
AppColors colors;
AppSizes sizes;
TextStyles textStyles;
AppConstants constants;
bool _isInitialized = false;

void initializeResources({BuildContext context}) {
  if (_isInitialized) {
    /**
     * this is to prevent
     * multiple initialization calls.
     */
    return;
  }

  constants = AppConstants();
  sizes = AppSizes()..initializeSize(context);
  assets = AppAssets();
  colors = AppColors();
  textStyles = TextStyles();
}
