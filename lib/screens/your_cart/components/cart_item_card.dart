import 'package:ecommerce_ui/constants.dart';
import 'package:ecommerce_ui/models/Cart.dart';
import 'package:ecommerce_ui/size_config.dart';
import 'package:flutter/material.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    super.key,
    required this.card,
  });

  final Cart card;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(88),
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: const Color(0xfff5f6f9),
                  borderRadius: BorderRadius.circular(15)),
              child: Image.asset(card.product.images[0]),
            ),
          ),
        ),
        SizedBox(width: getProportionateScreenWidth(20)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(demoCarts[0].product.title),
            const SizedBox(height: 10),
            Text.rich(TextSpan(
                text: "\$${card.product.price}",
                style: const TextStyle(
                    fontWeight: FontWeight.w600, color: kPrimaryColor),
                children: [
                  TextSpan(
                      text: " x${card.numOfItem}",
                      style: Theme.of(context).textTheme.bodyLarge)
                ]))
          ],
        ),
      ],
    );
  }
}
