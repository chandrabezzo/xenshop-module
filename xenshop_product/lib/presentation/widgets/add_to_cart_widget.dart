import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../const/i18n/product_strings.dart';

class AddToCartWidget extends StatelessWidget {
  const AddToCartWidget({
    Key? key,
    this.onAddToCartPressed,
    this.onDecreaseQuantity,
    this.onIncreaseQuantity,
    required this.quantity,
  }) : super(key: key);

  final VoidCallback? onAddToCartPressed;
  final VoidCallback? onDecreaseQuantity;
  final VoidCallback? onIncreaseQuantity;
  final int quantity;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: onDecreaseQuantity,
                icon: const Icon(Icons.remove),
              ),
              const SizedBox(width: 36),
              Text(quantity.toString()),
              const SizedBox(width: 36),
              IconButton(
                onPressed: onIncreaseQuantity,
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: ElevatedButton(
              onPressed: onAddToCartPressed,
              child: Text(ProductStrings.addToCart.tr),
            ),
          ),
          const SizedBox(height: 16),
        ],
      );
}
