import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_ui/components/default_button.dart';
import 'package:ecommerce_ui/router.dart';
import 'package:ecommerce_ui/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    final router = AutoRouter.of(context);
    return Column(
      children: [
        SizedBox(
          height: SizeConfig.screenHeight * 0.04,
        ),
        Image.asset("assets/images/success.png",
            height: SizeConfig.screenHeight * 0.4),
        Text("Login Success",
            style: TextStyle(
                fontSize: getProportionateScreenWidth(30),
                fontWeight: FontWeight.bold,
                color: Colors.black)),
        const Spacer(),
        SizedBox(
            width: SizeConfig.screenWidth * 0.6,
            child: DefaultButton(
                press: () => router.pushAndPopUntil(const HomeRoute(),
                    predicate: (_) => false),
                text: "Back to Home")),
        const Spacer()
      ],
    );
  }
}
