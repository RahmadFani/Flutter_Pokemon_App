import 'dart:async';

import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:esensi_solusi_buana_test/modules/favorites/models/favorite.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';
part 'favorites_bloc.g.dart';

class FavoritesBloc extends HydratedBloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc() : super(const FavoritesState()) {
    on<SetFavorite>(_mapSetFavorite);
  }

  @override
  FavoritesState? fromJson(Map<String, dynamic> json) {
    return _$FavoritesStateFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(FavoritesState state) {
    return _$FavoritesStateToJson(state);
  }

  FutureOr<void> _mapSetFavorite(
      SetFavorite event, Emitter<FavoritesState> emit) {
    List<Favorite> list = List<Favorite>.from(state.favorites);

    final fav =
        list.firstWhereOrNull((element) => element.url == event.favorite.url);
    if (fav != null) {
      emit(
        state.copyWith(
          favorites: [
            ...list..removeWhere((element) => element.url == event.favorite.url)
          ],
        ),
      );
    } else {
      emit(
        state.copyWith(
          favorites: [
            ...list,
            event.favorite,
          ],
        ),
      );
    }
  }
}
