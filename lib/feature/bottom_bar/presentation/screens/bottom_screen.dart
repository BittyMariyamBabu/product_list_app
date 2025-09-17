import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_listing_app/core/constants/app_decorations.dart';
import 'package:product_listing_app/core/constants/app_paddings.dart';
import 'package:product_listing_app/core/constants/app_strings.dart';
import 'package:product_listing_app/core/theme/app_colors.dart';
import 'package:product_listing_app/core/utils/responsive.dart';
import 'package:product_listing_app/feature/bottom_bar/presentation/bloc/bottom_nav_bloc.dart';
import 'package:product_listing_app/feature/bottom_bar/presentation/bloc/bottom_nav_event.dart';
import 'package:product_listing_app/feature/bottom_bar/presentation/bloc/bottom_nav_state.dart';
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

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBloc, BottomNavState>(
      builder: (context, state) {
        return Scaffold(
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
                  items: [
                    _buildNavItem(
                      icon: Icons.home_outlined,
                      activeIcon: Icons.home,
                      label: AppStrings.home,
                      isSelected: state.currentIndex == 0,
                    ),
                    _buildNavItem(
                      icon: Icons.search_outlined,
                      activeIcon: Icons.search,
                      label: AppStrings.wishlist,
                      isSelected: state.currentIndex == 1,
                    ),
                    _buildNavItem(
                      icon: Icons.person_outline,
                      activeIcon: Icons.person,
                      label: AppStrings.profile,
                      isSelected: state.currentIndex == 2,
                    ),
                  ],
                ),
              ),
            ),
          ),

        );
      },
    );
  }
}


BottomNavigationBarItem _buildNavItem({
  required IconData icon,
  required IconData activeIcon,
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
          Icon(
            isSelected ? activeIcon : icon,
            color: isSelected ? AppColors.background : AppColors.labelText,
            size: Responsive.fontSize(24),
          ),
          if (isSelected) ...[
            SizedBox(width: Responsive.width(6)),
            Text(
              label,
              style: TextStyle(
                color: AppColors.background,
                fontSize: Responsive.fontSize(12),
                fontWeight: FontWeight.w500,
              ),
            ),
          ]
        ],
      ),
    ),
  );
}
