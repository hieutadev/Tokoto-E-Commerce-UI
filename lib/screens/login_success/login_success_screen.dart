import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_ui/screens/login_success/components/body.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LoginSuccessScreen extends StatelessWidget {
  const LoginSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login success"),
      ),
      body: const Body(),
    );
  }
}
