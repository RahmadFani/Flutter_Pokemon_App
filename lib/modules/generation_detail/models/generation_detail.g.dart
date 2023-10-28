// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generation_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenerationDetail _$GenerationDetailFromJson(Map<String, dynamic> json) =>
    GenerationDetail(
      id: json['id'] as int,
      name: json['name'] as String,
      mainRegion:
          MainRegion.fromJson(json['main_region'] as Map<String, dynamic>),
      pokemons: (json['pokemon_species'] as List<dynamic>?)
              ?.map((e) => PokemonSpesies.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$GenerationDetailToJson(GenerationDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'main_region': instance.mainRegion,
      'pokemon_species': instance.pokemons,
    };

MainRegion _$MainRegionFromJson(Map<String, dynamic> json) => MainRegion(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$MainRegionToJson(MainRegion instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

PokemonSpesies _$PokemonSpesiesFromJson(Map<String, dynamic> json) =>
    PokemonSpesies(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$PokemonSpesiesToJson(PokemonSpesies instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
