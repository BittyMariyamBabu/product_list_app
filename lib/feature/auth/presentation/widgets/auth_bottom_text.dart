import 'package:flutter/material.dart';
import 'package:product_listing_app/core/constants/app_strings.dart';
import 'package:product_listing_app/core/theme/app_colors.dart';

class AuthBottomText extends StatelessWidget {
  const AuthBottomText({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: const TextSpan(
          text: AppStrings.acceptCondition,
          style: TextStyle(color: AppColors.textPrimary, fontSize: 12),
          children: <TextSpan>[
            TextSpan(text: ' '),
            TextSpan(
              text: AppStrings.termsCondition,
              style: TextStyle(
                fontSize: 12,
                color: AppColors.textPrimary,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}