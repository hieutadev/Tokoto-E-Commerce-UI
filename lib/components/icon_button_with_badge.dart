import 'package:badges/badges.dart' as badges;
import 'package:ecommerce_ui/constants.dart';
import 'package:ecommerce_ui/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IconButtonWithBadge extends StatelessWidget {
  const IconButtonWithBadge({
    super.key,
    required this.press,
    required this.svgSrc,
    this.numOfItems = 0,
  });

  final VoidCallback? press;
  final String svgSrc;
  final int numOfItems;

  @override
  Widget build(BuildContext context) {
    return badges.Badge(
      position: badges.BadgePosition.topEnd(top: -6, end: -2),
      badgeContent: Text(numOfItems.toString(),
          style: const TextStyle(color: Colors.white, fontSize: 12)),
      showBadge: numOfItems > 0,
      badgeStyle: const badges.BadgeStyle(badgeColor: kPrimaryColor),
      child: InkWell(
        onTap: press,
        borderRadius: BorderRadius.circular(50),
        child: Container(
          padding: EdgeInsets.all(getProportionateScreenWidth(12)),
          height: getProportionateScreenWidth(46),
          width: getProportionateScreenWidth(46),
          decoration: BoxDecoration(
              color: kSecondaryColor.withOpacity(0.1), shape: BoxShape.circle),
          child: SvgPicture.asset(svgSrc),
        ),
      ),
    );
  }
}
