import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:product_listing_app/core/router/app_routes.dart';
import 'package:product_listing_app/core/theme/app_colors.dart';
import 'package:product_listing_app/core/utils/responsive.dart';
import 'package:product_listing_app/core/widgets/custom_button.dart';

class EmptyWishlist extends StatelessWidget {
  const EmptyWishlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: Responsive.height(18)),
            /// Image or Icon
            Icon(
              Icons.heart_broken, 
              size: 150,
              color: AppColors.primary),
            SizedBox(height: Responsive.height(28)),
            /// Title
            Text(
              "Your Wishlist is Empty",
              style: TextStyle(
                fontSize: Responsive.fontSize(20),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: Responsive.height(18)),
            /// Subtitle / description
            Text(
              "Add your favorite items to the wishlist\nso you can find them later.",
              style: TextStyle(
                fontSize: Responsive.fontSize(15),
                color: AppColors.greyText,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 24),
            /// Action Button
            CustomButton(
              isWishList: true,
              text: "Browse Products", 
              onPressed: (){
                  context.pushNamed(RouteName.main);
              }
            ),
          ],
        ),
      ),
    );
  }
}
