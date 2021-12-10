import '../models/cart_product_model.dart';
import '../models/product_model.dart';

abstract class CartDatasource {
  Future<List<CartProductModel>> get carts;
  Future<ProductModel> product(int id);
  Future<bool> get deleteCart;
}
