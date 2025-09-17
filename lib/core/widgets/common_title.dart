import 'package:flutter/material.dart';
import 'package:product_listing_app/core/constants/app_text_styles.dart';

class CommonTitle extends StatelessWidget {
  const CommonTitle({super.key, required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: AppTextStyles.homeTitle,
    ) ;
  }
}