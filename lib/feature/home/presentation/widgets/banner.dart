import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:product_listing_app/core/constants/app_decorations.dart';
import 'package:product_listing_app/core/theme/app_colors.dart';
import 'package:product_listing_app/core/utils/responsive.dart';
import 'package:product_listing_app/core/widgets/indicator.dart';
import 'package:product_listing_app/feature/home/presentation/bloc/banner/banner_bloc.dart';
import 'package:product_listing_app/feature/home/presentation/bloc/banner/banner_event.dart';
import 'package:product_listing_app/feature/home/presentation/bloc/banner/banner_state.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  int _currentIndex = 0;
  final CarouselSliderController _carouselController = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BannerBloc, BannerState>(
      builder: (context, state) {
        if (state is BannerInitial) {
          context.read<BannerBloc>().add(LoadBanner());
          return const Center(child: Text("Loading..."));
        } else if (state is BannerLoading) {
          return CommonIndicator();
        } else if (state is BannerLoaded) {
          return Column(
            children: [
              /// Banner Slider
              CarouselSlider.builder(
                carouselController: _carouselController,
                itemCount: state.banners.length,
                itemBuilder: (context, index, realIndex) {
                  final banner = state.banners[index];
                  return ClipRRect(
                    borderRadius: AppDecorations.borderRadius10,
                    child: CachedNetworkImage(
                      imageUrl: banner.bannerImageUrl, 
                      fit: BoxFit.contain,
                      placeholder: (context, url) =>
                          CommonIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  );
                },
                options: CarouselOptions(
                  height: 180,
                  viewportFraction: 0.9,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    setState(() => _currentIndex = index);
                  },
                ),
              ),
              SizedBox(height: Responsive.fontSize(12)),
              /// Smooth Page Indicator
              AnimatedSmoothIndicator(
                activeIndex: _currentIndex,
                count: state.banners.length,
                effect: ExpandingDotsEffect(
                  dotHeight: 5,
                  dotWidth: 8,
                  activeDotColor: AppColors.textPrimary,
                  dotColor: AppColors.neutral,
                ),
                onDotClicked: (index) {
                  _carouselController.animateToPage(index);
                },
              ),
            ],
          );
        } else if (state is BannerError) {
          return Center(child: Text(state.message));
        }
        return const SizedBox();
      },
    );
  }
}
