import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:esensi_solusi_buana_test/modules/favorites/bloc/favorites_bloc.dart';
import 'package:esensi_solusi_buana_test/modules/favorites/models/favorite.dart';
import 'package:esensi_solusi_buana_test/modules/home/bloc/home_bloc.dart';
import 'package:esensi_solusi_buana_test/modules/home/home.dart';
import 'package:esensi_solusi_buana_test/modules/home/models/generation.dart';
import 'package:esensi_solusi_buana_test/modules/pokemon_detail/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/hydrated_bloc.dart';
import '../../helpers/injection.dart';

class MockHomeBloc extends MockBloc<HomeEvent, HomeState> implements HomeBloc {}

class MockFavoritesBloc extends MockBloc<FavoritesEvent, FavoritesState>
    implements FavoritesBloc {}

void main() {
  initHydratedStorage();
  injectionUnit();

  late HomeBloc homeBloc;
  late FavoritesBloc favoritesBloc;

  setUp(() {
    homeBloc = MockHomeBloc();
    favoritesBloc = MockFavoritesBloc();
  });

  setUpAll(() {
    // ↓ required to avoid HTTP error 400 mocked returns
    HttpOverrides.global = null;
  });

  group('Home', () {
    testWidgets('renders Home View', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: HomePage(),
        ),
      );
      await tester.pump(const Duration(seconds: 1));
      expect(find.byType(HomeView), findsOneWidget);
    });

    testWidgets('On Tab Explore Clicked', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: HomePage(),
        ),
      );
      await tester.pump(const Duration(seconds: 1));
      await tester.tap(find.byKey(const Key('_buttonTabExplore')));
    });

    testWidgets('On Tab Favorite Clicked', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: HomePage(),
        ),
      );
      await tester.pump(const Duration(seconds: 1));
      await tester.tap(find.byKey(const Key('_buttonTabFavorite')));
    });

    testWidgets('On currentTab == 1 render _favoriteList', (tester) async {
      when(() => homeBloc.state).thenReturn(
        const HomeState(currentTab: 1, loading: false),
      );

      when(() => favoritesBloc.state).thenReturn(
        const FavoritesState(),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: MultiBlocProvider(
            providers: [
              BlocProvider<HomeBloc>.value(value: homeBloc),
              BlocProvider<FavoritesBloc>.value(value: favoritesBloc),
            ],
            child: const Scaffold(body: HomeView()),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('_favoriteListWidget')), findsOneWidget);
    });

    testWidgets('On currentTab == 1 render _favoriteList has data',
        (tester) async {
      when(() => homeBloc.state).thenReturn(
        const HomeState(currentTab: 1, loading: false),
      );

      when(() => favoritesBloc.state).thenReturn(FavoritesState(favorites: [
        Favorite(
            name: 'test',
            url: 'url',
            pokemon: PokemonDetail(
                id: 1,
                height: 2,
                weight: 2,
                stats: [],
                types: [],
                abilities: []))
      ]));

      await tester.pumpWidget(
        MaterialApp.router(
          routerConfig: GoRouter(initialLocation: '/', routes: [
            GoRoute(
              path: '/',
              builder: (context, state) => MultiBlocProvider(
                providers: [
                  BlocProvider<HomeBloc>.value(value: homeBloc),
                  BlocProvider<FavoritesBloc>.value(value: favoritesBloc),
                ],
                child: const Scaffold(body: HomeView()),
              ),
            )
          ]),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('_favoriteListWidget')), findsOneWidget);
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('_pokeCardTapToPokemonDetail')));
    });

    testWidgets('Render _generation_list', (tester) async {
      when(() => homeBloc.state).thenReturn(
        HomeState(
            currentTab: 0,
            loading: false,
            generations: [Generation(name: "TETS", url: "url")]),
      );

      when(() => favoritesBloc.state).thenReturn(
        const FavoritesState(),
      );

      await tester.pumpWidget(
        MaterialApp.router(
          routerConfig: GoRouter(routes: [
            GoRoute(
              path: '/',
              builder: (context, state) => MultiBlocProvider(
                providers: [
                  BlocProvider<HomeBloc>.value(value: homeBloc),
                  BlocProvider<FavoritesBloc>.value(value: favoritesBloc),
                ],
                child: const Scaffold(body: HomeView()),
              ),
            )
          ]),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('_listGenerationBody')), findsOneWidget);
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('_ButtonToGenerationDetail')));
    });
  });
}
