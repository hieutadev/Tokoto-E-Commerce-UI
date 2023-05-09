import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_ui/components/section_title.dart';
import 'package:ecommerce_ui/models/Product.dart';
import 'package:ecommerce_ui/router.dart';
import 'package:ecommerce_ui/screens/details/details_screen.dart';
import 'package:ecommerce_ui/screens/home/components/product_card.dart';
import 'package:ecommerce_ui/size_config.dart';
import 'package:flutter/material.dart';

class PopularProduct extends StatelessWidget {
  const PopularProduct({super.key});

  @override
  Widget build(BuildContext context) {
    final router = AutoRouter.of(context);
    return Column(
      children: [
        SectionTitle(title: "Popular Product", press: () {}),
        SizedBox(height: getProportionateScreenHeight(15)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
            child: Row(
              children: List.generate(
                  demoProducts.length,
                  (index) => ProductCard(
                        product: demoProducts[index],
                        press: () {
                          // router.push(DetailsRoute(id: index));
                          router.pushNamed('/details/$index');
                        },
                      )),
            ),
          ),
        )
      ],
    );
  }
}
