import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:product_listing_app/core/constants/app_paddings.dart';
import 'package:product_listing_app/core/constants/app_strings.dart';
import 'package:product_listing_app/core/constants/app_text_styles.dart';
import 'package:product_listing_app/core/router/app_routes.dart';
import 'package:product_listing_app/core/utils/responsive.dart';
import 'package:product_listing_app/core/utils/snackbar.dart';
import 'package:product_listing_app/core/utils/validators.dart';
import 'package:product_listing_app/core/widgets/custom_button.dart';
import 'package:product_listing_app/core/widgets/custom_textfield.dart';
import 'package:product_listing_app/feature/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:product_listing_app/feature/auth/presentation/bloc/auth/auth_event.dart';
import 'package:product_listing_app/feature/auth/presentation/bloc/auth/auth_state.dart';
import 'package:product_listing_app/feature/auth/presentation/widgets/auth_bottom_text.dart';
import 'package:product_listing_app/feature/auth/presentation/widgets/top_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  // Outside the build, because they will be recreated every time the widget rebuilds.
  final _formKey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();

  void _onLoginPressed(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<AuthBloc>().add(
            VerifyPhoneEvent(
              phoneController.text.trim(),
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppPadding.screenPadding,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TopWidget(),
                  CustomTextField(
                    prefix: Text(
                      "+91 ",
                      style: AppTextStyles.labelText),
                    keyboardType: TextInputType.phone,
                    controller: phoneController, 
                    validator:(phone) => AppValidators.phone(phone),
                    hintText: AppStrings.enterPhone),
                  SizedBox(height: Responsive.height(20)),
                  BlocConsumer<AuthBloc, AuthState>(
                    listener: (context, state) {
                      if (state is VerifyPhoneSuccess) {
                        context.pushNamed(
                          RouteName.otp,
                          extra: {
                            'phone': phoneController.text.trim(),
                            'otp': state.otp.otp, //extract the String from your entity
                          });
                      } else if (state is AuthFailure) {
                        showCustomSnackBar(context: context, message: state.message);
                      }
                    },
                    builder: (context, state) {
                      return CustomButton(
                        isLoading: state is AuthLoading,
                        text: AppStrings.continueText, 
                        onPressed:() => _onLoginPressed(context));
                    }
                  ),
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