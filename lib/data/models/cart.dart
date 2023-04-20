import 'package:equatable/equatable.dart';
import 'package:test_task/data/models/product.dart';

class Cart extends Equatable {
  final String id;
  int quantity;
  bool isNew;
  final Product product;

  Cart({
    required this.id,
    this.quantity = 1,
    required this.product,
    this.isNew = true,
  });

  num get total => product.price * quantity;

  @override
  List<Object?> get props => [id, quantity];
}
