// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:esensi_solusi_buana_test/modules/pokemon_detail/models/pokemon_detail.dart';
import 'package:json_annotation/json_annotation.dart';

part 'favorite.g.dart';

@JsonSerializable()
class Favorite {
  final String name;
  final String url;
  final PokemonDetail pokemon;
  Favorite({
    required this.name,
    required this.url,
    required this.pokemon,
  });

  factory Favorite.fromJson(Map<String, dynamic> json) =>
      _$FavoriteFromJson(json);

  Map<String, dynamic> toJson() => _$FavoriteToJson(this);

  static String setImageUrl(String id) =>
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';

  String get imageUrl => setImageUrl(
        url.split('/').where((e) => e.isNotEmpty).toList().last,
      );
}
