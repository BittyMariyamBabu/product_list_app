import 'package:flutter/material.dart';
import 'package:product_listing_app/core/constants/app_decorations.dart';
import 'package:product_listing_app/core/utils/responsive.dart';
import 'package:product_listing_app/core/widgets/indicator.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: Responsive.height(50),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: AppDecorations.buttonBorder,
        ),
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? const CommonIndicator()
            : Text(text),
      ),
    );
  }
}
