import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:product_listing_app/core/constants/app_paddings.dart';
import 'package:product_listing_app/core/constants/app_strings.dart';
import 'package:product_listing_app/core/constants/app_text_styles.dart';
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
    // Extract plain phone value from extra
    final args = GoRouterState.of(context).extra as Map<String, dynamic>?;
    final phone = args?['phone'] ?? '';
    final otp = args?['otp'] ?? '';
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
                  Text(
                    AppStrings.otpVerification,
                    style: AppTextStyles.otpLabel
                  ),
                  SizedBox(height: Responsive.height(10)),
                  Row(
                    children: [
                      Text(
                        AppStrings.enterOtp,
                        style: AppTextStyles.otpLabel1
                      ),
                      Text(
                        '+91 -$phone',
                        style: AppTextStyles.otpLabel2
                      ),
                    ],
                  ),
                  SizedBox(height: Responsive.height(20)),
                  Row(
                    children: [
                      Text(
                        AppStrings.otp,
                        style: AppTextStyles.otpLabel3
                      ),
                      Text(
                        otp,
                        style: AppTextStyles.otpLabel4
                      ),
                    ],
                  ),
                  SizedBox(height: Responsive.height(20)),
                  SizedBox(height: Responsive.height(20)),
                  CustomButton(
                    text: AppStrings.submit, 
                    onPressed: (){
                     context.pushNamed(
                          RouteName.fullname,
                          extra: {
                            'phone': phone,
                          });
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