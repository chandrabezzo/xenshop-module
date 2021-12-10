import 'package:xenshop_core/xenshop_core.dart';
import '../../xenshop_cart.dart';
import '../repositories/cart_repository.dart';

class RetrieveCarts extends UseCase<List<Cart>, NoParams> {
  final ErrorHandler _errorHandler;
  final CartRepository _repository;

  RetrieveCarts({
    required ErrorHandler errorHandler,
    required CartRepository repository,
  })  : _errorHandler = errorHandler,
        _repository = repository;

  @override
  Future<List<Cart>> build(NoParams params) async => await _repository.carts;

  @override
  ErrorHandler errorHandler() => _errorHandler;
}
