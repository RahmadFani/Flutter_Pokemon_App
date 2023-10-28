// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generation_detail_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenerationDetailState _$GenerationDetailStateFromJson(
        Map<String, dynamic> json) =>
    GenerationDetailState(
      loading: json['loading'] as bool? ?? false,
      detail: json['detail'] == null
          ? null
          : GenerationDetail.fromJson(json['detail'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GenerationDetailStateToJson(
        GenerationDetailState instance) =>
    <String, dynamic>{
      'loading': instance.loading,
      'detail': instance.detail,
    };
