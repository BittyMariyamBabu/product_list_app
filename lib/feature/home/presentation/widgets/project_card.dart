import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:product_listing_app/core/constants/app_assets.dart';
import 'package:product_listing_app/core/constants/app_text_styles.dart';
import 'package:product_listing_app/core/theme/app_colors.dart';
import 'package:product_listing_app/core/utils/responsive.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key, 
  required this.imageUrl, 
  required this.review, 
  required this.actualPrice, 
  required this.salePrice, 
  required this.productName});

  final String imageUrl;
  final String review;
  final String actualPrice;
  final String salePrice;
  final String productName;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(Responsive.radius(8)),
              child: CachedNetworkImage(
                imageUrl: imageUrl),
            ),
            Positioned(
              top: 8.h,             
              right: 8.w,       
              child: SvgPicture.asset(AppAssets.wishList),    
              // child: AnimatedSvgIcon(assetPath: AppAssets.wishList)
        ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  '₹$actualPrice',
                  style: AppTextStyles.offerText
                ),
                SizedBox(width: Responsive.width(5)),
                Text(
                  '₹$salePrice',
                  style: AppTextStyles.priceText
                ),
              ],
            ),         
            Row(
              children: [
                Icon(
                  Icons.star_rounded,
                  color: AppColors.yellowColor,
                  size: Responsive.fontSize(18)
                ),
                SizedBox(width: Responsive.width(3)),
                Text(
                  review,
                  style: AppTextStyles.reviewText
                ),
              ],
            ),
          ],
        ),
        Text(
          productName,
          style: AppTextStyles.productText)
      ],
    );
  }
}