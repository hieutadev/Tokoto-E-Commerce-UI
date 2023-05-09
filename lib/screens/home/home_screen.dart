import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_ui/screens/home/components/body.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: AppBar(title: const Text('Home')),
      body: Body(),
    );
  }
}
