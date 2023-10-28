import 'dart:async';
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:esensi_solusi_buana_test/helpers/base_url.dart';
import 'package:esensi_solusi_buana_test/modules/home/models/generation.dart';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.g.dart';

class HomeBloc extends HydratedBloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<GettingListGeneration>(_gettingListGeneration);
    on<ChangeCurrentTabHome>(_changeCurrentTabHome);
  }

  @override
  HomeState? fromJson(Map<String, dynamic> json) {
    return _$HomeStateFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(HomeState state) {
    return _$HomeStateToJson(state);
  }

  FutureOr<void> _gettingListGeneration(
      HomeEvent event, Emitter<HomeState> emit) async {
    try {
      final list = await _fetchGenerations();

      emit(
        state.copyWith(generations: list, loading: false),
      );
    } catch (e) {
      // DO ERROR IN HERE
    }
  }

  FutureOr<void> _changeCurrentTabHome(
      ChangeCurrentTabHome event, Emitter<HomeState> emit) {
    emit(state.copyWith(currentTab: event.value));
  }

  Future<List<Generation>> _fetchGenerations() async {
    final response = await http.get(
      BaseUrl.generationUri,
    );
    if (response.statusCode == 200) {
      final body = json.decode(response.body)['results'] as List;
      return body
          .map((json) => Generation(name: json['name'], url: json['url']))
          .toList();
    }
    throw Exception('error fetching generations');
  }
}
