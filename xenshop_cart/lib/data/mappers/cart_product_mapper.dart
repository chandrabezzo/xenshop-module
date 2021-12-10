import '../../xenshop_cart.dart';
import '../models/product_model.dart';

class CartProductMapper {
  static CartProduct toEntity(ProductModel product) =>
      CartProduct(
        id: product.id,
        image: product.image,
        price: product.price,
        title: product.title,
      );
}
