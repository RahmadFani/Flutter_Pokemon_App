// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'pokemon_detail_cubit.dart';

@JsonSerializable()
class PokemonDetailState extends Equatable {
  final String url;
  final String name;

  final PokemonDetail? pokemon;

  @JsonKey(includeFromJson: false, includeToJson: false)
  final String errorMessage;

  const PokemonDetailState({
    this.pokemon,
    required this.url,
    required this.name,
    this.errorMessage = '',
  });
  @override
  List<Object?> get props => [
        url,
        name,
        errorMessage,
        pokemon,
      ];

  static String setImageUrl(String id) =>
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';

  String get imageUrl => setImageUrl(
        url.split('/').where((e) => e.isNotEmpty).toList().last,
      );

  PokemonDetailState copyWith({
    String? url,
    String? name,
    PokemonDetail? pokemon,
    String? errorMessage,
  }) {
    return PokemonDetailState(
      url: url ?? this.url,
      name: name ?? this.name,
      pokemon: pokemon ?? this.pokemon,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
