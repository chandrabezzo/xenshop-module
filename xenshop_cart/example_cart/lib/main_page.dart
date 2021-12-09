import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xenshop_cart/presentation/pages/base_cart_page.dart';

class MainPage extends StatelessWidget {
  static const routeName = '/main';
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Xenshop Cart'),
    ),
    body: ListView(
      children: [
        ListTile(
          title: const Text('Cart Page'),
          subtitle:
              const Text('The page contains list of products in cart'),
          onTap: () => Get.toNamed(BaseCartPage.routeName),
        )
      ],
    ),
  );
}
