import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_listing_app/core/constants/app_assets.dart';
import 'package:product_listing_app/core/constants/app_decorations.dart';
import 'package:product_listing_app/core/constants/app_paddings.dart';
import 'package:product_listing_app/core/theme/app_colors.dart';
import 'package:product_listing_app/feature/bottom_bar/presentation/bloc/bottom_nav_bloc.dart';
import 'package:product_listing_app/feature/bottom_bar/presentation/bloc/bottom_nav_event.dart';
import 'package:product_listing_app/feature/bottom_bar/presentation/bloc/bottom_nav_state.dart';
import 'package:product_listing_app/feature/bottom_bar/presentation/widgets/bottom_navigation_widget.dart';
import 'package:product_listing_app/feature/home/presentation/screens/home_screen.dart';
import 'package:product_listing_app/feature/profile/presentation/screens/profile_screen.dart';
import 'package:product_listing_app/feature/wishlist/presentation/screens/wishlist_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  final List<Widget> _screens = const [
    HomeScreen(),
    WishListScreen(),
    ProfileScreen(),
  ];

  final List<String> _svgIcons = const [
    AppAssets.unhome,
    AppAssets.unlike,
    AppAssets.unprofile,
  ];

  final List<String> _svgActiveIcons = const [
    AppAssets.home,
    AppAssets.like,
    AppAssets.profile,
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBloc, BottomNavState>(
      builder: (context, state) {
        return PopScope(
          canPop: false, // stops default back
          onPopInvokedWithResult:(didPop, result) {
             // Back button logic
            if (state.currentIndex != 0) {
              // If not on Home, go to Home
              context.read<BottomNavBloc>().add(TabChanged(0));
            } else {
              // Already on Home → exit app
              SystemNavigator.pop(); // closes the app
            }
          },
          child: Scaffold(
            body: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) {
                return FadeTransition(opacity: animation, child: child);
              },
              child: _screens[state.currentIndex],
            ),
            bottomNavigationBar: Padding(
              padding: AppPadding.smallPadding,
              child: Card(
                elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: AppDecorations.borderRadius50,
                  ),
                child: ClipRRect(
                  borderRadius: AppDecorations.borderRadius50,
                  child: BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    backgroundColor: AppColors.background,
                    currentIndex: state.currentIndex,
                    elevation: 8,
                    selectedFontSize: 0, // hide default label
                    unselectedFontSize: 0,
                    onTap: (index) {
                      context.read<BottomNavBloc>().add(TabChanged(index));
                    },
                     items: List.generate(_svgIcons.length, (index) {
                      return buildNavItem(
                        iconPath: _svgIcons[index],
                        activeIconPath: _svgActiveIcons[index],
                        label: ['Home', 'Wishlist', 'Profile'][index],
                        isSelected: state.currentIndex == index,
                      );
                     },
                  ),
                ),
              ),
            ),
          
          )
          )
        );
      },
    );
  }
}


