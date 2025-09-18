import 'package:flutter/material.dart';
import 'package:product_listing_app/core/constants/app_strings.dart';
import 'package:product_listing_app/core/constants/app_text_styles.dart';
import 'package:product_listing_app/core/theme/app_colors.dart';
import 'package:product_listing_app/core/utils/responsive.dart';

class OtpWidget extends StatelessWidget {
  const OtpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: Responsive.height(30)),
        Text(
          "00:120 Sec",
          style: AppTextStyles.otpLabel3.copyWith(fontStyle: FontStyle.normal)
        ),
        SizedBox(height: Responsive.height(15)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppStrings.codeNotReceived, style: AppTextStyles.otpLabel3.copyWith(fontStyle: FontStyle.normal)),
            Text(AppStrings.resend, 
            style: AppTextStyles.otpLabel3.copyWith(color: AppColors.secondary,fontStyle: FontStyle.normal))
          ],
        ),
        SizedBox(height: Responsive.height(30)),
      ]
    );
  }
}