import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/cart.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({
    required this.cart,
    Key? key,
  }) : super(key: key);

  final Cart cart;

  @override
  Widget build(BuildContext context) => Row(
    children: [
      ExtendedImage.network(
        cart.product.image,
        fit: BoxFit.cover,
        width: 100,
        height: 100,
      ),
      Column(
        children: [
          Text(cart.product.title),
          
        ],
      )
    ],
  );
}
