import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:xenshop_core/xenshop_core.dart';

import '../../const/i18n/cart_strings.dart';
import '../../domain/entities/cart.dart';
import '../get/cart_controller.dart';
import '../widgets/cart_widget.dart';

class BaseCartPage extends GetView<CartController> {
  static const routeName = '/cart';
  const BaseCartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: white,
        appBar: buildAppBar(context),
        body: buildBody(context),
        bottomNavigationBar: Obx(() => Visibility(
            visible: controller.isLoadingRetrieveCart,
            child: const SizedBox.shrink(),
            replacement: buildBottomNavigation(context),
          ),
        ),
      );

  AppBar buildAppBar(BuildContext context) => AppBar(
        backgroundColor: blue,
        title: Text(
          CartStrings.cart.tr,
          style: XenshopTextStyle.headline5(
            context: context,
            color: white,
          ),
        ),
      );

  Widget buildBody(BuildContext context) => Obx(
        () => (controller.isLoadingRetrieveCart)
            ? buildBodySkeleton(context)
            : buildBodyCart(context, controller.carts),
      );

  Widget buildBodySkeleton(BuildContext context) => Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: ListView.builder(
          itemBuilder: (context, index) => CartWidget.skeleton,
          itemCount: 20,
        ),
      );

  Widget buildBodyCart(BuildContext context, List<Cart> carts) =>
      ListView.builder(
        itemBuilder: (context, index) {
          final cart = carts[index];
          return CartWidget(
            cart: cart,
            onDecreaseQuantity: () => onDecreaseQuantity(context, index),
            onDeleteProductFromCart: () =>
                onDeleteProductFromCart(context, index),
            onIncreaseQuantity: () => onIncreaseQuantity(context, index),
          );
        },
        itemCount: carts.length,
      );

  void onDecreaseQuantity(BuildContext context, int index) =>
      controller.onDecreaseQuantity(index);

  void onIncreaseQuantity(BuildContext context, int index) =>
      controller.onIncreaseQuantity(index);

  void onDeleteProductFromCart(BuildContext context, int index) {
    Get.defaultDialog(
      title: CartStrings.deleteFromCart.tr,
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          CartStrings.sureDeleteFromCart.tr,
          textAlign: TextAlign.center,
        ),
      ),
      confirm: ElevatedButton(
        onPressed: () {
          controller.onRemoveFromCart(index);
          Get.back();
        },
        child: Text(
          CartStrings.ok.tr,
          style: XenshopTextStyle.button(
            context: context,
            color: blue,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: white,
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: blue,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      cancel: ElevatedButton(
        onPressed: () => Get.back(),
        child: Text(CartStrings.cancel.tr),
        style: ElevatedButton.styleFrom(
          primary: blue,
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: white,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }

  Widget buildBottomNavigation(BuildContext context) => Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 6,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    CartStrings.totalPrice.tr,
                    style: XenshopTextStyle.button(context: context),
                  ),
                  const SizedBox(height: 2),
                  Obx(
                    () => Text(
                      CurrencyUtil.price(amount: controller.totalPrice),
                      style: XenshopTextStyle.headline6(
                        context: context,
                        color: blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () => onCheckoutPressed(context),
              child: Text(CartStrings.checkout.tr),
              style: ElevatedButton.styleFrom(
                primary: blue,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
              ),
            ),
          ],
        ),
      );

  void onCheckoutPressed(BuildContext context) =>
      debugPrint('Checkout Pressed');
}
