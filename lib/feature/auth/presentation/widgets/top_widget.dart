import 'package:flutter/material.dart';
import 'package:product_listing_app/core/constants/app_strings.dart';
import 'package:product_listing_app/core/theme/app_colors.dart';
import 'package:product_listing_app/core/utils/responsive.dart';

class TopWidget extends StatelessWidget {
  const TopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: Responsive.height(30)),
        Text(
          AppStrings.loginText,
          style: TextStyle(
            fontSize: Responsive.fontSize(35),
            fontWeight: FontWeight.w700,  // bold
            height: 48 / 35,              // line height 48px
          ),
        ),
        SizedBox(height: Responsive.height(10)),
        Text(AppStrings.connect,
          style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 14,
              fontWeight: FontWeight.w400,  // bold
              height: 48 / 35,              // line height 48px
            ),
        ),
        SizedBox(height: Responsive.height(20)),
      ]);
  }
}