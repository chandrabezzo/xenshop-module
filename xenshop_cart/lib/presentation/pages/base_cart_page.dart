import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        appBar: buildAppBar(context),
        body: buildBody(context),
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

  Widget buildBodySkeleton(BuildContext context) => Center(
    child: Text('Loading'),
  );

  Widget buildBodyCart(BuildContext context, List<Cart> carts) =>
      ListView.builder(
        itemBuilder: (context, index) {
          final cart = carts[index];
          return CartWidget(
            cart: cart,
          );
        },
        itemCount: 5,
      );
}
