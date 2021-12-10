import '../../domain/entities/cart.dart';
import '../../domain/repositories/cart_repository.dart';
import '../../xenshop_cart.dart';
import '../datasources/cart_datasource.dart';
import '../mappers/cart_mapper.dart';
import '../models/cart_product_model.dart';

class CartRepositoryImpl implements CartRepository {
  final CartDatasource _dataSource;

  CartRepositoryImpl({
    required CartDatasource dataSource,
  }) : _dataSource = dataSource;

  @override
  Future<List<Cart>> get carts async {
    final model = await _dataSource.carts;
    final list = <Cart>[];

    for (CartProductModel product in model) {
      final productModel = await _dataSource.product(product.productId);
      final entityCart = CartMapper.toEntity(product, productModel);
      list.add(entityCart);
    }

    return list;
  }

  @override
  Future<bool> deleteCart(int id) async => 
    await _dataSource.deleteCart;
}
