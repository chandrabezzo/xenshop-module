import 'cart_product.dart';

class Cart {
  final CartProduct product;
  int quantity;

  Cart({
    required this.product,
    this.quantity = 0,
  });
}
