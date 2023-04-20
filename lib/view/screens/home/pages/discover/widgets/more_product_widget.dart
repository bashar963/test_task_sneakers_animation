import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_task/data/models/product.dart';
import 'package:test_task/data/service/local/navigation/navigation.dart';
import 'package:test_task/di/configure_dependencies.dart';
import 'package:test_task/utils/app_theme.dart';
import 'package:test_task/view/screens/screens.dart';
import 'package:test_task/view/widgets/bouncing_icon_button.dart';
import 'package:test_task/view/widgets/bouncing_widget.dart';
import 'package:test_task/view/widgets/new_badge.dart';

class MoreProductWidget extends StatelessWidget {
  const MoreProductWidget({
    Key? key,
    required this.product,
    required this.categoryName,
  }) : super(key: key);
  final Product product;
  final String categoryName;
  @override
  Widget build(BuildContext context) {
    final tag = 'productImage${product.id}$categoryName';
    return BouncingWidget(
      onTap: () {
        getIt.get<NavigationService>().navigateTo(
              ProductDetailsScreen.routeName,
              ProductDetailsArgs(
                product: product,
                imageTag: tag,
              ),
            );
      },
      child: Container(
        width: MediaQuery.of(context).size.width * .4,
        margin: const EdgeInsets.only(
          top: 24,
          bottom: 24,
          right: 16,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: AppTheme.colorSecondarySwatch.shade300,
              offset: const Offset(2, 5),
              blurRadius: 15,
            ),
          ],
        ),
        child: Stack(
          children: [
            const Positioned(
              top: 28,
              left: -28,
              child: NewBadge(),
            ),
            Positioned.fill(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      BouncingIconButton(
                        onTap: () {},
                        icon: Icons.favorite_outline,
                        backgroundColor: Colors.transparent,
                      ),
                    ],
                  ),
                  Hero(
                    tag: tag,
                    child: Image.asset(
                      product.image,
                      height: 100,
                    ),
                  ),
                  Text(
                    product.name,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    NumberFormat.simpleCurrency().format(
                      product.price,
                    ),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
