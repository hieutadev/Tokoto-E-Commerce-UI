import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_ui/screens/complete_profile/complete_profile_screen.dart';
import 'package:ecommerce_ui/screens/dashboard/dashboard_screen.dart';
import 'package:ecommerce_ui/screens/details/details_screen.dart';
import 'package:ecommerce_ui/screens/empty/empty_screen.dart';
import 'package:ecommerce_ui/screens/forgot_password/forgot_password_screen.dart';
import 'package:ecommerce_ui/screens/home/home_screen.dart';
import 'package:ecommerce_ui/screens/login_success/login_success_screen.dart';
import 'package:ecommerce_ui/screens/otp/otp_screen.dart';
import 'package:ecommerce_ui/screens/profile/profile_screen.dart';
import 'package:ecommerce_ui/screens/sign_in/sign_in_screen.dart';
import 'package:ecommerce_ui/screens/sign_up/sign_up_screen.dart';
import 'package:ecommerce_ui/screens/splash/splash_screen.dart';
import 'package:ecommerce_ui/screens/your_cart/your_card.dart';
import 'package:flutter/material.dart';
part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: SignUpRoute.page),
        AutoRoute(page: SignInRoute.page),
        AutoRoute(page: ForgotPasswordRoute.page),
        AutoRoute(page: OTPRoute.page),
        AutoRoute(page: CompleteProfileRoute.page),
        AutoRoute(page: LoginSuccessRoute.page),
        AutoRoute(
          path: '/home',
          page: DashboardRoute.page,
          children: [
            AutoRoute(page: HomeRoute.page, initial: true),
            // AutoRoute(page: EmptyRoute.page, initial: true, children: [
            //   AutoRoute(page: HomeRoute.page, initial: true),
            // ]),
            AutoRoute(page: ProfileRoute.page),
          ],
        ),
        AutoRoute(page: YourCartRoute.page),
        AutoRoute(path: '/details/:id', page: DetailsRoute.page),
      ];
}
