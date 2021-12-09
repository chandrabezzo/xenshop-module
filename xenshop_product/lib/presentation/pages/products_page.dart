import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:xenshop_core/base/colors.dart';
import 'package:xenshop_core/base/xenshop_text_style.dart';

import '../../const/i18n/product_strings.dart';
import '../../domain/entities/product.dart';
import '../get/product_controller.dart';
import '../widgets/filter_product_widget.dart';
import '../widgets/product_widget.dart';

class ProductsPage extends GetView<ProductController> {
  static const routeName = '/products';
  const ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: white,
        appBar: buildAppBar(context),
        body: buildBody(context),
        floatingActionButton: Obx(
          () => Visibility(
            visible: controller.isLoadingRetrieveProducts ||
              controller.isHideFilter,
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
        onPressed: () => Get.bottomSheet(
          const FilterProductWidget(),
          backgroundColor: white,
        ),
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
      ListView.builder(
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
                  onAddToCartPressed(context, product),
                ),
          );
        },
        itemCount: products.length,
      );

  void onCartPressed(BuildContext context) => debugPrint('On Cart Pressed');

  void onAddToCartPressed(BuildContext context, Product product) =>
      debugPrint('${product.title} Added To Cart');
}
