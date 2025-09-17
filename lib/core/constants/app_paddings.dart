import 'package:flutter/widgets.dart';
import 'package:product_listing_app/core/utils/responsive.dart';

/// Centralized padding constants to maintain consistency across the app.
class AppPadding {
  AppPadding._(); // Private constructor

  static EdgeInsets screenPadding = EdgeInsets.all(Responsive.width(16));
  static EdgeInsets horizontalPadding = EdgeInsets.symmetric(horizontal: Responsive.width(16));
  static EdgeInsets verticalPadding = EdgeInsets.symmetric(vertical: Responsive.height(16));
  static EdgeInsets smallPadding = EdgeInsets.all(Responsive.width(8));
  static EdgeInsets mediumPadding = EdgeInsets.all(Responsive.width(12));
  static EdgeInsets largePadding = EdgeInsets.all(Responsive.width(24));
}
