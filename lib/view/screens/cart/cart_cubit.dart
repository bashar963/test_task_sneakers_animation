import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:test_task/data/models/cart.dart';
import 'package:test_task/view/screens/cart/widgets/cart_widget.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  late GlobalKey<AnimatedListState> _listKey;
  Future<void> assignListKey(GlobalKey<AnimatedListState> listKey) async {
    _listKey = listKey;
    final carts = [...state.carts];
    final animatedItems = carts.where((value) => !value.isNew).toList();
    emit(CartLoaded(animatedItems));
    await Future.delayed(const Duration(milliseconds: 100));
    for (var item in carts.where((value) => value.isNew)) {
      final newState = <Cart>[];
      item.isNew = false;
      newState.add(item);
      newState.addAll(state.carts);
      emit(CartLoaded(newState));
      _listKey.currentState
          ?.insertItem(0, duration: const Duration(milliseconds: 400));
      await Future.delayed(const Duration(milliseconds: 600));
    }
  }

  void addItemToCart(Cart cart) {
    final newState = <Cart>[];
    newState.add(cart);
    newState.addAll(state.carts);

    emit(CartLoaded(newState));
  }

  Future<void> removeAll() async {
    final carts = [...state.carts];
    for (var cart in carts) {
      _listKey.currentState?.removeItem(
        0,
        (_, animation) => CartWidget(
          key: UniqueKey(),
          item: cart,
          animation: animation,
          isRemove: true,
        ),
        duration: const Duration(milliseconds: 200),
      );
      await Future.delayed(const Duration(milliseconds: 300));
    }
    emit(const CartLoaded([]));
  }

  void removeItemFromCart(Cart cart) {
    final newState = [...state.carts];
    _listKey.currentState?.removeItem(
      newState.indexOf(cart),
      (_, animation) => CartWidget(
        key: UniqueKey(),
        item: cart,
        animation: animation,
        isRemove: true,
      ),
      duration: const Duration(milliseconds: 400),
    );

    newState.remove(cart);
    emit(CartLoaded(newState));
  }

  void updateQuantityForCart(Cart cart, int newQuantity) {
    final newState = [...state.carts];
    final index = newState.indexWhere((element) => element.id == cart.id);
    if (index >= 0) {
      newState[index].quantity = newQuantity;
    }
    emit(CartInitial());
    emit(CartLoaded(newState));
  }

  String getTotal() {
    var total = 0.0;
    for (var item in state.carts) {
      total += item.total;
    }

    return NumberFormat.simpleCurrency().format(total);
  }
}
