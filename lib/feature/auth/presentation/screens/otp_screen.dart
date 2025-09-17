import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:product_listing_app/core/constants/app_paddings.dart';
import 'package:product_listing_app/core/constants/app_strings.dart';
import 'package:product_listing_app/core/router/app_routes.dart';
import 'package:product_listing_app/core/utils/responsive.dart';
import 'package:product_listing_app/core/widgets/custom_button.dart';
import 'package:product_listing_app/feature/auth/presentation/widgets/auth_bottom_text.dart';
import 'package:product_listing_app/feature/auth/presentation/widgets/back_arrow.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppPadding.screenPadding,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  BackArrowWidget(
                    onTap:() => context.go(AppRoutes.login)
                  ),
                  SizedBox(height: Responsive.height(20)),
                  Text(AppStrings.otpVerification),
                  SizedBox(height: Responsive.height(10)),
                  Text(AppStrings.enterOtp),
                  SizedBox(height: Responsive.height(10)),
                  Text(AppStrings.otp),
                  SizedBox(height: Responsive.height(10)),
                  CustomButton(
                    text: AppStrings.submit, 
                    onPressed: (){
                      context.go(AppRoutes.fullname);
                    }),
                  SizedBox(height: Responsive.height(10)),
                  AuthBottomText()
              ],
            ),
          ),
        )),
    );
  }
}