import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Responsive {
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600 &&
      MediaQuery.of(context).size.width < 1200;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200;

  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static double getResponsiveWidth(BuildContext context,
      {required double mobile, required double tablet, required double desktop}) {
    if (screenWidth(context) >= 1200) return desktop;
    if (screenWidth(context) >= 800) return tablet;
    return mobile;
  }

  static double width(double val) => val.w;
  static double height(double val) => val.h;
  static double fontSize(double val) => val.sp;
  static double radius(double val) => val.r;

}