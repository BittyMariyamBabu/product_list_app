import 'package:flutter/material.dart';
import 'package:product_listing_app/core/constants/app_decorations.dart';
import 'package:product_listing_app/core/constants/app_text_styles.dart';
import 'package:product_listing_app/core/theme/app_colors.dart';
import 'package:product_listing_app/core/utils/responsive.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final bool isSearch;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.isSearch = false
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: isSearch 
        ? AppTextStyles.latoRegular14
        : AppTextStyles.labelText,
        filled: true,
        suffixIcon: Icon(
          Icons.search, 
          color: AppColors.greyText,
          size: Responsive.fontSize(25)
        ),
        fillColor: AppColors.background,
        contentPadding: isSearch 
          ? EdgeInsets.all(Responsive.height(10))
          : EdgeInsets.symmetric(vertical: Responsive.height(10)),
        border: isSearch 
          ? AppDecorations.searchBorder
          : AppDecorations.inputBorder,
        enabledBorder: isSearch 
          ? AppDecorations.searchBorder
          : AppDecorations.inputBorder,
        focusedBorder: isSearch 
          ? AppDecorations.searchBorder
          : AppDecorations.inputBorder,
        errorBorder: isSearch 
          ? AppDecorations.searchBorder
          : AppDecorations.inputBorder,
      ),
    );
  }
}


