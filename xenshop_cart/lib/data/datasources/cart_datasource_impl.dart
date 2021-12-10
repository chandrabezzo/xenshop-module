import 'package:dio/dio.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

import '../../xenshop_cart.dart';
import '../models/cart_product_model.dart';
import '../models/carts_model.dart';
import '../models/product_model.dart';
import 'cart_datasource.dart';

class CartDatasourceImpl implements CartDatasource {
  final Dio _client;

  CartDatasourceImpl({
    required Dio client,
  }) : _client = client;

  @override
  Future<List<CartProductModel>> get carts async {
    ///Since this API just fake, we need hardcode the user id
    const userId = 2;

    final responseJson = await _client.get(
      '${CartEndpoint.carts}/$userId',
    );

    final data = responseJson.data;
    final list = <CartsModel>[];
    for (Map<String, dynamic> json in data) {
      list.add(CartsModel.fromJson(json));
    }

    return list.first.products;
  }

  @override
  Future<ProductModel> product(int id) async {
    final responseJson = await _client.get(
      '${CartEndpoint.product}/$id',
    );
    return ProductModel.fromJson(responseJson.data);
  }

  @override
  Future<bool> get deleteCart async {
    const cartId = 3;
    final responseJson = await _client.delete(
      '${CartEndpoint.deleteCartProduct}/$cartId',
    );
    return (responseJson.statusCode == HttpStatus.ok);
  }
}
