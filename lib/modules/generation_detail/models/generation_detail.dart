// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
part 'generation_detail.g.dart';

@JsonSerializable()
class GenerationDetail {
  final int id;
  final String name;
  @JsonKey(name: 'main_region')
  final MainRegion mainRegion;
  @JsonKey(name: 'pokemon_species')
  final List<PokemonSpesies> pokemons;
  GenerationDetail({
    required this.id,
    required this.name,
    required this.mainRegion,
    this.pokemons = const [],
  });

  factory GenerationDetail.fromJson(Map<String, dynamic> json) =>
      _$GenerationDetailFromJson(json);

  Map<String, dynamic> toJson() => _$GenerationDetailToJson(this);
}

@JsonSerializable()
class MainRegion {
  final String name;
  final String url;

  MainRegion({
    required this.name,
    required this.url,
  });

  factory MainRegion.fromJson(Map<String, dynamic> json) =>
      _$MainRegionFromJson(json);

  Map<String, dynamic> toJson() => _$MainRegionToJson(this);
}

@JsonSerializable()
class PokemonSpesies {
  final String name;
  final String url;
  PokemonSpesies({
    required this.name,
    required this.url,
  });

  factory PokemonSpesies.fromJson(Map<String, dynamic> json) =>
      _$PokemonSpesiesFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonSpesiesToJson(this);

  static String setImageUrl(String id) =>
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';

  String get imageUrl => setImageUrl(
        url.split('/').where((e) => e.isNotEmpty).toList().last,
      );
}
