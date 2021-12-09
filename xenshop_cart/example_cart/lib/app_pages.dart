import 'package:get/get.dart';
import 'package:xenshop_cart/presentation/get/cart_binding.dart';
import 'package:xenshop_cart/presentation/pages/base_cart_page.dart';

import 'main_page.dart';

const initialRoute = MainPage.routeName;

final List<GetPage> pageRoutes = [
  GetPage(
    name: MainPage.routeName, 
    page: () => const MainPage(),
  ),
  GetPage(
    name: BaseCartPage.routeName, 
    page: () => const BaseCartPage(),
    binding: CartBinding(),
  ),
];