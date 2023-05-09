import 'package:ecommerce_ui/components/no_account_text.dart';
import 'package:ecommerce_ui/components/social_card.dart';
import 'package:ecommerce_ui/constants.dart';
import 'package:ecommerce_ui/screens/forgot_password/forgot_password_screen.dart';
import 'package:ecommerce_ui/screens/sign_in/components/sign_in_form.dart';
import 'package:ecommerce_ui/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: SizeConfig.screenHeight * 0.04),
            Text(
              "Welcome Back",
              style: TextStyle(
                  fontSize: getProportionateScreenWidth(28),
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              "Sign in with your email and password\nor continue with social media",
              textAlign: TextAlign.center,
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.08),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: const SignInForm(),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.08),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialCard(icon: 'assets/icons/google-icon.svg', press: () {}),
                SocialCard(icon: 'assets/icons/facebook-2.svg', press: () {}),
                SocialCard(icon: 'assets/icons/twitter.svg', press: () {}),
              ],
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            const NoAccountText()
            // SocialCard()
          ],
        ),
      ),
    ));
  }
}
