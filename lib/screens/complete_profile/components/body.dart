import 'package:ecommerce_ui/constants.dart';
import 'package:ecommerce_ui/screens/complete_profile/components/complete_profile_form.dart';
import 'package:ecommerce_ui/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(getProportionateScreenWidth(20)),
          child: Column(children: [
            Text("Complete Profile", style: headingStyle),
            const Text("Complete your details or continue\nwith social media",
                textAlign: TextAlign.center),
            SizedBox(height: SizeConfig.screenHeight * 0.08),
            const CompleteProfileForm(),
            SizedBox(height: getProportionateScreenHeight(30)),
            const Text(
                "By continuing your confirm that you agree\nwith our Tern and Condition",
                textAlign: TextAlign.center)
          ]),
        ),
      ),
    );
  }
}
