import 'package:flutter/material.dart';
import 'package:product_listing_app/core/constants/app_decorations.dart';
import 'package:product_listing_app/core/theme/app_colors.dart';

/// Shows a custom SnackBar with animation
void showCustomSnackBar({
  required BuildContext context,
  required String message,
  Color backgroundColor = AppColors.textPrimary,
  Duration duration = const Duration(seconds: 3),
}) {
  final snackBar = SnackBar(
    content: Text(
      message,
      style: const TextStyle(color: AppColors.background, fontWeight: FontWeight.bold),
    ),
    backgroundColor: backgroundColor,
    duration: duration,
    behavior: SnackBarBehavior.floating,
    shape: AppDecorations.buttonBorder,
    elevation: 6,
    animation: CurvedAnimation(
      parent: AnimationController(
        vsync: ScaffoldMessenger.of(context),
        duration: const Duration(milliseconds: 300),
      )..forward(),
      curve: Curves.easeInOut,
    ),
  );

  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}
