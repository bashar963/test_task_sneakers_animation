import 'package:flutter/material.dart';
import 'package:test_task/data/models/product.dart';
import 'package:test_task/utils/app_theme.dart';
import 'package:test_task/view/screens/home/pages/discover/widgets/vertical_animated_products.dart';

const List<String> brands = [
  'Nike',
  'Adidas',
  'Jordan',
  'Puma',
  'New Balance',
  'Converse',
  'Vans',
  'Reebok',
  'Saucony',
  'Asics',
];

class FeaturedProducts extends StatelessWidget {
  const FeaturedProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: DefaultTabController(
        length: brands.length,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            tabBarItems(context),
            tabBarViews(context),
          ],
        ),
      ),
    );
  }

  Widget tabBarItems(BuildContext context) {
    return TabBar(
      labelStyle: Theme.of(context).textTheme.headlineSmall!.copyWith(
            fontSize: 14,
          ),
      labelColor: Colors.black,
      unselectedLabelStyle: Theme.of(context).textTheme.headlineSmall!.copyWith(
            fontSize: 14,
          ),
      unselectedLabelColor: AppTheme.colorSecondarySwatch.shade400,
      indicatorSize: TabBarIndicatorSize.tab,
      indicator: UnderlineTabIndicator(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          width: 6.0,
          color: AppTheme.colorSecondarySwatch.shade200,
        ),
        insets: const EdgeInsets.only(bottom: 16, right: 8, left: 8),
      ),
      splashFactory: NoSplash.splashFactory,
      isScrollable: true,
      tabs: brands.map(
        (e) {
          return Tab(
            text: e,
          );
        },
      ).toList(),
    );
  }

  Widget tabBarViews(BuildContext context) {
    return SizedBox(
      height: 360,
      child: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
          brands.length,
          (_) {
            return VerticalAnimatedProducts(products: mockProducts);
          },
        ),
      ),
    );
  }
}
