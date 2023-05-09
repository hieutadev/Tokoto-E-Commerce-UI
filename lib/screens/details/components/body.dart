import 'package:ecommerce_ui/components/default_button.dart';
import 'package:ecommerce_ui/models/Product.dart';
import 'package:ecommerce_ui/screens/details/components/color_dots.dart';
import 'package:ecommerce_ui/screens/details/components/product_desc.dart';
import 'package:ecommerce_ui/screens/details/components/product_images.dart';
import 'package:ecommerce_ui/screens/home/components/top_rounded_container.dart';
import 'package:ecommerce_ui/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProductImages(images: product.images),
          TopRoundedContainer(
              color: Colors.white,
              child: Column(
                children: [
                  ProductDesc(product: product),
                  TopRoundedContainer(
                    color: const Color(0xFFF6F7F9),
                    child: Column(
                      children: [
                        ColorDots(product: product),
                        TopRoundedContainer(
                          color: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: SizeConfig.screenWidth * 0.15,
                              right: SizeConfig.screenWidth * 0.15,
                              bottom: getProportionateScreenWidth(40),
                              top: getProportionateScreenWidth(15),
                            ),
                            child: DefaultButton(
                              text: "Add To Cart",
                              press: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
