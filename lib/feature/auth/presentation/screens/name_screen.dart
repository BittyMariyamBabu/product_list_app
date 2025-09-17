import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:product_listing_app/core/constants/app_paddings.dart';
import 'package:product_listing_app/core/constants/app_strings.dart';
import 'package:product_listing_app/core/router/app_routes.dart';
import 'package:product_listing_app/core/utils/responsive.dart';
import 'package:product_listing_app/core/utils/validators.dart';
import 'package:product_listing_app/core/widgets/custom_button.dart';
import 'package:product_listing_app/core/widgets/custom_textfield.dart';
import 'package:product_listing_app/feature/auth/presentation/widgets/back_arrow.dart';

class NameScreen extends StatefulWidget {
  const NameScreen({super.key});

  @override
  State<NameScreen> createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
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
                  BackArrowWidget(
                    onTap:() => context.go(AppRoutes.otp)
                  ),
                  SizedBox(height: Responsive.height(20)),
                  CustomTextField(
                    controller: TextEditingController(), 
                    validator:(name) =>AppValidators.fullName(name),
                    hintText: AppStrings.enterName),
                  SizedBox(height: Responsive.height(20)),
                  CustomButton(
                    text: AppStrings.submit, 
                    onPressed:() {
                      context.go(AppRoutes.main);
                    },),
                  SizedBox(height: Responsive.height(20)),
                ],),
            ),
          ),
        ),
      ),
    );
  }
}