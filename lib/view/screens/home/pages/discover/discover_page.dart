import 'package:flutter/material.dart';
import 'package:test_task/view/screens/home/pages/discover/widgets/discover_appbar.dart';
import 'package:test_task/view/screens/home/pages/discover/widgets/featured_products.dart';
import 'package:test_task/view/screens/home/pages/discover/widgets/more_products.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        DiscoverAppBar(),
        FeaturedProducts(),
        MoreProducts(
          categoryName: 'More',
        ),
        MoreProducts(
          categoryName: 'New Session',
        ),
        MoreProducts(
          categoryName: 'On Sale',
        ),
      ],
    );
  }
}
