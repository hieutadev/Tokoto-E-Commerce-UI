import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_ui/components/default_button.dart';
import 'package:ecommerce_ui/constants.dart';
import 'package:ecommerce_ui/router.dart';
import 'package:ecommerce_ui/screens/splash/components/splash_screen_content.dart';
import 'package:ecommerce_ui/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Welcome to Tokoto, Let's shop",
      "image": "assets/images/splash_1.png"
    },
    {
      "text":
          "We help people connect with store\naround United State of America",
      "image": "assets/images/splash_2.png"
    },
    {
      "text": "Whe show the easy way to shop.\nJust stay at home with us",
      "image": "assets/images/splash_3.png"
    }
  ];

  AnimatedContainer buildDot({required int index}) {
    bool active = currentPage == index;
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: active ? 20 : 6,
      decoration: BoxDecoration(
        color: active ? kPrimaryColor : const Color(0xffd8d8d8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final router = AutoRouter.of(context);
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
                flex: 3,
                child: PageView.builder(
                    onPageChanged: (value) => setState(() {
                          currentPage = value;
                        }),
                    itemCount: splashData.length,
                    itemBuilder: (context, index) => SplashContent(
                          text: splashData[index]["text"]!,
                          image: splashData[index]["image"]!,
                        ))),
            Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20)),
                  child: Column(
                    children: <Widget>[
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(splashData.length,
                            (index) => buildDot(index: index)),
                      ),
                      const Spacer(flex: 3),
                      DefaultButton(
                          text: "Continue",
                          press: () => router.push(const SignInRoute())),
                      const Spacer()
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
