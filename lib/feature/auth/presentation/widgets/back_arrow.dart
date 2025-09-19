import 'package:flutter/material.dart';
import 'package:product_listing_app/core/constants/app_paddings.dart';
import 'package:product_listing_app/core/theme/app_colors.dart';
import 'package:product_listing_app/core/utils/responsive.dart';

class BackArrowWidget extends StatelessWidget {
  const BackArrowWidget({super.key, required this.onTap,});
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.background,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Responsive.radius(7))
      ),
      child: Padding(
        padding: AppPadding.mediumPadding,
        child: InkWell(
          onTap: onTap,
          child: Icon(
            Icons.arrow_back,
            color: AppColors.labelText,
            size: Responsive.fontSize(18))),
      ),
    );
  }
}