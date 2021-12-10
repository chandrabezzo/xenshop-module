import '../../xenshop_cart.dart';
import '../models/cart_product_model.dart';
import '../models/product_model.dart';
import 'cart_product_mapper.dart';

class CartMapper {
  static Cart toEntity(CartProductModel model, ProductModel product) => Cart(
    product: CartProductMapper.toEntity(product),
    quantity: model.quantity,
  );
}
