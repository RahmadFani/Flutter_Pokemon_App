// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
part 'pokemon_detail.g.dart';

@JsonSerializable()
class PokemonDetail {
  final int id;
  final int height;
  final int weight;
  final List<Stats> stats;
  final List<Types> types;
  final List<Abilities> abilities;
  PokemonDetail({
    required this.id,
    required this.height,
    required this.weight,
    required this.stats,
    required this.types,
    required this.abilities,
  });

  factory PokemonDetail.fromJson(Map<String, dynamic> json) =>
      _$PokemonDetailFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonDetailToJson(this);
}

@JsonSerializable()
class Stats {
  @JsonKey(name: 'base_stat')
  final int baseStat;
  final int effort;
  final Stat stat;

  Stats({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });

  factory Stats.fromJson(Map<String, dynamic> json) => _$StatsFromJson(json);

  Map<String, dynamic> toJson() => _$StatsToJson(this);
}

@JsonSerializable()
class Stat {
  final String name;
  final String url;

  Stat({
    required this.name,
    required this.url,
  });

  factory Stat.fromJson(Map<String, dynamic> json) => _$StatFromJson(json);

  Map<String, dynamic> toJson() => _$StatToJson(this);
}

@JsonSerializable()
class Types {
  final int slot;
  final Type type;
  Types({
    required this.slot,
    required this.type,
  });

  factory Types.fromJson(Map<String, dynamic> json) => _$TypesFromJson(json);

  Map<String, dynamic> toJson() => _$TypesToJson(this);
}

@JsonSerializable()
class Type {
  final String name;
  final String url;

  Type({
    required this.name,
    required this.url,
  });

  factory Type.fromJson(Map<String, dynamic> json) => _$TypeFromJson(json);

  Map<String, dynamic> toJson() => _$TypeToJson(this);
}

@JsonSerializable()
class Abilities {
  @JsonKey(name: 'is_hidden')
  final bool isHidden;
  final int slot;
  final Ability ability;

  Abilities({
    required this.isHidden,
    required this.slot,
    required this.ability,
  });

  factory Abilities.fromJson(Map<String, dynamic> json) =>
      _$AbilitiesFromJson(json);

  Map<String, dynamic> toJson() => _$AbilitiesToJson(this);
}

@JsonSerializable()
class Ability {
  final String name;
  final String url;

  Ability({
    required this.name,
    required this.url,
  });

  factory Ability.fromJson(Map<String, dynamic> json) =>
      _$AbilityFromJson(json);

  Map<String, dynamic> toJson() => _$AbilityToJson(this);
}
