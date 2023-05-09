import 'package:ecommerce_ui/components/default_button.dart';
import 'package:ecommerce_ui/constants.dart';
import 'package:ecommerce_ui/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CheckOutCard extends StatelessWidget {
  const CheckOutCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: getProportionateScreenWidth(15),
          horizontal: getProportionateScreenWidth(30)),
      height: 180,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, -15),
                blurRadius: 20,
                color: const Color(0xffdadada).withOpacity(0.15))
          ]),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                height: getProportionateScreenWidth(40),
                width: getProportionateScreenWidth(40),
                decoration: BoxDecoration(
                    color: const Color(0xfff5f6f9),
                    borderRadius: BorderRadius.circular(10)),
                child: SvgPicture.asset("assets/icons/receipt.svg"),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(foregroundColor: kTextColor),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text("Add voucher code"),
                    SizedBox(width: 10),
                    Icon(Icons.arrow_forward_ios, size: 12)
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(15)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                  text: const TextSpan(
                      style: TextStyle(color: kTextColor),
                      text: "Total:\n",
                      children: [
                    TextSpan(
                        text: "\$337.5",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black))
                  ])),
              SizedBox(
                  width: getProportionateScreenWidth(180),
                  height: getProportionateScreenWidth(50),
                  child: DefaultButton(press: () {}, text: "Check Out"))
            ],
          )
        ],
      ),
    );
  }
}
