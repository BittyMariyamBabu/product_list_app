import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:product_listing_app/core/theme/app_colors.dart';

class CommonIndicator extends StatelessWidget {
  const CommonIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
          ? const CircularProgressIndicator(color: AppColors.background)
          : CupertinoActivityIndicator(color: AppColors.background);
  }
}
