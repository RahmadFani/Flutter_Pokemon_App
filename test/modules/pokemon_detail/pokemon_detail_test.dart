import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:esensi_solusi_buana_test/modules/favorites/bloc/favorites_bloc.dart';
import 'package:esensi_solusi_buana_test/modules/pokemon_detail/bloc/pokemon_detail_cubit.dart';
import 'package:esensi_solusi_buana_test/modules/pokemon_detail/models/pokemon_detail.dart';
import 'package:esensi_solusi_buana_test/modules/pokemon_detail/pokemon_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/hydrated_bloc.dart';
import '../../helpers/injection.dart';

class MockPokemonDetailBloc
    extends MockBloc<PokemonDetailEvent, PokemonDetailState>
    implements PokemonDetailBloc {}

class MockFavoritesBloc extends MockBloc<FavoritesEvent, FavoritesState>
    implements FavoritesBloc {}

void main() {
  initHydratedStorage();
  injectionUnit();

  late PokemonDetailBloc pokemonDetailBloc;
  late FavoritesBloc favoritesBloc;

  setUp(() {
    pokemonDetailBloc = MockPokemonDetailBloc();
    favoritesBloc = MockFavoritesBloc();
  });

  setUpAll(() {
    // ↓ required to avoid HTTP error 400 mocked returns
    HttpOverrides.global = null;
  });

  group('Pokemon Detail', () {
    testWidgets('Renders Pokemon View', (tester) async {
      await tester.pumpWidget(
        MaterialApp.router(
          routerConfig: GoRouter(routes: [
            GoRoute(
              path: '/',
              builder: (context, state) => const PokemonDetailPage(
                name: 'a',
                url: 'url',
              ),
            )
          ]),
        ),
      );
      await tester.pump(const Duration(seconds: 10));
      expect(find.byType(PokemonDetailView), findsOneWidget);
    });

    testWidgets('Renders _CardPokemon', (tester) async {
      when(() => pokemonDetailBloc.state).thenReturn(
        PokemonDetailState(
          url: 'url',
          name: 'name',
          pokemon: PokemonDetail(
            id: 1,
            height: 2,
            weight: 2,
            stats: [],
            abilities: [],
            types: [],
          ),
        ),
      );

      when(() => favoritesBloc.state).thenReturn(
        const FavoritesState(
          favorites: [],
        ),
      );

      await tester.pumpWidget(
        MaterialApp.router(
          routerConfig: GoRouter(routes: [
            GoRoute(
              path: '/',
              builder: (context, state) => MultiBlocProvider(
                providers: [
                  BlocProvider.value(value: pokemonDetailBloc),
                  BlocProvider.value(value: favoritesBloc)
                ],
                child: const PokemonDetailView(),
              ),
            )
          ]),
        ),
      );
      await tester.pump(const Duration(seconds: 10));
      expect(find.byKey(const Key('_PokemonCard_Detail')), findsOneWidget);
    });
  });
}
