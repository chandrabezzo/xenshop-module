import '../entities/cart.dart';

abstract class CartRepository {
  Future<List<Cart>> get carts;
  Future<bool> deleteCart(int id);
}
