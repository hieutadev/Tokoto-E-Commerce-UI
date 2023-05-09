import 'package:ecommerce_ui/constants.dart';
import 'package:ecommerce_ui/size_config.dart';
import 'package:flutter/material.dart';

class RoundedIconBtn extends StatelessWidget {
  final IconData icon;
  final GestureTapCancelCallback press;
  final bool showShadow;

  const RoundedIconBtn(
      {super.key,
      required this.icon,
      required this.press,
      this.showShadow = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenWidth(40),
      width: getProportionateScreenWidth(40),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          if (showShadow)
            BoxShadow(
              offset: const Offset(0, 6),
              blurRadius: 10,
              color: const Color(0xFFB0B0B0).withOpacity(0.2),
            ),
        ],
      ),
      child: TextButton(
        style: TextButton.styleFrom(
            foregroundColor: kSecondaryColor,
            backgroundColor: Colors.white,
            padding: EdgeInsets.zero,
            shape: const CircleBorder()),
        onPressed: press,
        child: Icon(icon, color: kTextColor, size: 24),
      ),
    );
  }
}
