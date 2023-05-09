import 'package:ecommerce_ui/size_config.dart';
import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({super.key, required this.title, this.press});

  final String title;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: getProportionateScreenWidth(18), color: Colors.black),
          ),
          press != null
              ? GestureDetector(
                  onTap: press,
                  child: const Text(
                    "See More",
                    style: TextStyle(color: Color(0xFFBBBBBB)),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
