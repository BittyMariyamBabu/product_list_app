import 'package:flutter/material.dart';
import 'package:product_listing_app/core/constants/app_decorations.dart';
import 'package:product_listing_app/core/theme/app_colors.dart';
import 'package:product_listing_app/core/utils/responsive.dart';
import 'package:product_listing_app/core/widgets/common_svg.dart';

// Common navigation Bar
BottomNavigationBarItem buildNavItem({
  required String iconPath,
  required String activeIconPath,
  required String label,
  required bool isSelected,
}) {
  return BottomNavigationBarItem(
    label: "",
    icon: AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      padding: EdgeInsets.symmetric(horizontal: isSelected ? 16 : 0, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primary : Colors.transparent,
        borderRadius: AppDecorations.borderRadius45
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Svg Icons
          CommonSvg(
            path: isSelected ? activeIconPath : iconPath,
            width: Responsive.fontSize(20),
            height: Responsive.fontSize(20),
          ),
          if (isSelected) ...[
            SizedBox(width: Responsive.width(6)),
            Text(
              label,
              style: TextStyle(
                color: AppColors.background,
                fontSize: Responsive.fontSize(14),
                fontWeight: FontWeight.bold,
              ),
            ),
          ]
        ],
      ),
    ),
  );
}
