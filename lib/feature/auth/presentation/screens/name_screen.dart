import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:product_listing_app/core/constants/app_paddings.dart';
import 'package:product_listing_app/core/constants/app_strings.dart';
import 'package:product_listing_app/core/router/app_routes.dart';
import 'package:product_listing_app/core/utils/responsive.dart';
import 'package:product_listing_app/core/utils/validators.dart';
import 'package:product_listing_app/core/widgets/custom_button.dart';
import 'package:product_listing_app/core/widgets/custom_textfield.dart';
import 'package:product_listing_app/feature/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:product_listing_app/feature/auth/presentation/bloc/auth/auth_event.dart';
import 'package:product_listing_app/feature/auth/presentation/bloc/auth/auth_state.dart';
import 'package:product_listing_app/feature/auth/presentation/widgets/back_arrow.dart';

class NameScreen extends StatelessWidget {
  NameScreen({super.key});

  // Outside the build, because they will be recreated every time the widget rebuilds.
  final _formKey1 = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  void _onSignUpPressed(BuildContext context) {
    if (_formKey1.currentState!.validate()) {
      context.read<AuthBloc>().add(
            SignupRequested(
              nameController.text.trim(),
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
              key: _formKey1,
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
                        text: AppStrings.continueText, 
                        onPressed:() => context.go(AppRoutes.main)),
                  // BlocConsumer<AuthBloc, AuthState>(
                  //   listener: (context, state) {
                  //     if (state is AuthSuccess) {
                  //       context.pushNamed(AppRoutes.main);
                  //       ScaffoldMessenger.of(context).showSnackBar(
                  //         const SnackBar(content: Text('Sign Up Success!')),
                  //       );
                  //     } else if (state is AuthFailure) {
                  //       ScaffoldMessenger.of(context).showSnackBar(
                  //         SnackBar(content: Text(state.message)),
                  //       );
                  //     }
                  //   },
                  //   builder: (context, state) {
                  //     return CustomButton(
                  //       text: AppStrings.submit, 
                  //       onPressed:() => _onSignUpPressed(context)
                  //     );
                  //   }
                  // ),
                  SizedBox(height: Responsive.height(20)),
                ],),
            ),
          ),
        ),
      ),
    );
  }
}