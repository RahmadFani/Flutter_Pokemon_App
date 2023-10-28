import 'dart:async';
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:esensi_solusi_buana_test/modules/generation_detail/models/models.dart';
import 'package:flutter/services.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';

part 'generation_detail_state.dart';
part 'generation_detail_event.dart';
part 'generation_detail_bloc.g.dart';

class GenerationDetailBloc
    extends HydratedBloc<GenerationDetailEvent, GenerationDetailState> {
  final String name;
  final String url;

  GenerationDetailBloc({
    required this.name,
    required this.url,
  }) : super(const GenerationDetailState()) {
    on<GetGenerationDetail>(_mapGetGenerationDetail);
  }

  @override
  GenerationDetailState? fromJson(Map<String, dynamic> json) {
    return _$GenerationDetailStateFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(GenerationDetailState state) {
    return _$GenerationDetailStateToJson(state);
  }

  @override
  String get id => url;

  FutureOr<void> _mapGetGenerationDetail(
      GetGenerationDetail event, Emitter<GenerationDetailState> emit) async {
    try {
      final data = await _fetchGenerationDetail();
      emit(state.copyWith(detail: data, loading: false));
    } catch (e) {
      String msg = '';
      if (e is PlatformException) {
        msg = e.message ?? '-';
      } else {
        msg =
            'Your connection trouble\nfor accessing offline mode you need load the data first';
      }
      emit(
        state.copyWith(errorMessage: msg, loading: false),
      );
    }
  }

  Future<GenerationDetail> _fetchGenerationDetail() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      return GenerationDetail.fromJson(body);
    }
    throw Exception('error fetching generation detail');
  }
}
