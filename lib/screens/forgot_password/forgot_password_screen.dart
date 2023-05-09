import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_ui/screens/forgot_password/components/body.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Forgot Password")),
      body: const Body(),
    );
  }
}
