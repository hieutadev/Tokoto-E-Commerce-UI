import 'package:ecommerce_ui/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:badges/badges.dart' as badges;

class ProfilePic extends StatelessWidget {
  const ProfilePic({super.key});

  @override
  Widget build(BuildContext context) {
    return badges.Badge(
      position: badges.BadgePosition.bottomEnd(bottom: 0, end: 0),
      badgeContent: SizedBox(
        width: 40,
        height: 40,
        child: TextButton(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
              side: const BorderSide(color: Colors.white),
            ),
            padding: const EdgeInsets.all(4),
            foregroundColor: kPrimaryColor,
            backgroundColor: const Color(0xFFF5F6F9),
          ),
          onPressed: () {},
          child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
        ),
      ),
      badgeStyle: const badges.BadgeStyle(
          badgeColor: Colors.white, padding: EdgeInsets.zero),
      child: const CircleAvatar(
          radius: 60,
          backgroundImage: AssetImage("assets/images/Profile Image.png")),
    );
  }
}
