import 'package:flutter/material.dart';
import 'package:test_task/data/models/product.dart';
import 'package:test_task/view/screens/home/pages/discover/widgets/more_product_widget.dart';
import 'package:test_task/view/widgets/bouncing_icon_button.dart';

class MoreProducts extends StatelessWidget {
  const MoreProducts({
    Key? key,
    required this.categoryName,
  }) : super(key: key);
  final String categoryName;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          moreWidget(context),
          moreProducts(context),
        ],
      ),
    );
  }

  Widget moreProducts(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: mockProducts.length,
        itemBuilder: (context, index) {
          return MoreProductWidget(
            product: mockProducts[index],
            categoryName: categoryName,
          );
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  Widget moreWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            categoryName,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          BouncingIconButton(
            onTap: () {},
            icon: Icons.arrow_right_alt_outlined,
            backgroundColor: Colors.transparent,
          ),
        ],
      ),
    );
  }
}
