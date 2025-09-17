import 'package:flutter/material.dart';
import 'package:product_listing_app/core/constants/app_paddings.dart';
import 'package:product_listing_app/core/constants/app_strings.dart';
import 'package:product_listing_app/core/constants/app_text_styles.dart';
import 'package:product_listing_app/core/utils/responsive.dart';
import 'package:product_listing_app/core/widgets/common_title.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: AppPadding.screenPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: Responsive.height(10)),
                CommonTitle(label: "My ${AppStrings.profile}"),
                SizedBox(height: Responsive.height(25)),
                CommonLabels(label1: AppStrings.name, label2: AppStrings.otpVerification),
                CommonLabels(label1: AppStrings.phone, label2: AppStrings.otpVerification),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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