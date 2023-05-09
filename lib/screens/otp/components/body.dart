import 'package:ecommerce_ui/constants.dart';
import 'package:ecommerce_ui/screens/otp/components/otp_form.dart';
import 'package:ecommerce_ui/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(20)),
      child: SizedBox(
        width: double.infinity,
        child: Column(children: [
          SizedBox(height: SizeConfig.screenHeight * 0.05),
          Text("OTP Vertification", style: headingStyle),
          const SizedBox(height: 10),
          const Text("We sent code to +1 898 860 ***",
              textAlign: TextAlign.center),
          const ExpirationTimer(),
          SizedBox(height: SizeConfig.screenHeight * 0.15),
          const OtpForm(),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          GestureDetector(
            onTap: () {},
            child: const Text(
              "Resend OTP Code",
              style: TextStyle(decoration: TextDecoration.underline),
            ),
          )
        ]),
      ),
    ));
  }
}

class ExpirationTimer extends StatelessWidget {
  const ExpirationTimer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text("This code will expired in "),
        TweenAnimationBuilder(
          tween: Tween(begin: 30.0, end: 0),
          duration: const Duration(seconds: 30),
          builder: (context, value, child) => Text(
            "00:${value.toInt().toString().padLeft(2, '0')}",
            style: const TextStyle(color: kPrimaryColor),
          ),
          onEnd: () {},
        )
      ],
    );
  }
}
