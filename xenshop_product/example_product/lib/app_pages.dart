import 'package:get/get.dart';
import 'package:xenshop_product/presentation/get/product_binding.dart';
import 'package:xenshop_product/presentation/pages/products_page.dart';

import 'main_page.dart';

const initialRoute = MainPage.routeName;

final List<GetPage> pageRoutes = [
  GetPage(
    name: MainPage.routeName, 
    page: () => const MainPage(),
  ),
  GetPage(
    name: ProductsPage.routeName, 
    page: () => const ProductsPage(),
    binding: ProductBinding(),
  ),
];
