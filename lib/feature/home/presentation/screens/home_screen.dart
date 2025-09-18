import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_listing_app/core/constants/app_paddings.dart';
import 'package:product_listing_app/core/constants/app_strings.dart';
import 'package:product_listing_app/core/utils/responsive.dart';
import 'package:product_listing_app/core/widgets/custom_textfield.dart';
import 'package:product_listing_app/feature/home/presentation/bloc/product/product_bloc.dart';
import 'package:product_listing_app/feature/home/presentation/bloc/product/product_event.dart';
import 'package:product_listing_app/feature/home/presentation/widgets/banner.dart';
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
                  onChanged: (String query) {
                    // Trigger search event on every text change
                    context.read<ProductBloc>().add(SearchProducts(query));
                  },
                  isSearch: true,
                  controller: TextEditingController(), 
                  hintText: AppStrings.search),
                SizedBox(height: Responsive.height(10)),
                // Banner 
                const BannerWidget(),
                SizedBox(height: Responsive.height(10)),
                // Latest & Popular Product
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