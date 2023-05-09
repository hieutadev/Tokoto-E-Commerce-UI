import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_ui/models/Product.dart';
import 'package:ecommerce_ui/screens/details/components/body.dart';
import 'package:ecommerce_ui/screens/details/components/custom_app_bar.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, @PathParam('id') required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F9),
      appBar: CustomAppBar(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        rating: demoProducts[id].rating,
        child: const SizedBox(),
      ),
      body: Body(product: demoProducts[id]),
    );
  }
}

class ProductDetailsArguments {
  final Product product;
  ProductDetailsArguments({required this.product});
}
