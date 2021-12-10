import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xenshop_core/base/xenshop_text_style.dart';
import 'package:xenshop_core/xenshop_core.dart';

import '../../const/i18n/product_strings.dart';

class AddToCartWidget extends StatelessWidget {
  const AddToCartWidget({
    Key? key,
    this.isOnLoading = false,
    this.onAddToCartPressed,
    this.onDecreaseQuantity,
    this.onIncreaseQuantity,
    required this.quantity,
  }) : super(key: key);

  final bool isOnLoading;
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
              Text(quantity.toString(), style: XenshopTextStyle
                .headline5(context: context),
              ),
              const SizedBox(width: 36),
              IconButton(
                onPressed: onIncreaseQuantity,
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Visibility(
            visible: isOnLoading,
            child: const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(blue),
              ),
            ),
            replacement: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: ElevatedButton(
                onPressed: onAddToCartPressed,
                child: Text(ProductStrings.addToCart.tr),
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      );
}
