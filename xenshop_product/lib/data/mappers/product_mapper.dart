import '../../domain/entities/product.dart';
import '../models/product_model.dart';
import 'rating_mapper.dart';

class ProductMapper {
  static Product toEntity(ProductModel model) => Product(
    category: model.category,
    description: model.description,
    id: model.id,
    image: model.image,
    price: model.price,
    rating: RatingMapper.toEntity(model.rating),
    title: model.title,
  );
}
