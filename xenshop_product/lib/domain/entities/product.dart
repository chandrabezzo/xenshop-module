import 'rating.dart';

class Product {
  final String category;
  final String description;
  final int id;
  final String image;
  final double price;
  final Rating rating;
  final String title;

  Product({
    required this.category,
    required this.description,
    required this.id,
    required this.image,
    required this.price,
    required this.rating,
    required this.title,
  });
}
