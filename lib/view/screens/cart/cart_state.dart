part of 'cart_cubit.dart';

abstract class CartState extends Equatable {
  final List<Cart> carts;

  const CartState(this.carts);
}

class CartInitial extends CartState {
  CartInitial() : super([]);

  @override
  List<Object> get props => [carts];
}

class CartLoaded extends CartState {
  const CartLoaded(List<Cart> carts) : super(carts);

  @override
  List<Object> get props => [carts];
}
