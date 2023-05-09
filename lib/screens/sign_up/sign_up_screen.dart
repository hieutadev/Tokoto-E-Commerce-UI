import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_ui/screens/sign_up/components/body.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign Up")),
      body: const Body(),
    );
  }
}
