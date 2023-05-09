import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_ui/screens/complete_profile/components/body.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CompleteProfileScreen extends StatelessWidget {
  const CompleteProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Complete Profile')),
      body: const Body(),
    );
  }
}
