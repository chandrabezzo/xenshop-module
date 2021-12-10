import 'package:get/get.dart';
import 'package:xenshop_core/xenshop_core.dart';

import '../../domain/entities/cart.dart';
import '../../domain/usecases/retrieve_carts.dart';

class CartController extends GetxController {
  final RetrieveCarts _retrieveCarts;

  CartController({
    required RetrieveCarts retrieveCarts,
  }) : _retrieveCarts = retrieveCarts;

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
    _retrieveCarts.execute(NoParams()).then((result) {
      _carts.value = result;
      _isLoadingRetreiveCart.value = false;
    });
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
