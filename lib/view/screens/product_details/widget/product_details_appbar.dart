import 'package:flutter/material.dart';
import 'package:test_task/data/models/product.dart';
import 'package:test_task/generated/assets.dart';
import 'package:test_task/view/widgets/bouncing_icon_button.dart';
import 'package:test_task/view/widgets/oval_shape_painter.dart';

class ProductDetailsAppBar extends StatelessWidget {
  final Product product;
  final String imageTag;
  final String? backgroundTag;
  const ProductDetailsAppBar({
    Key? key,
    required this.product,
    required this.imageTag,
    required this.backgroundTag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: true,
      snap: false,
      leading: IconButton(
        onPressed: () {
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          }
        },
        icon: Image.asset(
          Assets.imagesLeftArrow,
          width: 24,
          color: Colors.white,
        ),
      ),
      expandedHeight: 300,
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      title: Text(
        product.brand,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Colors.white),
      ),
      centerTitle: true,
      actions: [
        BouncingIconButton(
          icon: Icons.favorite_outline,
          backgroundColor: product.productColor.withOpacity(0.5),
          iconColor: Colors.white,
          showShadow: true,
          onTap: () {},
        ),
        const SizedBox(
          width: 16,
        ),
      ],
      flexibleSpace: FlexibleSpaceBarSettings(
        toolbarOpacity: 0,
        minExtent: 100,
        maxExtent: 300,
        currentExtent: 300,
        child: FlexibleSpaceBar(
          background: Stack(
            children: [
              Positioned.fill(
                child: Hero(
                  tag: backgroundTag ?? '',
                  child: CustomPaint(
                    painter: OvalCustomPainter(product.productColor),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 32,
                bottom: 0,
                child: Hero(
                  tag: imageTag,
                  child: Image.asset(product.image),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
