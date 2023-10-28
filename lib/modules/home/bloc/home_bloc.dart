import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends HydratedBloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<GettingListGeneration>(_gettingListGeneration);
  }

  @override
  HomeState? fromJson(Map<String, dynamic> json) {
    return null;
  }

  @override
  Map<String, dynamic>? toJson(HomeState state) {
    return null;
  }

  FutureOr<void> _gettingListGeneration(
      HomeEvent event, Emitter<HomeState> emit) {
    print('TETS GEENEREATION0');
  }
}
