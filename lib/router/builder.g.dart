// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'builder.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $splashScreenRoute,
      $homeRoute,
    ];

RouteBase get $splashScreenRoute => GoRouteData.$route(
      path: '/splash-screen',
      factory: $SplashScreenRouteExtension._fromState,
    );

extension $SplashScreenRouteExtension on SplashScreenRoute {
  static SplashScreenRoute _fromState(GoRouterState state) =>
      const SplashScreenRoute();

  String get location => GoRouteData.$location(
        '/splash-screen',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $homeRoute => GoRouteData.$route(
      path: '/home',
      factory: $HomeRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'generation-detail',
          factory: $GenerationDetailRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'pokemon-detail',
              factory: $PokemonDetailRouteExtension._fromState,
            ),
          ],
        ),
      ],
    );

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  String get location => GoRouteData.$location(
        '/home',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $GenerationDetailRouteExtension on GenerationDetailRoute {
  static GenerationDetailRoute _fromState(GoRouterState state) =>
      GenerationDetailRoute(
        name: state.uri.queryParameters['name']!,
        url: state.uri.queryParameters['url']!,
      );

  String get location => GoRouteData.$location(
        '/home/generation-detail',
        queryParams: {
          'name': name,
          'url': url,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $PokemonDetailRouteExtension on PokemonDetailRoute {
  static PokemonDetailRoute _fromState(GoRouterState state) =>
      PokemonDetailRoute(
        name: state.uri.queryParameters['name']!,
        url: state.uri.queryParameters['url']!,
        $extra: state.extra as List<PokemonSpesies>,
      );

  String get location => GoRouteData.$location(
        '/home/generation-detail/pokemon-detail',
        queryParams: {
          'name': name,
          'url': url,
        },
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}
