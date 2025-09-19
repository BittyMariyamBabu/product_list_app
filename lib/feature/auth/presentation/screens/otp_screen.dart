import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:product_listing_app/core/constants/app_paddings.dart';
import 'package:product_listing_app/core/constants/app_strings.dart';
import 'package:product_listing_app/core/constants/app_text_styles.dart';
import 'package:product_listing_app/core/router/app_routes.dart';
import 'package:product_listing_app/core/theme/app_colors.dart';
import 'package:product_listing_app/core/utils/responsive.dart';
import 'package:product_listing_app/core/utils/snackbar.dart';
import 'package:product_listing_app/core/widgets/custom_button.dart';
import 'package:product_listing_app/feature/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:product_listing_app/feature/auth/presentation/bloc/auth/auth_event.dart';
import 'package:product_listing_app/feature/auth/presentation/bloc/auth/auth_state.dart';
import 'package:product_listing_app/feature/auth/presentation/widgets/back_arrow.dart';
import 'package:product_listing_app/feature/auth/presentation/widgets/otp_field.dart';
import 'package:product_listing_app/feature/auth/presentation/widgets/otp_widget.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Extract phone & otp from router extras
    final args = GoRouterState.of(context).extra as Map<String, dynamic>?;
    final phone = args?['phone'] ?? '';
   final otp = args?['otp'] ?? '';
    context.read<AuthBloc>().apiOtp = otp;

    // Controller for user-entered OTP
    final otpController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppPadding.screenPadding,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BackArrowWidget(onTap: () => context.go(AppRoutes.login)),
                SizedBox(height: Responsive.height(20)),

                Text(AppStrings.otpVerification, style: AppTextStyles.otpLabel),
                SizedBox(height: Responsive.height(10)),
                Row(
                  children: [
                    Text(AppStrings.enterOtp, style: AppTextStyles.otpLabel1),
                    Text('+91 - $phone', style: AppTextStyles.otpLabel2),
                  ],
                ),
                SizedBox(height: Responsive.height(30)),
                // Show the OTP for debug/demo
                Row(
                  children: [
                    Text(AppStrings.otp, style: AppTextStyles.otpLabel3),
                    Text(otp, style: AppTextStyles.otpLabel4),
                  ],
                ),
                SizedBox(height: Responsive.height(30)),
                // OTP Input
                OtpFieldWidget(controller: otpController),
                SizedBox(height: Responsive.height(20)),
                // Optional additional OTP widget
                OtpWidget(phone: phone),
                // Bloc Consumer for handling verification
                BlocConsumer<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state is VerifyOtpSuccess) {
                      if (state.isUser) {
                        context.pushNamed(RouteName.main);
                        showCustomSnackBar(
                          context: context,
                          message: 'Login Success!',
                          backgroundColor: AppColors.successColor
                        );
                      } else {
                        context.pushNamed(
                          RouteName.fullname,
                          extra: {'phone': phone},
                        );
                      }
                    } else if (state is AuthFailure) {
                      showCustomSnackBar(context: context, message: state.message);
                    }
                  },
                  builder: (context, state) {
                    final isLoading = state is AuthLoading;

                    return CustomButton(
                      text: AppStrings.submit,
                      isLoading: isLoading,
                      onPressed: () {
                        final enteredOtp = otpController.text.trim();

                        if (enteredOtp.isEmpty) {
                          showCustomSnackBar(
                            context: context,
                            message: "Please enter OTP",
                          );
                          return;
                        }
                        // Send the user-entered OTP to Bloc
                        context.read<AuthBloc>().add(
                              VerifyOtpEvent(enteredOtp),
                            );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
