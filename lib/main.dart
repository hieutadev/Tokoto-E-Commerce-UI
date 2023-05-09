import 'package:ecommerce_ui/router.dart';
import 'package:ecommerce_ui/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();

  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'E-commerce',
      theme: theme(),
      routerConfig: _appRouter.config(),
    );
  }
}
