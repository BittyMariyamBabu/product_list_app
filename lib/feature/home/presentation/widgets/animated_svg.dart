import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:product_listing_app/core/widgets/common_svg.dart';
import 'package:product_listing_app/feature/wishlist/domain/entities/wishlist_entity.dart';
import 'package:product_listing_app/feature/wishlist/presentation/bloc/wishlist_bloc.dart';
import 'package:product_listing_app/feature/wishlist/presentation/bloc/wishlist_event.dart';
import 'package:product_listing_app/feature/wishlist/presentation/bloc/wishlist_state.dart';

class AnimatedSvgIcon extends StatefulWidget {
  final String assetPath1;
  final String assetPath2;
  final double width;
  final double height;
  final WishListEntity product; // pass product/entity

  const AnimatedSvgIcon({
    super.key,
    required this.assetPath1,
    required this.assetPath2,
    required this.product,
    this.width = 24,
    this.height = 24,
  });

  @override
  State<AnimatedSvgIcon> createState() => _AnimatedSvgIconState();
}

class _AnimatedSvgIconState extends State<AnimatedSvgIcon>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  void _onTap() {
    _controller.forward().then((_) => _controller.reverse());

    // Toggle in BLoC
    context.read<WishlistBloc>().add(ToggleWishlist(widget.product));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishlistBloc, WishlistState>(
      builder: (context, state) {
        bool isToggled = false;

        if (state is WishlistLoaded) {
          // Check if product exists in wishlist
          isToggled = state.wishlist.any((p) => p.id == widget.product.id);
        }

        return GestureDetector(
          onTap: _onTap,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: CommonSvg(
              path: isToggled ? widget.assetPath1 : widget.assetPath2,
              width: widget.width.w,
              height: widget.height.h,
            ),
          ),
        );
      },
    );
  }
}
