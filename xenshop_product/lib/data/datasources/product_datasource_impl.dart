import 'package:dio/dio.dart';

import '../../xenshop_product.dart';
import '../models/product_model.dart';
import 'product_datasource.dart';

class ProductDatasourceImpl implements ProductDatasource {
  final Dio _client;

  ProductDatasourceImpl({
    required Dio client,
  }) : _client = client;

  @override
  Future<List<ProductModel>> products({
    int limit = 10,
  }) async {
    final params = {
      'limit': limit,
    };

    final responseJson = await _client.get(
      ProductEndpoint.products,
      queryParameters: params,
    );

    final data = responseJson.data;
    final list = <ProductModel>[];
    for (Map<String, dynamic> json in data) {
      list.add(ProductModel.fromJson(json));
    }

    return list;
  }

  @override
  Future<List<String>> get categories async {
    final responseJson = await _client.get(ProductEndpoint.categories);
    final list = <String>[];
    for (String category in responseJson.data) {
      list.add(category);
    }
    return list;
  }
}
