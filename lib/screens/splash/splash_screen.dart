import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_ui/screens/splash/components/body.dart';
import 'package:ecommerce_ui/size_config.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(body: Body());
  }
}
