import 'package:ecommerce_ui/components/social_card.dart';
import 'package:ecommerce_ui/constants.dart';
import 'package:ecommerce_ui/screens/sign_up/components/sign_up_form.dart';
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
              SizedBox(height: SizeConfig.screenHeight * 0.02),
              Text("Register Account", style: headingStyle),
              const Text("Complete your details or continue\nwith social media",
                  textAlign: TextAlign.center),
              SizedBox(height: SizeConfig.screenHeight * 0.08),
              const SignUpForm(),
              SizedBox(height: SizeConfig.screenHeight * 0.08),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialCard(
                      icon: 'assets/icons/google-icon.svg', press: () {}),
                  SocialCard(icon: 'assets/icons/facebook-2.svg', press: () {}),
                  SocialCard(icon: 'assets/icons/twitter.svg', press: () {}),
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(20)),
              const Text(
                "By continuing your confirm that you agree\nwith our Term and Condition",
                textAlign: TextAlign.center,
                // style: Theme.of(context).textTheme.caption,
              )
            ],
          ),
        ),
      ),
    );
  }
}
