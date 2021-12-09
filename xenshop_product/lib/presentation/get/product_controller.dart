import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import '../../domain/entities/product.dart';
import '../../domain/entities/rating.dart';

class ProductController extends GetxController {
  final scrollProductsController = ScrollController();

  final _products = Rx<List<Product>>([]);
  final _isLoadingRetrieveProducts = false.obs;
  final _isHideFilter = false.obs;
  final _quantityProduct = 1.obs;

  List<Product> get products => _products.value;
  bool get isLoadingRetrieveProducts => _isLoadingRetrieveProducts.value;
  bool get isHideFilter => _isHideFilter.value;
  int get quantityProduct => _quantityProduct.value;

  @override
  void onInit() {
    super.onInit();
    retrieveProducts();
    scrollProductsController.addListener(scrollListener);
  }

  void refreshProduct() {
    retrieveProducts(limit: 3);
  }

  void scrollListener() {
    if (scrollProductsController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      _isHideFilter.value = true;
    } else {
      _isHideFilter.value = false;
    }
  }

  void retrieveProducts({
    int limit = 10,
  }) async {
    _isLoadingRetrieveProducts.value = true;
    await Future.delayed(const Duration(seconds: 5));
    _products.value = List.generate(
      limit,
      (index) => Product(
        category: 'Category $index',
        description: 'Desc $index',
        id: index,
        image:
            'https://cdn.eraspace.com/pub/media/catalog/product/i/p/iphone_13_pro_max_graphite_1.jpg',
        price: 13000000,
        rating: Rating(
          count: 100,
          rate: 5,
        ),
        title: 'Iphone 13 Pro Max',
      ),
    );
    _isLoadingRetrieveProducts.value = false;
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
