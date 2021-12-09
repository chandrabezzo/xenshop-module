import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xenshop_product/presentation/pages/products_page.dart';

class MainPage extends StatelessWidget {
  static const routeName = '/main';
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Xenshop Product'),
        ),
        body: ListView(
          children: [
            ListTile(
              title: const Text('Product Page'),
              subtitle:
                  const Text('The page contains list of available products'),
              onTap: () => Get.toNamed(ProductsPage.routeName),
            )
          ],
        ),
      );
}
