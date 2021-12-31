import 'package:flutter/cupertino.dart';
import 'export.dart';


 AppAssets assets;
 AppColors colors;
 AppLabels labels;
 AppSizes sizes;
 TextStyles textStyles;

bool _isInitialized = false;

void initializeResources({ BuildContext context}) {
  if (_isInitialized) {
    /**
     * this is to prevent
     * multiple initialization calls.
     */
    return;
  }

  sizes = AppSizes()..initializeSize(context);
  assets = AppAssets();
  colors = AppColors();
  labels = AppLabels();
  textStyles = TextStyles();
}
