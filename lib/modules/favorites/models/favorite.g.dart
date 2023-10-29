// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Favorite _$FavoriteFromJson(Map<String, dynamic> json) => Favorite(
      name: json['name'] as String,
      url: json['url'] as String,
      pokemon: PokemonDetail.fromJson(json['pokemon'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FavoriteToJson(Favorite instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
      'pokemon': instance.pokemon,
    };
