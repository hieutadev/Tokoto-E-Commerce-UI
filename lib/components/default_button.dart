import 'package:ecommerce_ui/constants.dart';
import 'package:ecommerce_ui/size_config.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final VoidCallback press;
  final String text;
  final bool? disabled;

  const DefaultButton({
    super.key,
    required this.press,
    required this.text,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(56),
      child: TextButton(
          style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              disabledForegroundColor: Colors.white,
              backgroundColor: kPrimaryColor,
              disabledBackgroundColor: kPrimaryColor.withOpacity(0.5),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          onPressed: disabled! ? null : press,
          child: Text(text,
              style: TextStyle(fontSize: getProportionateScreenWidth(18)))),
    );
  }
}
