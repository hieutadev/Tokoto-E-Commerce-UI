import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_ui/components/icon_button_with_badge.dart';
import 'package:ecommerce_ui/models/Cart.dart';
import 'package:ecommerce_ui/router.dart';
import 'package:ecommerce_ui/screens/home/components/search_field.dart';
import 'package:ecommerce_ui/size_config.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final router = AutoRouter.of(context);
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SearchField(),
          IconButtonWithBadge(
            press: () => router.push(const YourCartRoute()),
            svgSrc: "assets/icons/Cart Icon.svg",
            numOfItems: demoCarts.length,
          ),
          IconButtonWithBadge(
            press: () {},
            svgSrc: "assets/icons/Bell.svg",
            numOfItems: 3,
          )
        ],
      ),
    );
  }
}
