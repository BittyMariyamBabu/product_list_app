import 'package:flutter/material.dart';
import 'package:product_listing_app/core/constants/app_text_styles.dart';
import 'package:product_listing_app/core/utils/responsive.dart';

class CommonLabels extends StatelessWidget {
  const CommonLabels({
    super.key, required this.label1, required this.label2,
  });

  final String label1;
  final String label2;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label1,
          style: AppTextStyles.profileLabel),      
        SizedBox(height: Responsive.height(17)),
        Text(
          label2,
          style: AppTextStyles.profileLabel2),
        SizedBox(height: Responsive.height(20)),
      ],
    );
  }
}