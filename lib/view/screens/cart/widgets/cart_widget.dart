import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:test_task/data/models/cart.dart';

import 'package:test_task/utils/app_theme.dart';
import 'package:test_task/view/screens/cart/cart_cubit.dart';
import 'package:test_task/view/widgets/bouncing_rounded_icon_button.dart';

class CartWidget extends StatefulWidget {
  final Cart item;
  final bool isRemove;

  final Animation<double> animation;
  const CartWidget({
    Key? key,
    required this.item,
    this.isRemove = false,
    required this.animation,
  }) : super(key: key);

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget>
    with SingleTickerProviderStateMixin {
  late Cart item;
  late bool isRemove;

  late Animation<double> animation;

  @override
  void initState() {
    item = widget.item;
    isRemove = widget.isRemove;

    animation = widget.animation;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cartCubit = BlocProvider.of<CartCubit>(
      context,
    );

    return SizeTransition(
      key: ValueKey(item.id),
      sizeFactor: Tween<double>(
        begin: isRemove ? 0.2 : 0.6,
        end: 1,
      ).animate(animation),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 32,
        ),
        child: Row(
          children: [
            itemAvatar(item.product.image),
            const SizedBox(
              width: 32,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SlideTransition(
                    position: animation.drive(
                      Tween(
                        begin: const Offset(0.6, 0.0),
                        end: const Offset(0.0, 0.0),
                      ).chain(
                        CurveTween(curve: Curves.easeIn),
                      ),
                    ),
                    child: Text(
                      item.product.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SlideTransition(
                    position: animation.drive(
                      Tween(
                        begin: const Offset(0.7, 0.0),
                        end: const Offset(0.0, 0.0),
                      ).chain(
                        CurveTween(curve: Curves.easeIn),
                      ),
                    ),
                    child: Text(
                      NumberFormat.simpleCurrency().format(item.total),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w800,
                          ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SlideTransition(
                    position: animation.drive(
                      Tween(
                        begin: const Offset(0.8, 0.0),
                        end: const Offset(0.0, 0.0),
                      ).chain(
                        CurveTween(curve: Curves.easeIn),
                      ),
                    ),
                    child: Row(
                      children: [
                        BouncingRoundedIconButton(
                          icon: Icons.remove,
                          onTap: () {
                            if (item.quantity == 1) {
                              cartCubit.removeItemFromCart(item);
                            } else {
                              cartCubit.updateQuantityForCart(
                                item,
                                item.quantity - 1,
                              );
                            }
                          },
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Text(
                          item.quantity.toString(),
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        BouncingRoundedIconButton(
                          icon: Icons.add,
                          onTap: () {
                            cartCubit.updateQuantityForCart(
                              item,
                              item.quantity + 1,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget itemAvatar(String image) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        const SizedBox(
          width: 100,
          height: 100,
        ),
        ScaleTransition(
          scale: TweenSequence<double>(
            [
              TweenSequenceItem(
                tween: Tween(
                  begin: 0.6,
                  end: 1.1,
                ),
                weight: 0.5,
              ),
              TweenSequenceItem(
                tween: Tween(
                  begin: 1.1,
                  end: 1.0,
                ),
                weight: 0.5,
              ),
            ],
          ).animate(animation),
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: AppTheme.colorSecondarySwatch.shade300,
              borderRadius: BorderRadius.circular(24),
            ),
          ),
        ),
        Positioned(
          top: -24,
          right: -24,
          left: 8,
          bottom: 16,
          child: ScaleTransition(
            scale: TweenSequence<double>(
              [
                TweenSequenceItem(
                  tween: Tween(
                    begin: 0.4,
                    end: 1.4,
                  ),
                  weight: 0.5,
                ),
                TweenSequenceItem(
                  tween: Tween(
                    begin: 1.4,
                    end: 1.1,
                  ),
                  weight: 0.5,
                ),
              ],
            ).animate(animation),
            child: Image.asset(
              image,
              width: 140,
              height: 140,
            ),
          ),
        ),
      ],
    );
  }
}
