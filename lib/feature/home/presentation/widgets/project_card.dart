import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:product_listing_app/core/constants/app_assets.dart';
import 'package:product_listing_app/core/constants/app_text_styles.dart';
import 'package:product_listing_app/core/theme/app_colors.dart';
import 'package:product_listing_app/core/utils/responsive.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:product_listing_app/core/widgets/animated_svg.dart';
import 'package:product_listing_app/feature/wishlist/domain/entities/wishlist_entity.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key, 
  required this.imageUrl, 
  required this.review, 
  required this.actualPrice, 
  required this.salePrice, 
  required this.productName, 
  required this.id});

  final String imageUrl;
  final String review;
  final String actualPrice;
  final String salePrice;
  final String productName;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(Responsive.radius(10)),
              child: SizedBox(
                width: double.infinity,
                height: Responsive.height(150),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: imageUrl),
              ),
            ),
            Positioned(
              top: 8.h,             
              right: 8.w,         
              child: AnimatedSvgIcon(
                product: WishListEntity(
                  id: id, 
                  salePrice: int.parse(salePrice), 
                  actualPrice: int.parse(actualPrice), 
                  imageUrl: imageUrl, 
                  productName: productName, 
                  review: int.parse(review)),
                assetPath2: AppAssets.unwishList,
                assetPath1: AppAssets.wishList)
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