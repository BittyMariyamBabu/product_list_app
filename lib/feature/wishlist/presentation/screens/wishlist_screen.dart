import 'package:flutter/material.dart';
import 'package:product_listing_app/core/constants/app_paddings.dart';
import 'package:product_listing_app/core/constants/app_strings.dart';
import 'package:product_listing_app/core/utils/responsive.dart';
import 'package:product_listing_app/feature/wishlist/presentation/widgets/wishlist_card.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

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
                SizedBox(height: Responsive.height(10)),
                const WishProjects(label: AppStrings.wishlist),
              ],
            ),
          ),
        ),
      ),
    );
  }
}