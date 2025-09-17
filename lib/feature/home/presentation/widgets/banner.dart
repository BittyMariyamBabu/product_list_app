// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import '../bloc/banner_bloc.dart';

// class BannerWidget extends StatefulWidget {
//   const BannerWidget({super.key});
//   @override
//   State<BannerWidget> createState() => _BannerWidgetState();
// }

// class _BannerWidgetState extends State<BannerWidget> with SingleTickerProviderStateMixin {
//   late PageController pageController;
//   late AnimationController animationController;
//   int currentPage = 0;

//   @override
//   void initState() {
//     super.initState();
//     pageController = PageController(viewportFraction: 0.9);
//     animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 600),
//     );
//     animationController.forward();
//     Future.delayed(const Duration(seconds: 5), autoScroll);
//   }

//   void autoScroll() {
//     if (!mounted) return;
//     if (pageController.hasClients) {
//       int nextPage = (currentPage + 1) % 5;
//       pageController.animateToPage(
//         nextPage,
//         duration: const Duration(milliseconds: 800),
//         curve: Curves.easeInOut,
//       );
//       currentPage = nextPage;
//       Future.delayed(const Duration(seconds: 5), autoScroll);
//     }
//   }

//   @override
//   void dispose() {
//     pageController.dispose();
//     animationController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<BannerBloc, BannerState>(
//       builder: (context, state) {
//         if (state is BannerLoading || state is BannerInitial) {
//           return const SizedBox(
//             height: 200,
//             child: Center(child: CircularProgressIndicator()),
//           );
//         } else if (state is BannerLoaded) {
//           return Column(
//             children: [
//               SizedBox(
//                 height: 200,
//                 child: PageView.builder(
//                   controller: pageController,
//                   itemCount: state.banners.length,
//                   itemBuilder: (context, index) {
//                     final banner = state.banners[index];
//                     return GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (_) => BannerDetailScreen(banner: banner),
//                           ),
//                         );
//                       },
//                       child: Hero(
//                         tag: banner.id,
//                         child: AnimatedBuilder(
//                           animation: animationController,
//                           builder: (context, child) {
//                             return Opacity(
//                               opacity: animationController.value,
//                               child: Transform.scale(
//                                 scale: 0.95 + 0.05 * animationController.value,
//                                 child: child,
//                               ),
//                             );
//                           },
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(12),
//                             child: CachedNetworkImage(
//                               imageUrl: banner.imageUrl,
//                               fit: BoxFit.cover,
//                               placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
//                               errorWidget: (context, url, error) => const Icon(Icons.error),
//                             ),
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               const SizedBox(height: 8),
//               SmoothPageIndicator(
//                 controller: pageController,
//                 count: state.banners.length,
//                 effect: ExpandingDotsEffect(
//                   dotHeight: 8,
//                   dotWidth: 8,
//                   activeDotColor: Colors.blue,
//                   dotColor: Colors.grey.shade300,
//                 ),
//               ),
//             ],
//           );
//         } else if (state is BannerError) {
//           return Center(child: Text(state.message));
//         }
//         return const SizedBox();
//       },
//     );
//   }
// }
