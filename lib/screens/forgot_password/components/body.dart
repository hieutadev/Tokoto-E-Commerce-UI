import 'package:ecommerce_ui/screens/forgot_password/components/forgot_password_form.dart';
import 'package:ecommerce_ui/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              Text(
                "Forgot Password",
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(28),
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                  "Please enter your email and we ưill send\nyou a link to return to your account",
                  textAlign: TextAlign.center),
              SizedBox(height: SizeConfig.screenHeight * 0.1),
              const ForgotPasswordForm()
            ],
          ),
        ),
      ),
    );
  }
}
