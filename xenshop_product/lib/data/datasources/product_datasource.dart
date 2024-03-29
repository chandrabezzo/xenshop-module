import '../models/product_model.dart';

abstract class ProductDatasource {
  Future<List<ProductModel>> products({
    int limit = 10,
    String? category,
  });

  Future<List<String>> get categories;
}
