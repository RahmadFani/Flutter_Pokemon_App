import 'package:esensi_solusi_buana_test/router/builder.dart';
import 'package:go_router/go_router.dart';

class MyRouter {
  static GoRouter init() => GoRouter(
        routes: $appRoutes,
        initialLocation: const SplashScreenRoute().location,
      );
}
