import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:product_listing_app/core/router/app_routes.dart';
import 'package:product_listing_app/feature/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:product_listing_app/feature/auth/presentation/screens/login_screen.dart';
import 'package:product_listing_app/feature/auth/presentation/screens/name_screen.dart';
import 'package:product_listing_app/feature/auth/presentation/screens/otp_screen.dart';
import 'package:product_listing_app/feature/bottom_bar/presentation/bloc/bottom_nav_bloc.dart';
import 'package:product_listing_app/feature/bottom_bar/presentation/screens/bottom_screen.dart';
import 'package:product_listing_app/feature/home/presentation/bloc/product/product_bloc.dart';
import 'package:product_listing_app/feature/splash/presentation/bloc/splash_bloc.dart';
import 'package:product_listing_app/feature/splash/presentation/screens/splash_screen.dart';
import 'package:product_listing_app/injection.dart';

final GoRouter router = GoRouter(
  initialLocation: AppRoutes.splash,
  routes: [
    routeMethod(path: AppRoutes.splash, 
      screen: BlocProvider(
        create: (_) => SplashBloc(),
        child: const SplashScreen()
      ),
    ),
    routeMethod(path: AppRoutes.login,
      screen: BlocProvider<AuthBloc>(
        create: (_) => sl<AuthBloc>(),
        child: LoginScreen()
      )
    ),
    routeMethod(path: AppRoutes.otp,screen: OtpScreen()),
    routeMethod(
      path: AppRoutes.fullname,
      screen: BlocProvider<AuthBloc>(
        create: (_) => sl<AuthBloc>(),
        child: NameScreen()
      )
    ),
    routeMethod(path: AppRoutes.main,
    screen: MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => BottomNavBloc()),
        BlocProvider(create: (_) => sl<ProductBloc>()), 
      ], 
      child: MainScreen(),
    ),
    ),
    // routeMethod(path: AppRoutes.home,screen: HomeScreen()),
  ],
);

GoRoute routeMethod({required String path,required Widget screen}) {
  return GoRoute(
    path: path,
    builder: (context, state) => screen,
  );
}
