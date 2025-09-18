import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:product_listing_app/core/constants/app_assets.dart';
import 'package:product_listing_app/core/router/app_routes.dart';
import 'package:product_listing_app/feature/splash/presentation/bloc/splash_bloc.dart';
import 'package:product_listing_app/feature/splash/presentation/bloc/splash_event.dart';
import 'package:product_listing_app/feature/splash/presentation/bloc/splash_state.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    // Zoom in and out sequence: 0.8 -> 1.2 -> 1.0
    _scaleAnimation = TweenSequence([
      TweenSequenceItem(
          tween: Tween(begin: 0.8, end: 1.2)
              .chain(CurveTween(curve: Curves.easeOut)),
          weight: 50),
      TweenSequenceItem(
          tween: Tween(begin: 1.2, end: 1.0)
              .chain(CurveTween(curve: Curves.easeIn)),
          weight: 50),
    ]).animate(_controller);

    // Fade in effect
    _fadeAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _controller.forward();

    // Trigger splash BLoC event after frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SplashBloc>().add(SplashStarted());
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state.status == SplashStatus.completed) {
           if (state.isLoggedIn) {
              context.pushReplacement(AppRoutes.main); // User logged in → Main
          } else {
            context.pushReplacement(AppRoutes.login); // Not logged in → Login
          }
        }
      },
      child: Scaffold(
        body: Center(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Transform.scale(
                scale: _scaleAnimation.value,
                child: Opacity(
                  opacity: _fadeAnimation.value,
                  child: child,
                ),
              );
            },
            child: Image.asset(
              AppAssets.logo,
              width: 150,
              height: 150,
            ),
          ),
        ),
      ),
    );
  }
}
