import 'package:flutter/material.dart';
import 'package:product_listing_app/core/theme/app_colors.dart';
import 'package:product_listing_app/core/utils/responsive.dart';

/// Common BoxDecorations for containers, buttons, cards, etc.
class AppDecorations {
  AppDecorations._(); // Private constructor

  static final BorderRadius borderRadius10 = BorderRadius.circular(Responsive.radius(10));
  static final BorderRadius borderRadius45 = BorderRadius.circular(Responsive.radius(45));
  static final BorderRadius borderRadius50 = BorderRadius.circular(Responsive.radius(50));
  static final BorderRadius borderRadius8 = BorderRadius.circular(Responsive.radius(8));

  static final UnderlineInputBorder inputBorder = UnderlineInputBorder(
    borderSide: BorderSide(color: AppColors.underLineColor),
  );

  static final UnderlineInputBorder inputBorder1 = UnderlineInputBorder(
    borderSide: BorderSide(color: AppColors.background),
  );

  static final OutlineInputBorder searchBorder = OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.greyText),
    borderRadius: borderRadius45
  );

  static final OutlineInputBorder pinBorder = OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.background),
    borderRadius: borderRadius45
  );

  static final RoundedRectangleBorder buttonBorder = RoundedRectangleBorder(
     borderRadius: borderRadius10);
  
  static final RoundedRectangleBorder roundedbuttonBorder = RoundedRectangleBorder(
     borderRadius: borderRadius10);
}
