import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:xenshop_core/base/colors.dart';
import 'package:xenshop_core/base/xenshop_text_style.dart';

import '../../const/i18n/product_strings.dart';
import '../../domain/entities/product.dart';
import '../get/product_controller.dart';
import '../widgets/add_to_cart_widget.dart';
import '../widgets/filter_product_widget.dart';
import '../widgets/product_widget.dart';

class BaseProductPage extends GetView<ProductController> {
  static const routeName = '/products';
  const BaseProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: white,
        appBar: buildAppBar(context),
        body: buildBody(context),
        floatingActionButton: Obx(
          () => Visibility(
            visible:
                controller.isLoadingRetrieveProducts || controller.isHideFilter,
            child: const SizedBox.shrink(),
            replacement: buildFloatingActionButton(context),
          ),
        ),
      );

  AppBar buildAppBar(BuildContext context) => AppBar(
        backgroundColor: blue,
        title: Text(
          ProductStrings.product.tr,
          style: XenshopTextStyle.headline5(
            context: context,
            color: white,
          ),
        ),
        actions: buildActions(context),
      );

  List<Widget> buildActions(BuildContext context) => [
        IconButton(
          onPressed: () => onCartPressed(context),
          icon: const Icon(Icons.shopping_cart),
        ),
      ];

  Widget buildBody(BuildContext context) => RefreshIndicator(
        onRefresh: () async => controller.refreshProduct(),
        child: Obx(
          () => (controller.isLoadingRetrieveProducts)
              ? buildBodySkeleton(context)
              : buildBodyProducts(context, controller.products),
        ),
      );

  Widget buildFloatingActionButton(BuildContext context) =>
      FloatingActionButton(
        backgroundColor: blue,
        onPressed: () => onFilterPressed(context),
        child: const Icon(Icons.filter_list),
      );

  Widget buildBodySkeleton(BuildContext context) => Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: ListView.builder(
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(
              bottom: 16,
            ),
            child: ProductWidget.skeleton,
          ),
          itemCount: 20,
        ),
      );

  Widget buildBodyProducts(BuildContext context, List<Product> products) =>
      Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: controller.scrollProductsController,
              itemBuilder: (context, index) {
                final product = products[index];
                return Padding(
                  padding: const EdgeInsets.only(
                    bottom: 16,
                  ),
                  child: ProductWidget(
                    product: product,
                    onAddToCartPressed: (product) =>
                        onAddCartPressed(context, product),
                  ),
                );
              },
              itemCount: products.length,
            ),
          ),
          Visibility(
            visible: controller.isLoadMoreProducts,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Shimmer.fromColors(
                child: ProductWidget.skeleton,
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
              ),
            ),
            replacement: const SizedBox.shrink(),
          )
        ],
      );

  void onCartPressed(BuildContext context) => debugPrint('On Cart Pressed');

  void onAddCartPressed(BuildContext context, Product product) {
    controller.setInitialQuantityProduct();
    Get.bottomSheet(
      Obx(
        () => AddToCartWidget(
          onAddToCartPressed: () => onAddToCartPressed(context, product),
          onDecreaseQuantity: () => onDecreaseQuantity(context),
          onIncreaseQuantity: () => onIncreaseQuantity(context),
          quantity: controller.quantityProduct,
        ),
      ),
      backgroundColor: white,
    );
  }

  void onAddToCartPressed(BuildContext context, Product product) {
    final currentQuantity = controller.quantityProduct;
    debugPrint('$currentQuantity ${product.title} Added to cart');
    Get.back();
  }

  void onIncreaseQuantity(BuildContext context) =>
      controller.increaseQuantityProduct();

  void onDecreaseQuantity(BuildContext context) =>
      controller.decreaseQuantityProduct();

  void onFilterPressed(BuildContext context) => Get.bottomSheet(
        Obx(
          () => FilterProductWidget(
            categories: controller.categories,
            onCategorySelected: (category) =>
                onCategorySelected(context, category),
          ),
        ),
        backgroundColor: white,
      );

  void onCategorySelected(BuildContext context, String category) {
    controller.retrieveProducts(
      category: category,
      limit: controller.limit,
    );
    Get.back();
  }
}
