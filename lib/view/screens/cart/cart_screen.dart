import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/utils/app_theme.dart';
import 'package:test_task/view/screens/cart/cart_cubit.dart';
import 'package:test_task/view/screens/cart/widgets/cart_appbar.dart';
import 'package:test_task/view/screens/cart/widgets/cart_widget.dart';
import 'package:test_task/view/widgets/bouncing_primary_button.dart';

class CartScreen extends StatefulWidget {
  static const String routeName = '/cart';
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  @override
  void initState() {
    final cartCubit = BlocProvider.of<CartCubit>(context);
    cartCubit.assignListKey(listKey);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: content(context),
      bottomNavigationBar: bottomContent(context),
    );
  }

  Widget content(BuildContext context) {
    final cartCubit = BlocProvider.of<CartCubit>(context, listen: true);

    return CustomScrollView(
      slivers: [
        const CartAppBar(),
        SliverFillRemaining(
          child: AnimatedList(
            key: listKey,
            initialItemCount: cartCubit.state.carts.length,
            itemBuilder: (context, index, animation) {
              if (cartCubit.state.carts.length == index) {
                return const SizedBox.shrink();
              }
              return CartWidget(
                key: UniqueKey(),
                item: cartCubit.state.carts[index],
                animation: animation,
              );
            },
          ),
        ),
      ],
    );
  }

  Widget bottomContent(BuildContext context) {
    final cartCubit = BlocProvider.of<CartCubit>(context, listen: true);
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 32,
        left: 16,
        right: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(
            color: AppTheme.colorSecondarySwatch.shade200,
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'TOTAL',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                cartCubit.getTotal(),
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: BouncingPrimaryButton(
              onTap: cartCubit.state.carts.isEmpty ? null : () {},
              child: Text(
                'Next',
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
