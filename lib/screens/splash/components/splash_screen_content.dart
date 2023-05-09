import 'package:ecommerce_ui/constants.dart';
import 'package:ecommerce_ui/size_config.dart';
import 'package:flutter/material.dart';

class SplashContent extends StatelessWidget {
  final String text, image;

  const SplashContent({
    super.key,
    required this.text,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Spacer(),
        Text(
          "TOKOTO",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(36),
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(text),
        const Spacer(flex: 2),
        Image.asset(
          image,
          height: getProportionateScreenHeight(256),
          width: getProportionateScreenWidth(235),
        )
      ],
    );
  }
}
