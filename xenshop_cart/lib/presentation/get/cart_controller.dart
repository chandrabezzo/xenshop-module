import 'package:get/get.dart';

import '../../domain/entities/cart.dart';
import '../../domain/entities/cart_product.dart';

class CartController extends GetxController {
  final _isLoadingRetreiveCart = false.obs;
  final _carts = Rx<List<Cart>>([]);

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
          image: 'https://cdn.eraspace.com/pub/media/catalog/product/i/p/iphone_13_pro_max_graphite_1.jpg',
          price: 13000000,
          title: 'iPhone 13 Pro Max'
        ), 
        quantity: index,
      ),
    );
    _isLoadingRetreiveCart.value = false;
  }
}
