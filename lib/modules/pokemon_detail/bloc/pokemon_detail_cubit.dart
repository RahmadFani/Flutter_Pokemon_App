import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'pokemon_detail_state.dart';
part 'pokemon_detail_event.dart';

class PokemonDetailBloc
    extends HydratedBloc<PokemonDetailEvent, PokemonDetailState> {
  PokemonDetailBloc() : super(PokemonDetailState()) {
    // TODO
  }

  @override
  PokemonDetailState? fromJson(Map<String, dynamic> json) {
    return null;
  }

  @override
  Map<String, dynamic>? toJson(PokemonDetailState state) {
    return null;
  }
}
