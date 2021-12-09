import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:xenshop_core/base/colors.dart';
import 'package:xenshop_core/base/xenshop_text_style.dart';
import 'package:xenshop_core/xenshop_core.dart';

import '../../domain/entities/product.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    Key? key,
    required this.product,
    this.onAddToCartPressed,
  }) : super(key: key);

  final Product product;
  final Function(Product)? onAddToCartPressed;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ExtendedImage.network(
            product.image,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: Text(
                        product.title,
                        style: XenshopTextStyle.headline6(
                          context: context,
                        ),
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Text(
                            CurrencyUtil.price(amount: product.price), 
                            style: XenshopTextStyle.bodyText1(
                              context: context,
                              color: blue,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Icon(Icons.star, color: Colors.yellow),
                          Text(product.rating.rate.toString()),
                          Text('(${product.rating.count})'),
                        ],
                      ),
                      margin: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: (onAddToCartPressed != null)
                  ? () => onAddToCartPressed!(product)
                  : null, 
                icon: const Icon(Icons.add_shopping_cart, color: blue),
              ),
              const SizedBox(width: 16),
            ],
          ),
        ],
      );

  static Widget get skeleton => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            height: 300,
            color: black,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 10,
                      color: black,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      color: black,
                      width: 100,
                      height: 10,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 100,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: black,
                ),
              ),
              const SizedBox(width: 16),
            ],
          ),
        ],
      );
}
