import 'package:flutter/material.dart';
import 'package:test_task/data/models/product.dart';
import 'package:test_task/utils/app_theme.dart';
import 'package:test_task/view/screens/home/pages/discover/widgets/vertical_animated_product_widget.dart';

import 'package:test_task/view/widgets/bouncing_text_button.dart';

import 'dart:math' as math;

class VerticalAnimatedProducts extends StatefulWidget {
  final List<Product> products;
  const VerticalAnimatedProducts({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  State<VerticalAnimatedProducts> createState() =>
      _VerticalAnimatedProductsState();
}

class _VerticalAnimatedProductsState extends State<VerticalAnimatedProducts> {
  int _selectedType = 1;

  final double typeWidth = 90;

  final pageController = PageController(
    viewportFraction: 0.8,
    initialPage: 0,
    keepPage: false,
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: typeWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Transform.rotate(
                angle: math.pi / -2,
                child: BouncingTextButton(
                  onTap: () {
                    setState(() {
                      _selectedType = 0;
                    });
                  },
                  child: Text(
                    'Upcoming',
                    style: getStyle(0),
                  ),
                ),
              ),
              Transform.rotate(
                angle: math.pi / -2,
                child: BouncingTextButton(
                  onTap: () {
                    setState(() {
                      _selectedType = 1;
                    });
                  },
                  child: Text(
                    'Featured',
                    style: getStyle(1),
                  ),
                ),
              ),
              Transform.rotate(
                angle: math.pi / -2,
                child: BouncingTextButton(
                  onTap: () {
                    setState(() {
                      _selectedType = 2;
                    });
                  },
                  child: Text(
                    'New',
                    style: getStyle(2),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: PageView.builder(
            controller: pageController,
            padEnds: true,
            itemBuilder: (context, index) {
              return VerticalAnimatedProductWidget(
                pageController: pageController,
                pageIndex: index,
                product: widget.products[index],
              );
            },
            clipBehavior: Clip.none,
            itemCount: widget.products.length,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }

  TextStyle getStyle(int index) {
    if (index == _selectedType) {
      return Theme.of(context).textTheme.headlineSmall!.copyWith(
            fontSize: 12,
            color: Colors.black,
          );
    }

    return Theme.of(context).textTheme.headlineSmall!.copyWith(
          fontSize: 12,
          color: AppTheme.colorSecondarySwatch.shade400,
        );
  }
}
