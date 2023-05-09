import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_ui/constants.dart';
import 'package:ecommerce_ui/router.dart';
import 'package:ecommerce_ui/screens/sign_up/sign_up_screen.dart';
import 'package:ecommerce_ui/size_config.dart';
import 'package:flutter/material.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final router = AutoRouter.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an account? ",
            style: TextStyle(fontSize: getProportionateScreenWidth(16))),
        GestureDetector(
          onTap: () => router.push(const SignUpRoute()),
          child: Text("Sign Up",
              style: TextStyle(
                  fontSize: getProportionateScreenWidth(16),
                  color: kPrimaryColor)),
        ),
      ],
    );
  }
}
