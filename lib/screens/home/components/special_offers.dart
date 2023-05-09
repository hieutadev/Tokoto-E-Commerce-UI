import 'package:ecommerce_ui/components/section_title.dart';
import 'package:ecommerce_ui/size_config.dart';
import 'package:flutter/material.dart';

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(title: "Special for you", press: () {}),
        SizedBox(height: getProportionateScreenHeight(15)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
            child: Row(
              children: const [
                SpecialOfferCard(
                  category: "Smartphone",
                  numOfBrands: 18,
                  image: 'assets/images/Image Banner 2.png',
                ),
                SpecialOfferCard(
                  category: "Fashion",
                  numOfBrands: 24,
                  image: 'assets/images/Image Banner 3.png',
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    super.key,
    required this.category,
    required this.image,
    required this.numOfBrands,
    this.press,
  });

  final String category, image;
  final int numOfBrands;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: getProportionateScreenWidth(20)),
      child: SizedBox(
        width: getProportionateScreenWidth(242),
        height: getProportionateScreenWidth(100),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              Image.asset(image, fit: BoxFit.cover),
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  const Color(0xFF343434).withOpacity(0.4),
                  const Color(0xFF343434).withOpacity(0.15)
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(15),
                    vertical: getProportionateScreenWidth(10)),
                child: Text.rich(TextSpan(
                    style: const TextStyle(color: Colors.white),
                    children: [
                      TextSpan(
                          text: "$category\n",
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(18),
                              fontWeight: FontWeight.bold)),
                      TextSpan(text: "$numOfBrands Branch")
                    ])),
              )
            ],
          ),
        ),
      ),
    );
  }
}
