import 'cart_product_model.dart';

class CartsModel {
    CartsModel({
      required this.id,
      required this.userId,
      required this.date,
      required this.products,
      required this.v,
    });

    final int id;
    final int userId;
    final DateTime date;
    final List<CartProductModel> products;
    final int v;

    factory CartsModel.fromJson(Map<String, dynamic> json) => CartsModel(
        id: json['id'],
        userId: json['userId'],
        date: DateTime.parse(json['date']),
        products: List<CartProductModel>.from(json['products'].map((x) 
          => CartProductModel.fromJson(x),),),
        v: json['__v'],
    );

    Map<String, dynamic> toJson() => {
        'id': id,
        'userId': userId,
        'date': date.toIso8601String(),
        'products': List<dynamic>.from(products.map((product) 
          => product.toJson(),),),
        '__v': v,
    };
}