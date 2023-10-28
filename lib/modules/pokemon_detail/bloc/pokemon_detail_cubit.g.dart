// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_detail_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonDetailState _$PokemonDetailStateFromJson(Map<String, dynamic> json) =>
    PokemonDetailState(
      pokemon: json['pokemon'] == null
          ? null
          : PokemonDetail.fromJson(json['pokemon'] as Map<String, dynamic>),
      url: json['url'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$PokemonDetailStateToJson(PokemonDetailState instance) =>
    <String, dynamic>{
      'url': instance.url,
      'name': instance.name,
      'pokemon': instance.pokemon,
    };
