import 'package:get/get.dart';

import '../../domain/entities/cart.dart';
import '../../domain/entities/cart_product.dart';

class CartController extends GetxController {
  final _isLoadingRetreiveCart = false.obs;
  final _carts = Rx<List<Cart>>([]);
  final _totalPrice = 0.toDouble().obs;

  bool get isLoadingRetrieveCart => _isLoadingRetreiveCart.value;
  List<Cart> get carts => _carts.value;

  @override
  void onInit() {
    super.onInit();
    retrieveCart();
  }

  void retrieveCart() async {
    _isLoadingRetreiveCart.value = true;
    await Future.delayed(const Duration(seconds: 3));
    _carts.value = List.generate(
      5,
      (index) => Cart(
        product: CartProduct(
          id: index,
          image:
              'https://cdn.eraspace.com/pub/media/catalog/product/i/p/iphone_13_pro_max_graphite_1.jpg',
          price: 13000,
          title: 'iPhone 13 Pro Max',
        ),
        quantity: index + 1,
      ),
    );
    _isLoadingRetreiveCart.value = false;
  }

  void onDecreaseQuantity(int index) {
    final cart = _carts.value[index];
    int currentQuantity = cart.quantity;
    final decreasedQuantity = currentQuantity - 1;
    if (decreasedQuantity != 0) cart.quantity = decreasedQuantity;
    _carts.refresh();
  }

  void onIncreaseQuantity(int index) {
    final cart = _carts.value[index];
    int currentQuantity = cart.quantity;
    final increasedQuantity = currentQuantity + 1;
    cart.quantity = increasedQuantity;
    _carts.refresh();
  }

  void onRemoveFromCart(int index) {
    final cart = _carts.value[index];
    _carts.value.remove(cart);
    _carts.refresh();
  }

  double get totalPrice {
    double total = 0;
    for (Cart cart in _carts.value) {
      total += (cart.product.price * cart.quantity);
    }

    _totalPrice.value = total;
    return _totalPrice.value;
  }
}
