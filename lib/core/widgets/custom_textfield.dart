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
  final bool readOnly;
  final Function(String)? onChanged;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.isSearch = false,
    this.readOnly = false,
    this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: isSearch
          ? BoxDecoration(
              color: AppColors.background,
              borderRadius: AppDecorations.borderRadius45,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.5),
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            )
          : null,
      child: TextFormField(
        onChanged: onChanged,
        readOnly: readOnly,
        controller: controller,
        keyboardType: keyboardType,
        validator: validator,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: isSearch 
          ? AppTextStyles.latoRegular14
          : AppTextStyles.labelText,
          suffixIcon: isSearch ? Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 1, // thickness of the line
                height: Responsive.height(30), // length of the line
                color: AppColors.greyText, // line color
              ), 
              SizedBox(width: Responsive.width(10)),
              Icon(
                Icons.search, 
                color: AppColors.greyText,
                size: Responsive.fontSize(20)
              ),
            ],
          ) : SizedBox.shrink(),
          filled: !isSearch, // Already using container for white bg
          fillColor: isSearch ? Colors.transparent : AppColors.background,
          contentPadding: isSearch 
            ? EdgeInsets.all(Responsive.height(10))
            : EdgeInsets.symmetric(vertical: Responsive.height(10)),
          border: AppDecorations.inputBorder,
          enabledBorder: AppDecorations.inputBorder,
          focusedBorder: AppDecorations.inputBorder,
          errorBorder: AppDecorations.inputBorder,
        ),
      ),
    );
  }
}


