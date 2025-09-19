import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_listing_app/core/utils/responsive.dart';
import 'package:product_listing_app/core/widgets/common_title.dart';
import 'package:product_listing_app/core/widgets/empty_widget.dart';
import 'package:product_listing_app/feature/home/presentation/widgets/product_shimmer.dart';
import 'package:product_listing_app/feature/home/presentation/widgets/project_card.dart';
import 'package:product_listing_app/feature/wishlist/presentation/bloc/wishlist_bloc.dart';
import 'package:product_listing_app/feature/wishlist/presentation/bloc/wishlist_event.dart';
import 'package:product_listing_app/feature/wishlist/presentation/bloc/wishlist_state.dart';

class WishProjects extends StatelessWidget {
  const WishProjects({super.key, required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonTitle(label: label),
        SizedBox(height: Responsive.height(15)),
        BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          if (state is WishlistInitial) {
            context.read<WishlistBloc>().add(LoadWishlist());
            return const Center(child: Text("Loading..."));
          } else if (state is WishlistLoading) {
            return ProductGridShimmer();
          } else if (state is WishlistLoaded) {
            if (state.wishlist.isEmpty) {
                return EmptyWishlist(); // Show empty UI
              }
            return GridView.builder(
              shrinkWrap: true,                
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: state.wishlist.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,         
                mainAxisSpacing: 16,       
                crossAxisSpacing: 16,        
                childAspectRatio: 0.9,      
              ),
              itemBuilder: (context, index) {
                final data = state.wishlist[index];
                return ProjectCard(
                  id: data.id,
                  imageUrl: data.imageUrl, 
                  review: data.review.toString(), 
                  actualPrice: data.actualPrice.toString(), 
                  salePrice: data.salePrice.toString(), 
                  productName: data.productName
                );
              },
            );
          } else if (state is WishlistError) {
            return Center(child: Text(state.message));
          }
          return SizedBox();
        }
        ),
        SizedBox(height: Responsive.height(10)),
      ],
    );
  }
}