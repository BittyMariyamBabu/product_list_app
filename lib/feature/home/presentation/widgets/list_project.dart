import 'package:flutter/material.dart';
import 'package:product_listing_app/core/constants/app_text_styles.dart';
import 'package:product_listing_app/core/utils/responsive.dart';
import 'package:product_listing_app/core/widgets/common_title.dart';
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
        GridView.builder(
          shrinkWrap: true,                // tells GridView to take only needed space
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: 6,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,          // 2 items per row
            mainAxisSpacing: 16,         // vertical spacing
            crossAxisSpacing: 16,        // horizontal spacing
            childAspectRatio: 0.7,      // width / height ratio of each card
          ),
          itemBuilder: (context, index) {
            return ProjectCard();
          },
          ),
          SizedBox(height: Responsive.height(10)),
      ],
    );
  }
}