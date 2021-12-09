import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/product_datasource.dart';
import '../mappers/product_mapper.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductDatasource _dataSource;

  ProductRepositoryImpl({
    required ProductDatasource dataSource,
  }) : _dataSource = dataSource;

  @override
  Future<List<Product>> products({int limit = 10}) async {
    final models = await _dataSource.products(limit: limit);
    return models
        .map(
          (product) => ProductMapper.toEntity(product),
        )
        .toList();
  }

  @override
  Future<List<String>> get categories async => await _dataSource.categories;
}
