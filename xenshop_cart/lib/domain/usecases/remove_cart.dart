import 'package:xenshop_core/xenshop_core.dart';

import '../repositories/cart_repository.dart';

class RemoveCart extends UseCase<bool, int> {
  final ErrorHandler _errorHandler;
  final CartRepository _repository;

  RemoveCart({
    required ErrorHandler errorHandler,
    required CartRepository repository,
  })  : _errorHandler = errorHandler,
        _repository = repository;

  @override
  Future<bool> build(int params) async => await _repository.deleteCart(params);

  @override
  ErrorHandler errorHandler() => _errorHandler;
}
