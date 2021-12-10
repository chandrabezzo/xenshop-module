import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:xenshop_core/xenshop_core.dart';

import '../../data/datasources/cart_datasource.dart';
import '../../data/datasources/cart_datasource_impl.dart';
import '../../data/repositories/cart_repository_impl.dart';
import '../../domain/repositories/cart_repository.dart';
import '../../domain/usecases/remove_cart.dart';
import '../../domain/usecases/retrieve_carts.dart';
import 'cart_controller.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CartDatasource>(
      CartDatasourceImpl(
        client: Get.find<Dio>(),
      ),
    );

    Get.put<CartRepository>(
      CartRepositoryImpl(
        dataSource: Get.find<CartDatasource>(),
      ),
    );

    Get.put(
      RetrieveCarts(
        errorHandler: Get.find<ErrorHandler>(),
        repository: Get.find<CartRepository>(),
      ),
    );
    Get.put(RemoveCart(
      errorHandler: Get.find<ErrorHandler>(),
      repository: Get.find<CartRepository>(),
    ),);

    Get.put(
      CartController(
        retrieveCarts: Get.find<RetrieveCarts>(),
        removeCart: Get.find<RemoveCart>(),
      ),
    );
  }
}
