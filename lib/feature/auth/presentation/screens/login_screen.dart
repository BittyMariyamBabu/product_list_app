import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:product_listing_app/core/constants/app_paddings.dart';
import 'package:product_listing_app/core/constants/app_strings.dart';
import 'package:product_listing_app/core/router/app_routes.dart';
import 'package:product_listing_app/core/utils/responsive.dart';
import 'package:product_listing_app/core/utils/validators.dart';
import 'package:product_listing_app/core/widgets/custom_button.dart';
import 'package:product_listing_app/core/widgets/custom_textfield.dart';
import 'package:product_listing_app/feature/auth/presentation/widgets/auth_bottom_text.dart';
import 'package:product_listing_app/feature/auth/presentation/widgets/top_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppPadding.screenPadding,
          child: SingleChildScrollView(
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TopWidget(),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: CustomTextField(
                          controller: TextEditingController(), 
                          hintText: "+91"),
                      ),
                      SizedBox(width: Responsive.width(10)),
                      Expanded(
                        flex: 6,
                        child: CustomTextField(
                          keyboardType: TextInputType.phone,
                          controller: TextEditingController(), 
                          validator:(phone) => AppValidators.phone(phone),
                          hintText: AppStrings.enterPhone),
                      ),
                    ],
                  ),
                  SizedBox(height: Responsive.height(20)),
                  CustomButton(
                    text: AppStrings.continueText, 
                    onPressed:() {
                      context.go(AppRoutes.otp);
                    },),
                  SizedBox(height: Responsive.height(20)),
                  const AuthBottomText()
                ],),
            ),
          ),
        ),
      ),
    );
  }
}