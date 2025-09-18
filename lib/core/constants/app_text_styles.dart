import 'package:flutter/material.dart';
import 'package:product_listing_app/core/theme/app_colors.dart';
import 'package:product_listing_app/core/utils/responsive.dart';

class AppTextStyles {

  static TextStyle otpLabel = TextStyle(     
    fontWeight: FontWeight.w700,    
    fontSize: Responsive.fontSize(18),                   
    height: 1.0,     
    color: AppColors.textPrimary                    
  );

  static TextStyle otpLabel1 = TextStyle(    
    fontWeight: FontWeight.w400,   
    fontSize: Responsive.fontSize(14),
    height: 1.0, 
    color: AppColors.greyText    
  );

  static TextStyle otpLabel2 = TextStyle(
    fontWeight: FontWeight.w700,    
    fontSize: Responsive.fontSize(14),
    height: 1.0,
    color: AppColors.textPrimary
  );

  static TextStyle otpLabel3 = TextStyle(
    fontWeight: FontWeight.w700,  
    fontSize: Responsive.fontSize(15),
    height: 1.0,
    color: AppColors.greyText
  );

  static TextStyle otpLabel4 = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: Responsive.fontSize(18),
    height: 1.0,
    color: AppColors.primary
  );

  // labeL
  static TextStyle labelText = TextStyle(
    color: AppColors.textSecondary,
    fontWeight: FontWeight.w400,
    fontSize: Responsive.fontSize(14)
    );

  /// homeTitle
  static TextStyle homeTitle =  TextStyle(
      fontFamily: 'Heebo',
      fontWeight: FontWeight.w600, 
      fontSize: Responsive.fontSize(18),           
      height: 26 / 18,             // line height = 26px / font size
      letterSpacing: 18 * 0.02,    // 2% of font size
      color: AppColors.homeText,
  );

  // Product Name
  static TextStyle priceText = TextStyle(
    fontFamily: 'Heebo',
    fontWeight: FontWeight.w700,        
    fontSize: Responsive.fontSize(16),                    
    height: 24 / 16,                    
    letterSpacing: 0,                   
    color: AppColors.primaryPurple,     
  );

  static TextStyle offerText = TextStyle(
    fontFamily: 'Heebo',
    fontWeight: FontWeight.bold,        
    fontSize: Responsive.fontSize(12),                    
    height: 18 / 12,                    
    letterSpacing: 0,                  
    color: AppColors.neutral,  
    decoration: TextDecoration.lineThrough, // adds the cut/strike 
    decorationColor: AppColors.neutral,   
    decorationThickness: 2,
  );

  static TextStyle productText = TextStyle(
    fontFamily: 'Heebo',
    fontWeight: FontWeight.bold,        
    fontSize: Responsive.fontSize(17),                    
    height: 20 / 17,                   
    letterSpacing: 17 * 0.02,           
    color: AppColors.textPrimary,      
  );

  static TextStyle reviewText = TextStyle(
    fontFamily: 'Heebo',
    fontWeight: FontWeight.w400,       
    fontSize: Responsive.fontSize(14), 
    height: 20 / 14,                    
    letterSpacing: 14 * 0.02,           
    color: AppColors.homeText,      
  );

  static TextStyle  profileLabel = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: Responsive.fontSize(14),
    height: 1.0, // 100%
    letterSpacing: 0.0,
    color: AppColors.greyText
  );

  static TextStyle  profileLabel2 = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: Responsive.fontSize(18),
    height: 1.0, // 100%
    letterSpacing: 0.0,
    color: AppColors.textPrimary
  );

  static TextStyle latoRegular14 = TextStyle(
  fontFamily: 'Lato',
  fontWeight: FontWeight.w400,
  fontStyle: FontStyle.normal,
  fontSize: Responsive.fontSize(14),
  height: 30 / 14, // ≈ 2.14 for 30px line height
  letterSpacing: 0.0,
);

}