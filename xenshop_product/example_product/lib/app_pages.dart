import 'package:get/get.dart';
import 'package:xenshop_product/xenshop_product.dart';

import 'main_page.dart';

const initialRoute = MainPage.routeName;

final List<GetPage> pageRoutes = [
  GetPage(
    name: MainPage.routeName, 
    page: () => const MainPage(),
  ),
  GetPage(
    name: BaseProductPage.routeName, 
    page: () => const BaseProductPage(),
    binding: ProductBinding(),
  ),
];
