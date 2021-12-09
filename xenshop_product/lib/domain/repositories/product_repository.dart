import '../entities/product.dart';

abstract class ProductRepository {
  Future<List<Product>> products({
    int limit = 10,
  });

  Future<List<String>> get categories;
}
