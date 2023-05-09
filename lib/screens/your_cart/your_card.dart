import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_ui/models/Cart.dart';
import 'package:ecommerce_ui/screens/your_cart/components/body.dart';
import 'package:ecommerce_ui/screens/your_cart/components/check_out_card.dart';
import 'package:flutter/material.dart';

@RoutePage()
class YourCartScreen extends StatelessWidget {
  const YourCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(children: [
          const Text("Your Cart", style: TextStyle(color: Colors.black)),
          Text("${demoCarts.length} items",
              style: Theme.of(context).textTheme.bodySmall)
        ]),
      ),
      body: const Body(),
      bottomNavigationBar: const CheckOutCard(),
    );
  }
}
