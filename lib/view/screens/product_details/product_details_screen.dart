import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:test_task/data/models/cart.dart';
import 'package:test_task/data/models/product.dart';
import 'package:test_task/utils/app_theme.dart';
import 'package:test_task/view/screens/cart/cart_cubit.dart';
import 'package:test_task/view/screens/product_details/widget/product_details_appbar.dart';
import 'package:test_task/view/widgets/bouncing_primary_button.dart';
import 'package:test_task/view/widgets/bouncing_widget.dart';

final mockSizes = [
  'Try it',
  '7.5',
  '8',
  '8.5',
  '9',
  '9.5',
  '10',
  '10.5',
  '11',
  '11.5',
];

class ProductDetailsArgs {
  final Product product;
  final String imageTag;
  final String? backgroundTag;

  ProductDetailsArgs({
    required this.product,
    required this.imageTag,
    this.backgroundTag,
  });
}

class ProductDetailsScreen extends StatefulWidget {
  static const String routeName = '/productDetails';
  final ProductDetailsArgs args;
  const ProductDetailsScreen({
    Key? key,
    required this.args,
  }) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  late Product product;
  int _selectedType = 0;
  String _selectedSize = '';
  @override
  void initState() {
    product = widget.args.product;
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
    return CustomScrollView(
      slivers: [
        ProductDetailsAppBar(
          product: product,
          imageTag: widget.args.imageTag,
          backgroundTag: widget.args.backgroundTag,
        ),
        const SliverPadding(
          padding: EdgeInsets.only(
            top: 16,
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 60,
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index) {
                return Container(
                  width: 80,
                  margin: const EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    color: AppTheme.colorSecondarySwatch.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Image.asset(product.image),
                );
              },
            ),
          ),
        ),
        const SliverPadding(
          padding: EdgeInsets.only(
            top: 16,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: AppTheme.colorSecondarySwatch.shade300,
              thickness: 2,
            ),
          ),
        ),
        const SliverPadding(
          padding: EdgeInsets.only(
            top: 16,
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  product.name,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  NumberFormat.simpleCurrency().format(product.price),
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        decorationColor: product.productColor.withOpacity(0.2),
                        decoration: TextDecoration.underline,
                        decorationThickness: 4,
                      ),
                ),
              ],
            ),
          ),
        ),
        const SliverPadding(
          padding: EdgeInsets.only(
            top: 8,
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverToBoxAdapter(
            child: Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: AppTheme.colorSecondarySwatch.shade700,
                  ),
            ),
          ),
        ),
        const SliverPadding(
          padding: EdgeInsets.only(
            top: 8,
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          sliver: SliverToBoxAdapter(
            child: Row(
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'MORE DETAILS',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SliverPadding(
          padding: EdgeInsets.only(
            top: 24,
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Size',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                unitSwitcher(),
              ],
            ),
          ),
        ),
        const SliverPadding(
          padding: EdgeInsets.only(
            top: 16,
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 50,
            child: ListView.builder(
              itemCount: mockSizes.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index) {
                return BouncingWidget(
                  onTap: () {
                    setState(() {
                      _selectedSize = mockSizes[index];
                    });
                  },
                  child: Container(
                    width: 80,
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      color: _selectedSize == mockSizes[index]
                          ? Colors.black
                          : null,
                      border: Border.all(
                        color: AppTheme.colorSecondarySwatch.shade200,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        mockSizes[index],
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontSize: 16,
                              color: _selectedSize == mockSizes[index]
                                  ? Colors.white
                                  : Colors.black,
                            ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget unitSwitcher() {
    return Row(
      children: [
        BouncingWidget(
          onTap: () {
            setState(() {
              _selectedType = 0;
            });
          },
          child: Text(
            'UK',
            style: getStyle(0),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        BouncingWidget(
          onTap: () {
            setState(() {
              _selectedType = 1;
            });
          },
          child: Text(
            'USA',
            style: getStyle(1),
          ),
        ),
      ],
    );
  }

  TextStyle getStyle(int index) {
    if (index == _selectedType) {
      return Theme.of(context).textTheme.headlineSmall!.copyWith(
            fontSize: 16,
            color: Colors.black,
          );
    }

    return Theme.of(context).textTheme.headlineSmall!.copyWith(
          fontSize: 16,
          color: AppTheme.colorSecondarySwatch.shade400,
        );
  }

  Widget bottomContent(BuildContext context) {
    final cartCubit = BlocProvider.of<CartCubit>(context);
    return Padding(
      padding: const EdgeInsets.only(
        top: 16,
        right: 32,
        left: 32,
        bottom: 32,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          BouncingPrimaryButton(
            onTap: () {
              cartCubit.addItemToCart(
                Cart(
                  id: DateTime.now().toIso8601String(),
                  product: product,
                ),
              );
            },
            child: Text(
              'ADD TO BAG',
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Colors.white,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
