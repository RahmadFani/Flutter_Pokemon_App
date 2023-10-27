import 'package:esensi_solusi_buana_test/modules/home/home.dart';
import 'package:esensi_solusi_buana_test/modules/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'builder.g.dart';

@TypedGoRoute<SplashScreenRoute>(
  path: '/splash-screen',
)
class SplashScreenRoute extends GoRouteData {
  const SplashScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SplashScreenPage();
}

@TypedGoRoute<HomeRoute>(
  path: '/home',
)
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage(
      child: const HomePage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}
