import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import '../../domain/entities/product.dart';
import '../../domain/usecases/retrieve_products.dart';

class ProductController extends GetxController {
  final RetrieveProducts _retrieveProducts;

  ProductController({
    required RetrieveProducts retrieveProducts,
  }) : _retrieveProducts = retrieveProducts;

  final scrollProductsController = ScrollController();

  final _products = Rx<List<Product>>([]);
  final _isLoadingRetrieveProducts = false.obs;
  final _isLoadLoadMoreProducts = false.obs;
  final _isHideFilter = false.obs;
  final _quantityProduct = 1.obs;
  final _limit = 10.obs;

  List<Product> get products => _products.value;
  bool get isLoadingRetrieveProducts => _isLoadingRetrieveProducts.value;
  bool get isLoadMoreProducts => _isLoadLoadMoreProducts.value;
  bool get isHideFilter => _isHideFilter.value;
  int get quantityProduct => _quantityProduct.value;
  int get limit => _limit.value;

  @override
  void onInit() {
    super.onInit();
    retrieveProducts();
    scrollProductsController.addListener(scrollListener);
  }

  void refreshProduct() {
    _limit.value = 10;
    retrieveProducts(limit: _limit.value);
  }

  void scrollListener() {
    if (scrollProductsController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      _isHideFilter.value = true;
    } else {
      _isHideFilter.value = false;
    }

    if (scrollProductsController.position.pixels ==
        scrollProductsController.position.maxScrollExtent) {
      _isLoadLoadMoreProducts.value = true;

      final increasedLimit = _limit.value + 10;
      _limit.value = increasedLimit;

      loadMoreProducts(
        limit: _limit.value,
      );
    }
  }

  void retrieveProducts({
    int limit = 10,
  }) async {
    _isLoadingRetrieveProducts.value = true;
    _retrieveProducts
        .execute(
      RetrieveProductsParams(
        limit: limit,
      ),
    )
        .then((value) {
      _products.value = value;
      _isLoadingRetrieveProducts.value = false;
    });
  }

  void loadMoreProducts({
    int limit = 10,
  }) async {
    _isLoadLoadMoreProducts.value = true;
    _retrieveProducts
        .execute(
      RetrieveProductsParams(
        limit: limit,
      ),
    )
        .then((value) {
      final currentProducts = _products.value;
      currentProducts.addAll(value);
      _products.value = currentProducts;
      _products.refresh();
      _isLoadLoadMoreProducts.value = false;
    });
  }

  void setInitialQuantityProduct() => _quantityProduct.value = 1;

  void increaseQuantityProduct() {
    final currentQuantity = _quantityProduct.value;
    _quantityProduct.value = currentQuantity + 1;
  }

  void decreaseQuantityProduct() {
    final currentQuantity = _quantityProduct.value;
    _quantityProduct.value = currentQuantity - 1;
  }

  @override
  void onClose() {
    scrollProductsController.removeListener(scrollListener);
    super.onClose();
  }
}
