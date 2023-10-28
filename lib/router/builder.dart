// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:esensi_solusi_buana_test/modules/generation_detail/generation_detail.dart';
import 'package:esensi_solusi_buana_test/modules/generation_detail/models/models.dart';
import 'package:esensi_solusi_buana_test/modules/pokemon_detail/pokemon_detail.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:esensi_solusi_buana_test/modules/home/home.dart';
import 'package:esensi_solusi_buana_test/modules/splash_screen/splash_screen.dart';

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
  routes: [
    TypedGoRoute<GenerationDetailRoute>(
      path: 'generation-detail',
      routes: [
        TypedGoRoute<PokemonDetailRoute>(path: 'pokemon-detail'),
      ],
    ),
  ],
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

class GenerationDetailRoute extends GoRouteData {
  final String name;
  final String url;

  const GenerationDetailRoute({
    required this.name,
    required this.url,
  });

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage(
      child: GenerationDetailPage(
        url: url,
        name: name,
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}

class PokemonDetailRoute extends GoRouteData {
  final String name;
  final String url;
  final List<PokemonSpesies> $extra;

  const PokemonDetailRoute({
    required this.name,
    required this.url,
    this.$extra = const [],
  });

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage(
      child: PokemonDetailPage(
        name: name,
        url: url,
        pokemons: $extra,
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}
