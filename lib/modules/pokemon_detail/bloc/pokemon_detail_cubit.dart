import 'dart:async';
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:esensi_solusi_buana_test/helpers/base_url.dart';
import 'package:esensi_solusi_buana_test/modules/generation_detail/models/generation_detail.dart';
import 'package:esensi_solusi_buana_test/modules/pokemon_detail/models/pokemon_detail.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;

part 'pokemon_detail_state.dart';
part 'pokemon_detail_event.dart';
part 'pokemon_detail_cubit.g.dart';

class PokemonDetailBloc
    extends HydratedBloc<PokemonDetailEvent, PokemonDetailState> {
  PokemonDetailBloc({
    required this.name,
    required this.url,
    this.pokemons = const [],
  }) : super(PokemonDetailState(
          name: name,
          url: url,
        )) {
    on<GetPokemonDetail>(_mapGetPokemonDetail);
  }

  final String name;
  final String url;
  final List<PokemonSpesies> pokemons;

  String get pokemonId =>
      url.split('/').where((e) => e.isNotEmpty).toList().last;

  @override
  PokemonDetailState? fromJson(Map<String, dynamic> json) {
    return _$PokemonDetailStateFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(PokemonDetailState state) {
    return _$PokemonDetailStateToJson(state);
  }

  @override
  String get id => url;

  FutureOr<void> _mapGetPokemonDetail(
      GetPokemonDetail event, Emitter<PokemonDetailState> emit) async {
    try {
      final data = await _fetchPokemonDetail();
      emit(state.copyWith(pokemon: data));
    } catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<PokemonDetail> _fetchPokemonDetail() async {
    final response = await http
        .get(
      BaseUrl.getPokemon(pokemonId),
    )
        .timeout(
      10.seconds,
      onTimeout: () {
        return Future.error(
            'Trouble internet, Mode offline available if you already load data');
      },
    );

    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      return PokemonDetail.fromJson(body);
    }
    return Future.error(
        'Trouble internet, Mode offline available if you already load data');
  }
}
