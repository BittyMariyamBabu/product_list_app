import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_listing_app/core/constants/app_paddings.dart';
import 'package:product_listing_app/core/constants/app_strings.dart';
import 'package:product_listing_app/core/utils/responsive.dart';
import 'package:product_listing_app/core/widgets/common_title.dart';
import 'package:product_listing_app/feature/profile/presentation/bloc/user_data_bloc.dart';
import 'package:product_listing_app/feature/profile/presentation/bloc/user_data_event.dart';
import 'package:product_listing_app/feature/profile/presentation/bloc/user_data_state.dart';
import 'package:product_listing_app/feature/profile/presentation/widget/common_label.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: AppPadding.screenPadding,
            child: BlocBuilder<UserDataBloc, UserState>(
        builder: (context, state) {
                if (state is UserInitial) {
                  context.read<UserDataBloc>().add(UserDataEvent());
                  return const Center(child: Text("Loading..."));
                } else if (state is UserLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is UserSuccess) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: Responsive.height(10)),
                      CommonTitle(label: "My ${AppStrings.profile}"),
                      SizedBox(height: Responsive.height(25)),
                      CommonLabels(label1: AppStrings.name, label2: state.user.name),
                      CommonLabels(label1: AppStrings.phone, label2: state.user.phone),
                    ],
                  );
                }
                // Always return a widget if no state matches
                return const SizedBox.shrink();
            },
          ),
        ),
      ),
    )
  );
  }
}

