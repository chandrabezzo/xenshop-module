import 'package:xenshop_core/xenshop_core.dart';
import '../../xenshop_product.dart';

class RetrieveCategories extends UseCase<List<String>, NoParams> {
  final ErrorHandler _errorHandler;
  final ProductRepository _repository;

  RetrieveCategories({
    required ErrorHandler errorHandler,
    required ProductRepository repository,
  })  : _errorHandler = errorHandler,
        _repository = repository;

  @override
  Future<List<String>> build(NoParams params) async =>
      await _repository.categories;

  @override
  ErrorHandler errorHandler() => _errorHandler;
}
