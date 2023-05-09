import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_ui/constants.dart';
import 'package:ecommerce_ui/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color inActiveIconColor = Color(0xFFB6B6B6);
    return AutoTabsRouter(
      routes: const [HomeRoute(), ProfileRoute()],
      transitionBuilder: (context, child, animation) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: Container(
            padding: const EdgeInsets.symmetric(vertical: 14),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(0, -15),
                      blurRadius: 20,
                      color: const Color(0xFFDADADA).withOpacity(0.15))
                ],
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
            child: SafeArea(
              top: false,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: SvgPicture.asset(
                      "assets/icons/Shop Icon.svg",
                      // ignore: deprecated_member_use
                      color: tabsRouter.activeIndex == 0
                          ? kPrimaryColor
                          : inActiveIconColor,
                    ),
                    onPressed: () => tabsRouter.setActiveIndex(0),
                  ),
                  IconButton(
                    icon: SvgPicture.asset("assets/icons/Heart Icon.svg"),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: SvgPicture.asset("assets/icons/Chat bubble Icon.svg"),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: SvgPicture.asset(
                      "assets/icons/User Icon.svg",
                      // ignore: deprecated_member_use
                      color: tabsRouter.activeIndex == 1
                          ? kPrimaryColor
                          : inActiveIconColor,
                    ),
                    onPressed: () => tabsRouter.setActiveIndex(1),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
