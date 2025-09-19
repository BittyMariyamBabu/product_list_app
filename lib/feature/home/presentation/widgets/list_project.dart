import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_listing_app/core/utils/responsive.dart';
import 'package:product_listing_app/core/widgets/common_title.dart';
import 'package:product_listing_app/feature/home/presentation/bloc/product/product_bloc.dart';
import 'package:product_listing_app/feature/home/presentation/bloc/product/product_event.dart';
import 'package:product_listing_app/feature/home/presentation/bloc/product/product_state.dart';
import 'package:product_listing_app/feature/home/presentation/widgets/product_shimmer.dart';
import 'package:product_listing_app/feature/home/presentation/widgets/project_card.dart';

class ListProjects extends StatelessWidget {
  const ListProjects({super.key, required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonTitle(label: label),
        SizedBox(height: Responsive.height(15)),
        BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductInitial) {
            context.read<ProductBloc>().add(LoadProduct());
            return const Center(child: Text("Loading..."));
          } else if (state is ProductLoading) {
            return ProductGridShimmer();
          } else if (state is ProductLoaded) {
            return GridView.builder(
              shrinkWrap: true,                // tells GridView to take only needed space
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: state.products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,          // 2 items per row
                mainAxisSpacing: 16,         // vertical spacing
                crossAxisSpacing: 16,        // horizontal spacing
                childAspectRatio: 0.9,      // width / height ratio of each card
              ),
              itemBuilder: (context, index) {
                final data = state.products[index];
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
          } else if (state is ProductError) {
            return Center(child: Text(state.message));
          }
          return const SizedBox();
        }
        ),
          SizedBox(height: Responsive.height(10)),
      ],
    );
  }
}