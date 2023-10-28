// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonDetail _$PokemonDetailFromJson(Map<String, dynamic> json) =>
    PokemonDetail(
      id: json['id'] as int,
      height: json['height'] as int,
      weight: json['weight'] as int,
      stats: (json['stats'] as List<dynamic>)
          .map((e) => Stats.fromJson(e as Map<String, dynamic>))
          .toList(),
      types: (json['types'] as List<dynamic>)
          .map((e) => Types.fromJson(e as Map<String, dynamic>))
          .toList(),
      abilities: (json['abilities'] as List<dynamic>)
          .map((e) => Abilities.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokemonDetailToJson(PokemonDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'height': instance.height,
      'weight': instance.weight,
      'stats': instance.stats,
      'types': instance.types,
      'abilities': instance.abilities,
    };

Stats _$StatsFromJson(Map<String, dynamic> json) => Stats(
      baseStat: json['base_stat'] as int,
      effort: json['effort'] as int,
      stat: Stat.fromJson(json['stat'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StatsToJson(Stats instance) => <String, dynamic>{
      'base_stat': instance.baseStat,
      'effort': instance.effort,
      'stat': instance.stat,
    };

Stat _$StatFromJson(Map<String, dynamic> json) => Stat(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$StatToJson(Stat instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

Types _$TypesFromJson(Map<String, dynamic> json) => Types(
      slot: json['slot'] as int,
      type: Type.fromJson(json['type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TypesToJson(Types instance) => <String, dynamic>{
      'slot': instance.slot,
      'type': instance.type,
    };

Type _$TypeFromJson(Map<String, dynamic> json) => Type(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$TypeToJson(Type instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

Abilities _$AbilitiesFromJson(Map<String, dynamic> json) => Abilities(
      isHidden: json['is_hidden'] as bool,
      slot: json['slot'] as int,
      ability: Ability.fromJson(json['ability'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AbilitiesToJson(Abilities instance) => <String, dynamic>{
      'is_hidden': instance.isHidden,
      'slot': instance.slot,
      'ability': instance.ability,
    };

Ability _$AbilityFromJson(Map<String, dynamic> json) => Ability(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$AbilityToJson(Ability instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
