import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:xenshop_core/xenshop_core.dart';
import '../../data/datasources/product_datasource.dart';
import '../../data/datasources/product_datasource_impl.dart';
import '../../data/repositories/product_repository_impl.dart';
import '../../domain/repositories/product_repository.dart';
import '../../domain/usecases/retrieve_products.dart';
import 'product_controller.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ProductDatasource>(ProductDatasourceImpl(
      client: Get.find<Dio>(),
    ),);

    Get.put<ProductRepository>(
      ProductRepositoryImpl(dataSource: Get.find<ProductDatasource>()),
    );

    Get.put(
      RetrieveProducts(
        errorHandler: Get.find<ErrorHandler>(),
        repository: Get.find<ProductRepository>(),
      ),
    );

    Get.put(
      ProductController(
        retrieveProducts: Get.find<RetrieveProducts>(),
      ),
    );
  }
}
