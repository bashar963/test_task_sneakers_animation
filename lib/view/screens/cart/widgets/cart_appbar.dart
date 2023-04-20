import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/generated/assets.dart';
import 'package:test_task/utils/app_theme.dart';
import 'package:test_task/view/screens/cart/cart_cubit.dart';
import 'package:test_task/view/widgets/bouncing_icon_button.dart';

class CartAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CartAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight * 2);

  @override
  Widget build(BuildContext context) {
    final cartCubit = BlocProvider.of<CartCubit>(context, listen: true);
    return AppBar(
      leading: IconButton(
        onPressed: () {
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          }
        },
        icon: Image.asset(
          Assets.imagesLeftArrow,
          width: 24,
        ),
      ),
      actions: [
        BouncingIconButton(
          icon: Icons.delete_sweep_outlined,
          onTap: cartCubit.state.carts.isEmpty
              ? null
              : () {
                  cartCubit.removeAll();
                },
        ),
        const SizedBox(
          width: 16,
        ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'My bag',
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  Text(
                    'Total ${cartCubit.state.carts.length} Items',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              Divider(
                color: AppTheme.colorSecondarySwatch.shade200,
                thickness: 4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
