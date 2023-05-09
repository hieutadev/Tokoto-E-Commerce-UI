import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_ui/screens/otp/components/body.dart';
import 'package:flutter/material.dart';

@RoutePage()
class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP Verification'),
      ),
      body: const Body(),
    );
  }
}
