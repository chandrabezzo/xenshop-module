import 'package:xenshop_core/base/usecase.dart';
import 'package:xenshop_core/error/error_handler.dart';
import '../entities/product.dart';
import '../repositories/product_repository.dart';

class RetrieveProducts extends UseCase<List<Product>, RetrieveProductsParams> {
  final ErrorHandler _errorHandler;
  final ProductRepository _repository;

  RetrieveProducts({
    required ErrorHandler errorHandler,
    required ProductRepository repository,
  })  : _errorHandler = errorHandler,
        _repository = repository;

  @override
  Future<List<Product>> build(RetrieveProductsParams params) async =>
      await _repository.products(
        limit: params.limit,
        category: params.category,
      );

  @override
  ErrorHandler errorHandler() => _errorHandler;
}

class RetrieveProductsParams {
  final String? category;
  final int limit;

  const RetrieveProductsParams({
    this.category,
    required this.limit,
  });
}
