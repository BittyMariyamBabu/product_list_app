import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:product_listing_app/core/constants/app_strings.dart';
import 'package:product_listing_app/core/theme/app_themes.dart';
import 'package:product_listing_app/core/router/app_router.dart';
import 'package:product_listing_app/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init(); // 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844), // base design size (width x height)
      minTextAdapt: true,
      splitScreenMode: true, 
      builder: (context, child) {
        return MaterialApp.router(
          routerConfig: AppRouter.router,
          debugShowCheckedModeBanner: false,
          title: AppStrings.productList,
          theme: AppTheme.lightTheme,  //  Light mode
        );
      }
    );
  }
}
