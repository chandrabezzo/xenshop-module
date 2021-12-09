import 'package:xenshop_cart/domain/entities/cart_product.dart';

class Cart {
  final CartProduct product;
  final int quantity;

  const Cart({
    required this.product,
    required this.quantity,
  });
}
