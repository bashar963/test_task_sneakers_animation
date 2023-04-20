import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:test_task/data/models/product.dart';
import 'package:test_task/data/service/local/navigation/navigation.dart';
import 'package:test_task/di/configure_dependencies.dart';
import 'package:test_task/view/screens/screens.dart';
import 'package:test_task/view/widgets/bouncing_icon_button.dart';

class VerticalAnimatedProductWidget extends StatefulWidget {
  final Product product;
  final int pageIndex;
  final PageController pageController;
  const VerticalAnimatedProductWidget({
    Key? key,
    required this.product,
    required this.pageIndex,
    required this.pageController,
  }) : super(key: key);

  @override
  State<VerticalAnimatedProductWidget> createState() =>
      _VerticalAnimatedProductWidgetState();
}

class _VerticalAnimatedProductWidgetState
    extends State<VerticalAnimatedProductWidget>
    with SingleTickerProviderStateMixin {
  late Product product;
  late int pageIndex;
  late PageController pageController;
  late AnimationController? _controller;
  late double _scale;
  @override
  void initState() {
    product = widget.product;
    pageIndex = widget.pageIndex;
    pageController = widget.pageController;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      lowerBound: 0.0,
      upperBound: 0.2,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller!.stop();
    _controller!.dispose();
    _controller = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: pageController,
      builder: (context, _) {
        var value = 0.0;

        if (pageController.position.haveDimensions) {
          value = (pageController.page ?? 0) - pageIndex;
          if (value > 0) {
            value = -value.abs().clamp(0.0, 1.0);
          } else {
            value = 0.0;
          }
        }

        return SlideTransition(
          position: Tween<Offset>(
            begin: Offset.zero,
            end: const Offset(0.8, 0),
          ).animate(AlwaysStoppedAnimation<double>(value)),
          child: Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(value),
            child: child(context, value),
          ),
        );
      },
    );
  }

  Widget child(BuildContext context, double value) {
    final imageTag = 'imageTag${product.id}featured';
    final backgroundTag = 'backgroundTag${product.id}featured';
    _scale = 1 - _controller!.value;
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: (details) => _onTapUp(details, imageTag, backgroundTag),
      onTapCancel: _onTapCancel,
      child: Stack(
        children: [
          Positioned.fill(
            right: 24,
            child: Hero(
              tag: backgroundTag,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: product.productColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                margin: const EdgeInsets.only(
                  right: 24,
                  bottom: 32,
                  top: 32,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                product.brand,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      color: Colors.white,
                                    ),
                              ),
                              Text(
                                product.name,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      color: Colors.white,
                                    ),
                              ),
                              Text(
                                NumberFormat.simpleCurrency()
                                    .format(product.price),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      color: Colors.white,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        BouncingIconButton(
                          onTap: () {},
                          icon: Icons.favorite_outline,
                          iconColor: Colors.white,
                          backgroundColor: Colors.transparent,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Icon(
                          Icons.arrow_right_alt_outlined,
                          color: Colors.white,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            right: 0,
            child: Hero(
              tag: imageTag,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: Offset.zero,
                  end: const Offset(1.5, 0),
                ).animate(AlwaysStoppedAnimation<double>(value)),
                child: Transform.scale(
                  scale: _scale,
                  child: Image.asset(
                    product.image,
                    width: 210,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onTapDown(TapDownDetails details) {
    HapticFeedback.selectionClick();
    _controller?.forward.call();
  }

  Future<void> _onTapUp(
    TapUpDetails details,
    String imageTag,
    String backgroundTag,
  ) async {
    await Future.delayed(const Duration(milliseconds: 200), () {
      _controller?.reverse.call();
    });

    unawaited(
      getIt.get<NavigationService>().navigateTo(
            ProductDetailsScreen.routeName,
            ProductDetailsArgs(
              product: product,
              imageTag: imageTag,
              backgroundTag: backgroundTag,
            ),
          ),
    );
  }

  void _onTapCancel() {
    _controller?.reverse.call();
  }
}
