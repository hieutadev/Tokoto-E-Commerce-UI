import 'package:ecommerce_ui/screens/home/components/categories.dart';
import 'package:ecommerce_ui/screens/home/components/discount_banner.dart';
import 'package:ecommerce_ui/screens/home/components/home_header.dart';
import 'package:ecommerce_ui/screens/home/components/popular_product.dart';
import 'package:ecommerce_ui/screens/home/components/special_offers.dart';
import 'package:ecommerce_ui/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: getProportionateScreenHeight(10)),
          const HomeHeader(),
          SizedBox(height: getProportionateScreenHeight(30)),
          const DiscountBanner(),
          SizedBox(height: getProportionateScreenHeight(20)),
          const Categories(),
          SizedBox(height: getProportionateScreenHeight(30)),
          const SpecialOffers(),
          SizedBox(height: getProportionateScreenHeight(30)),
          const PopularProduct(),
        ],
      ),
    ));
  }
}
