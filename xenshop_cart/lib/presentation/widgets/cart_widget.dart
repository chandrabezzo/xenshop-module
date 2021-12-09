import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:xenshop_core/xenshop_core.dart';
import '../../domain/entities/cart.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({
    required this.cart,
    Key? key,
    this.onDecreaseQuantity,
    this.onDeleteProductFromCart,
    this.onIncreaseQuantity,
  }) : super(key: key);

  final Cart cart;
  final VoidCallback? onDecreaseQuantity;
  final VoidCallback? onDeleteProductFromCart;
  final VoidCallback? onIncreaseQuantity;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 8,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ExtendedImage.network(
          cart.product.image,
          fit: BoxFit.cover,
          width: 100,
          height: 100,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(child: Text(
                    cart.product.title,
                    style: XenshopTextStyle.bodyText1(
                      context: context,
                    ),
                  ),),
                  GestureDetector(
                    onTap: onDeleteProductFromCart,
                    child: const Icon(
                      Icons.remove_shopping_cart, 
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              Text(CurrencyUtil.price(amount: cart.product.price),
                style: XenshopTextStyle.headline6(
                  context: context,
                  color: blue,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: onDecreaseQuantity,
                    icon: const Icon(Icons.remove, color: black),
                  ),
                  const SizedBox(width: 36),
                  Text(cart.quantity.toString(), 
                    style: XenshopTextStyle.headline6(context: context),
                  ),
                  const SizedBox(width: 36),
                  IconButton(
                    onPressed: onIncreaseQuantity,
                    icon: const Icon(Icons.add, color: black),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    ),
  );

  static Widget get skeleton {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 50,
            height: 50,
            color: black,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: black,
                    width: double.infinity,
                    height: 10,
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    height: 10,
                    color: black,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
