import 'package:flutter/material.dart';
import 'package:product_listing_app/core/constants/app_paddings.dart';
import 'package:product_listing_app/core/constants/app_strings.dart';
import 'package:product_listing_app/core/utils/responsive.dart';
import 'package:product_listing_app/core/widgets/custom_textfield.dart';
import 'package:product_listing_app/feature/home/presentation/widgets/list_project.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                SizedBox(height: Responsive.height(15)),
                CustomTextField(
                  isSearch: true,
                  controller: TextEditingController(), 
                  hintText: AppStrings.search),
                SizedBox(height: Responsive.height(10)),
                const ListProjects(label: AppStrings.popularProduct),
                const ListProjects(label: AppStrings.latestProduct),
              ],
            ),
          ),
        ),
      ),
    );
  }
}